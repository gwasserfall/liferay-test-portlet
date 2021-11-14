package com.test.portlet.commands;

import com.liferay.document.library.kernel.model.DLFileEntry;
import com.liferay.document.library.kernel.service.DLAppLocalServiceUtil;
import com.liferay.document.library.kernel.service.DLAppServiceUtil;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.json.JSONFactory;
import com.liferay.portal.kernel.json.JSONObject;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.model.User;
import com.liferay.portal.kernel.model.UserGroup;
import com.liferay.portal.kernel.portlet.PortletResponseUtil;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCResourceCommand;
import com.liferay.portal.kernel.repository.model.FileEntry;
import com.liferay.portal.kernel.repository.model.Folder;
import com.liferay.portal.kernel.service.*;
import com.liferay.portal.kernel.theme.ThemeDisplay;
import com.liferay.portal.kernel.upload.UploadPortletRequest;
import com.liferay.portal.kernel.util.*;
import com.test.portlet.utils.Email;
import org.osgi.service.component.annotations.Component;
import org.osgi.service.component.annotations.Reference;

import javax.portlet.PortletException;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;
import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

@Component(
	immediate = true,
	property = {
		"javax.portlet.name=CerebraUpload",
		"mvc.command.name=/cerebra/upload"
	},
	service = MVCResourceCommand.class
)
public class UploadFileResourceCommand implements MVCResourceCommand {

	private static final Log _log = LogFactoryUtil.getLog(UploadFileResourceCommand.class);

	@Reference
	private Portal _portal;

	@Reference
	private JSONFactory _jsonFactory;

	@Override
	public boolean serveResource(
			ResourceRequest resourceRequest, ResourceResponse resourceResponse)
		throws PortletException {

		JSONObject response = _jsonFactory.createJSONObject();

		UploadPortletRequest uploadPortletRequest = _portal.getUploadPortletRequest(resourceRequest);
		ThemeDisplay themeDisplay = (ThemeDisplay) resourceRequest.getAttribute(WebKeys.THEME_DISPLAY);

		File 	file = uploadPortletRequest.getFile("file");
		String 	fileTitle = uploadPortletRequest.getParameter("title");
		String	fileDescription = uploadPortletRequest.getParameter("description");
		String 	fileName = uploadPortletRequest.getFullFileName("file");
		String 	contentType = uploadPortletRequest.getContentType("file");

		try {

			ServiceContext serviceContext = ServiceContextFactory.getInstance(
					DLFileEntry.class.getName(), resourceRequest);

			long folderId = Long.parseLong(uploadPortletRequest.getParameter("cerebra_folder"));

			Folder libraryFolder = DLAppServiceUtil.getFolder(folderId);
			FileEntry fileEntry = DLAppLocalServiceUtil.addFileEntry(
					themeDisplay.getUserId(), 			// UserID
					themeDisplay.getScopeGroupId(),		// GroupID
					libraryFolder.getFolderId(),		// FolderID
					fileName,							// FileName
					contentType,						// File Content Type
					fileTitle,							// File Title
					fileDescription,					// File Description
					"",						// Change Log
					file,								// File Object
					serviceContext);					// Service Context

			// Set hard defaults
			fileEntry.getExpandoBridge().setAttribute("Cerebra_folder", libraryFolder.getName());
			fileEntry.getExpandoBridge().setAttribute("A_Cerebra_File", true);

			assignCustomFields(uploadPortletRequest, fileEntry);

			// TODO :: Only send if published is false
			// Send verification email to admins
			User uploadUser = PortalUtil.getUser(resourceRequest);
			UserGroup adminUserGroup = UserGroupLocalServiceUtil.getUserGroup(
					PortalUtil.getDefaultCompanyId(), "Cerebra Admin");
			List<User> adminUsers = UserLocalServiceUtil.getUserGroupUsers(adminUserGroup.getUserGroupId());

			try {
				for (User admin : adminUsers) {
					Email.sendMail(admin.getEmailAddress(), uploadUser, fileEntry);
					_log.info("Cerebra file verification email sent to : " + admin.getEmailAddress());
				}
			} catch( Exception e) {
				_log.error("Cerebra error : " + e.getMessage());
				response.put("error", "Could not send emails");
			}

		} catch (PortalException e) {
			_log.error(e);
			e.printStackTrace();
		} catch (Exception e) {
			_log.info("Cerebra Exception : " + e.getMessage());
			response.put("status", 500);
			response.put("message", e);
			return sendResponse(resourceResponse, response);
		}

		response.put("status", 200);
		response.put("message", "File Uploaded Successfully");

		return sendResponse(resourceResponse, response);
	}

	private void assignCustomFields(UploadPortletRequest request, FileEntry file) {

		Enumeration<String> fieldNames = request.getParameterNames();

		while(fieldNames.hasMoreElements()) {
			String parameterName = fieldNames.nextElement();

			_log.info("Processing custom field : " + parameterName);

			if (!parameterName.startsWith("cf_")) {
				continue;
			}

			try {
				String customFieldName = parameterName.substring(3);
				String customFieldValue = request.getParameter(parameterName);
				_log.info(parameterName + " = " + customFieldValue);
				file.getExpandoBridge().setAttribute(customFieldName, customFieldValue);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}

	private boolean sendResponse(ResourceResponse resourceResponse, JSONObject responseJson) {

		try {
			PortletResponseUtil.write(resourceResponse, responseJson.toJSONString());
		} catch (IOException e) {
			e.printStackTrace();
		}

		return true;
	}


}