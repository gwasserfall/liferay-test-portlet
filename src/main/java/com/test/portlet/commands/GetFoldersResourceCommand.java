package com.test.portlet.commands;

import com.liferay.document.library.kernel.model.DLFileEntry;
import com.liferay.document.library.kernel.model.DLFileEntryType;
import com.liferay.document.library.kernel.model.DLFolder;
import com.liferay.document.library.kernel.model.DLFolderConstants;
import com.liferay.document.library.kernel.service.DLAppLocalService;
import com.liferay.document.library.kernel.service.DLAppLocalServiceUtil;
import com.liferay.document.library.kernel.service.DLFileEntryTypeLocalServiceUtil;
import com.liferay.document.library.kernel.service.DLFolderLocalServiceUtil;
import com.liferay.document.library.kernel.service.persistence.DLFolderUtil;
import com.liferay.document.library.kernel.util.DLUtil;
import com.liferay.dynamic.data.mapping.kernel.DDMStructure;
import com.liferay.expando.kernel.model.ExpandoColumn;
import com.liferay.expando.kernel.model.ExpandoTable;
import com.liferay.expando.kernel.service.ExpandoColumnLocalServiceUtil;
import com.liferay.expando.kernel.service.ExpandoTableLocalServiceUtil;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.json.JSONArray;
import com.liferay.portal.kernel.json.JSONFactory;
import com.liferay.portal.kernel.json.JSONObject;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.portlet.PortletResponseUtil;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCResourceCommand;
import com.liferay.portal.kernel.service.ClassNameLocalServiceUtil;
import com.liferay.portal.kernel.service.GroupLocalServiceUtil;
import com.liferay.portal.kernel.theme.ThemeDisplay;
import com.liferay.portal.kernel.util.Portal;
import com.liferay.portal.kernel.util.PortalUtil;
import org.osgi.service.component.annotations.Component;
import org.osgi.service.component.annotations.Reference;

import javax.portlet.PortletException;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;
import java.io.IOException;
import java.util.List;

@Component(
        immediate = true,
        property = {
                "javax.portlet.name=CerebraUpload",
                "mvc.command.name=/cerebra/folders"
        },
        service = MVCResourceCommand.class
)
public class GetFoldersResourceCommand implements MVCResourceCommand {

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

        try {













            long groupId = GroupLocalServiceUtil.getCompanyGroup(PortalUtil.getDefaultCompanyId()).getGroupId();
            List<DLFolder> dlFolders = DLFolderLocalServiceUtil.getDLFolders(0,
                                       DLFolderLocalServiceUtil.getDLFoldersCount());

            DLFolder librariesFolder = null;
            for (DLFolder folder : dlFolders) {
                if (folder.getName().equalsIgnoreCase("libraries")) {
                    librariesFolder = folder;
                    break;
                }
            }



            if (librariesFolder == null) throw new AssertionError("Libraries folder not found");

            List<DLFolder> subFolders = DLFolderLocalServiceUtil.getFolders(librariesFolder.getGroupId(),
                    librariesFolder.getFolderId());

            for (DLFolder folder : subFolders) {
                JSONObject entry = _jsonFactory.createJSONObject();
                entry.put("id", folder.getFolderId());
                entry.put("name", folder.getName());
                data.put(entry);
            }

        } catch (PortalException e) {
            e.printStackTrace();
        }

//        DLAppLocalServiceUtil.addFileEntry()

        try {
            PortletResponseUtil.write(resourceResponse, data.toJSONString());
        } catch (IOException e) {
            e.printStackTrace();
        }

        return true;
    }

}