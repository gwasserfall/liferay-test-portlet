package com.test.portlet.commands;

import com.liferay.document.library.kernel.model.DLFileEntry;
import com.liferay.document.library.kernel.service.DLFileEntryLocalServiceUtil;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.json.JSONFactory;
import com.liferay.portal.kernel.json.JSONObject;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.portlet.PortletResponseUtil;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCResourceCommand;
import com.liferay.portal.kernel.upload.UploadPortletRequest;
import com.liferay.portal.kernel.util.Portal;
import com.liferay.portal.kernel.util.PortalUtil;
import com.liferay.portal.kernel.util.Validator;
import org.osgi.service.component.annotations.Component;
import org.osgi.service.component.annotations.Reference;

import javax.portlet.PortletException;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;
import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

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

		try {
			DLFileEntry file = DLFileEntryLocalServiceUtil.getDLFileEntry(33620);

//			file.getExpandoBridge().
			
//			ExpandoBridgeFactoryUtil.getExpandoBridge()

		} catch (PortalException e) {
			e.printStackTrace();
		}


//		while(parameters.hasMoreElements()) {
//			String parameterName = parameters.nextElement();
//			try {
//				System.out.print(parameterName + " = ");
//				System.out.println(uploadPortletRequest.getParameter(parameterName));
//			} catch (Exception e) {
//				System.out.println(e.getMessage());
//			}
//		}

		File file = uploadPortletRequest.getFile("file");

		// Actual filename
		String fileName = uploadPortletRequest.getFullFileName("file");

		if (Validator.isNotNull(fileName)) {
			// Temp file added to server, full path
			System.out.println("File path = " + file.getPath());


			System.out.println("File name = " + fileName);
		} else {
			System.out.println("No file found, :(");
		}


		response.put("status", 200);
		response.put("message", "Some poo happened");

		try {
			PortletResponseUtil.write(resourceResponse, response.toJSONString());
		} catch (IOException e) {
			e.printStackTrace();
		}

		return true;
	}



}