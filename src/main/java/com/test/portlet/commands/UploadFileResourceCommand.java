package com.test.portlet.commands;

import com.liferay.document.library.kernel.model.DLFileEntry;
import com.liferay.document.library.kernel.model.DLFolderConstants;
import com.liferay.document.library.kernel.service.DLAppLocalServiceUtil;
import com.liferay.document.library.kernel.service.DLAppServiceUtil;
import com.liferay.document.library.kernel.service.DLFileEntryLocalServiceUtil;
import com.liferay.document.library.kernel.service.DLFileEntryServiceUtil;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.json.JSONFactory;
import com.liferay.portal.kernel.json.JSONObject;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.portlet.PortletResponseUtil;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCResourceCommand;
import com.liferay.portal.kernel.repository.model.FileEntry;
import com.liferay.portal.kernel.repository.model.Folder;
import com.liferay.portal.kernel.service.ServiceContext;
import com.liferay.portal.kernel.service.ServiceContextFactory;
import com.liferay.portal.kernel.theme.ThemeDisplay;
import com.liferay.portal.kernel.upload.UploadPortletRequest;
import com.liferay.portal.kernel.util.*;
import org.osgi.service.component.annotations.Component;
import org.osgi.service.component.annotations.Reference;

import javax.portlet.PortletException;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;
import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

@Component(
	immediate = true,
	property = {
		"javax.portlet.name=TestUpload",
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
		Enumeration<String> parameters = uploadPortletRequest.getParameterNames();

		System.out.println(PortalUtil.getDefaultCompanyId());


		File file = uploadPortletRequest.getFile("file");

		String fileName = uploadPortletRequest.getFullFileName("file");

		ThemeDisplay themeDisplay = (ThemeDisplay) resourceRequest.getAttribute(WebKeys.THEME_DISPLAY);


		long groupId = themeDisplay.getScopeGroupId();

		String fileTitle = uploadPortletRequest.getParameter("Title");


		try {
			ServiceContext serviceContext = ServiceContextFactory.getInstance(DLFileEntry.class.getName(), resourceRequest);
			String contentType = uploadPortletRequest.getContentType("file");
//			String changeLog = ParamUtil.getString(actionRequest, "changeLog");

//			Map<String, Serializable> customFields = new HashMap<>();
//			customFields.put("Document Type", "asd");
//			serviceContext.setExpandoBridgeAttributes(customFields);


			Folder librariesFolder = DLAppServiceUtil.getFolder(
					groupId, DLFolderConstants.DEFAULT_PARENT_FOLDER_ID, "Libraries");

			Folder cerebraRepoFolder = DLAppServiceUtil.getFolder(
					groupId, librariesFolder.getFolderId(), "Flat Folder 2");


//			System.out.println(folder);




			System.out.println(themeDisplay.getUser());

			FileEntry fileEntry = DLAppLocalServiceUtil.addFileEntry(
					themeDisplay.getUserId(), 			// UserID
					groupId, 							// GroupID
					cerebraRepoFolder.getFolderId(),	// FolderID
					fileName,							// FileName
					contentType,						// File Content Type
					fileTitle,							// File Title
					"",						// File Description
					"",						// Change Log
					file,								// File Object
					serviceContext);					// Service Context :: Add Expando here?

			System.out.println(fileEntry);

		} catch (PortalException e) {
			e.printStackTrace();
		}




		while(parameters.hasMoreElements()) {
			String parameterName = parameters.nextElement();
			try {
				System.out.print(parameterName + " = ");
				System.out.println(uploadPortletRequest.getParameter(parameterName));
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}

		if (Validator.isNotNull(fileName)) {
			// Temp file added to server, full path
			System.out.println("File path = " + file.getPath());


			System.out.println("File name = " + fileName);
		} else {
			System.out.println("No file found, :(");
		}


		response.put("status", 200);
		response.put("message", "Some poo happened");

		return sendResponse(resourceResponse, response);
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