package com.test.portlet.commands;

import com.liferay.document.library.kernel.service.DLFileEntryLocalServiceUtil;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.json.JSONArray;
import com.liferay.portal.kernel.json.JSONFactory;
import com.liferay.portal.kernel.json.JSONObject;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.portlet.PortletResponseUtil;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCResourceCommand;

import com.liferay.document.library.kernel.model.DLFileEntry;

import javax.portlet.PortletException;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import com.liferay.portal.kernel.upload.UploadPortletRequest;

import com.liferay.portal.kernel.util.Portal;
import com.liferay.portal.kernel.util.PortalUtil;
import com.liferay.portal.kernel.util.Validator;
import org.osgi.service.component.annotations.Component;
import org.osgi.service.component.annotations.Reference;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

@Component(
	immediate = true,
	property = {
		"javax.portlet.name=TestUpload",
		"mvc.command.name=/cerebra/fields"
	},
	service = MVCResourceCommand.class
)
public class GetCustomFieldsResourceCommand implements MVCResourceCommand {

	private static final Log _log = LogFactoryUtil.getLog(GetCustomFieldsResourceCommand.class);

	@Reference
	private Portal _portal;

	@Reference
	private JSONFactory _jsonFactory;

	@Override
	public boolean serveResource(
			ResourceRequest resourceRequest, ResourceResponse resourceResponse)
		throws PortletException {

		JSONObject response = _jsonFactory.createJSONObject();

		JSONArray documentTypeValues = _jsonFactory.createJSONArray();

		documentTypeValues.put("name1");
		documentTypeValues.put("name2");
		documentTypeValues.put("name3");
		documentTypeValues.put("name4");
		documentTypeValues.put("name5");
		documentTypeValues.put("name6");
		documentTypeValues.put("name7");

		JSONObject fields = _jsonFactory.createJSONObject();

		fields.put("documentTypes", documentTypeValues);

		response.put("status", 200);
		response.put("fields", fields);

		try {
			PortletResponseUtil.write(resourceResponse, response.toJSONString());
		} catch (IOException e) {
			e.printStackTrace();
		}

		return true;
	}



}