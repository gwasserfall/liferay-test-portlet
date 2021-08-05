<%-- 
/**
 * Copyright 2000-present Liferay, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
--%>

<%@ include file="/init.jsp" %>

<%-- 

	add a grouped input
	test serialize
	test deserialize

	test@test.com

--%>


<div class="form-group">
	<label for="tagsField2">Tags</label>
	<div class="input-group input-group-stacked-sm-down">
		<div class="input-group-item">
			<div class="dropdown">
				<div class="form-control form-control-tag-group">


					<!-- Label element, 1 for each item in deserialized list -->
					<span class="label label-dismissible label-secondary" tabindex="0">
						<span class="label-item label-item-expand">basic func</span>
						<span class="label-item label-item-after">
							<button class="close" onclick="alert(1)" tabindex="-1" type="button">
								<liferay-ui:icon image="close" />
							</button>
						</span>
					</span>

					<!-- Main input, should watch input event -->
					<span class="autofit-row">
						<span class="autofit-col autofit-col-expand">
							<input class="form-control-inset" type="text" value=""/>
						</span>
					</span>					
				</div>
			</div>
		</div>
	</div>
</div>





