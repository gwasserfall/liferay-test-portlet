package com.test.portlet.commands;

import com.liferay.document.library.kernel.service.DLFileEntryLocalServiceUtil;
import com.liferay.expando.kernel.model.ExpandoColumn;
import com.liferay.expando.kernel.model.ExpandoRow;
import com.liferay.expando.kernel.model.ExpandoTable;
import com.liferay.expando.kernel.service.ExpandoColumnLocalService;
import com.liferay.expando.kernel.service.ExpandoColumnLocalServiceUtil;
import com.liferay.expando.kernel.service.ExpandoRowLocalServiceUtil;
import com.liferay.expando.kernel.service.ExpandoTableLocalServiceUtil;
import com.liferay.expando.kernel.util.ExpandoBridgeUtil;
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

import com.liferay.portal.kernel.service.ClassNameLocalServiceUtil;
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
import java.util.List;
import java.util.Locale;

@Component(
	immediate = true,
	property = {
		"javax.portlet.name=CerebraUpload",
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
		JSONArray data = _jsonFactory.createJSONArray();

		// Get the DLFileEntry Model Class, get the ID based on this instance
		long dlFileEntryId = ClassNameLocalServiceUtil.getClassNameId(DLFileEntry.class.getName());

		try {

			ExpandoTable table = ExpandoTableLocalServiceUtil.getDefaultTable(
					PortalUtil.getDefaultCompanyId(),
					dlFileEntryId );

			List<ExpandoColumn> customFields = ExpandoColumnLocalServiceUtil.getColumns(table.getTableId());

			for (ExpandoColumn field: customFields) {

				JSONObject column = _jsonFactory.createJSONObject();
				column.put("type", field.getTypeSettingsProperties().getProperty("display-type"));
				column.put("id", "cf_" + field.getName());
				column.put("displayName", (field.getDisplayName(Locale.US)));

				String defaultValues = field.getDefaultData();

				JSONArray defaults = _jsonFactory.createJSONArray();

				if (defaultValues.length() > 0) {

					// Replace nested commas
					for (String value : defaultValues.split(",")) {
						defaults.put(value.replace("[$LIFERAY_EXPANDO_COMMA$]", ","));
					}
				}

				column.put("predefinedValues", defaults);

				// TODO: Check if field is required or not, from static list
				column.put("required", false);
				data.put(column);
			}
		} catch (PortalException e) {
			e.printStackTrace();
		}

		try {
			PortletResponseUtil.write(resourceResponse, data.toJSONString());
		} catch (IOException e) {
			e.printStackTrace();
		}

		return true;
	}



}