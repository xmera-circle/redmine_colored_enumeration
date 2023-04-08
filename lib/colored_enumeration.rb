# frozen_string_literal: true

# This file is part of the Plugin Redmine Colored Enumeration.
#
# Copyright (C) 2021-2023 Liane Hampe <liaham@xmera.de>, xmera Solutions GmbH.
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA

# Extensions
require_relative 'colored_enumeration/extensions/custom_field_enumeration_patch'
require_relative 'colored_enumeration/extensions/custom_field_patch'
require_relative 'colored_enumeration/extensions/enumeration_format_patch'
require_relative 'colored_enumeration/extensions/issue_custom_field_patch'
require_relative 'colored_enumeration/extensions/custom_field_value_patch'
require_relative 'colored_enumeration/extensions/base_format_patch'
require_relative 'colored_enumeration/extensions/query_custom_field_column_patch'

# Hooks
require_relative 'colored_enumeration/hooks/view_layouts_base_hook_listener'
require_relative 'colored_enumeration/hooks/view_issues_index_bottom_hook_listener'

# Overrides
require_relative 'colored_enumeration/overrides/custom_field_enumerations_controller_patch'
require_relative 'colored_enumeration/overrides/issues_helper_patch'

##
# Initialize the plugins setup.
#
module RedmineColoredEnumeration
  class << self
    def setup
      %w[base_format_patch custom_field_enumeration_patch
         custom_field_patch custom_field_value_patch enumeration_format_patch
         issue_custom_field_patch query_custom_field_column_patch
         custom_field_enumerations_controller_patch issues_helper_patch].each do |patch|
        AdvancedPluginHelper::Patch.register(send(patch))
      end
    end

    private

    def base_format_patch
      { klass: Redmine::FieldFormat::Base,
        patch: ColoredEnumeration::Extensions::BaseFormatPatch,
        strategy: :include }
    end

    def custom_field_enumeration_patch
      { klass: CustomFieldEnumeration,
        patch: ColoredEnumeration::Extensions::CustomFieldEnumerationPatch,
        strategy: :include }
    end

    def custom_field_patch
      { klass: CustomField,
        patch: ColoredEnumeration::Extensions::CustomFieldPatch,
        strategy: :include }
    end

    def custom_field_value_patch
      { klass: CustomFieldValue,
        patch: ColoredEnumeration::Extensions::CustomFieldValuePatch,
        strategy: :include }
    end

    def enumeration_format_patch
      { klass: Redmine::FieldFormat::EnumerationFormat,
        patch: ColoredEnumeration::Extensions::EnumerationFormatPatch,
        strategy: :include }
    end

    def issue_custom_field_patch
      { klass: IssueCustomField,
        patch: ColoredEnumeration::Extensions::IssueCustomFieldPatch,
        strategy: :include }
    end

    def query_custom_field_column_patch
      { klass: QueryCustomFieldColumn,
        patch: ColoredEnumeration::Extensions::QueryCustomFieldColumnPatch,
        strategy: :include }
    end

    def custom_field_enumerations_controller_patch
      { klass: CustomFieldEnumerationsController,
        patch: ColoredEnumeration::Overrides::CustomFieldEnumerationsControllerPatch,
        strategy: :prepend }
    end

    def issues_helper_patch
      { klass: IssuesHelper,
        patch: ColoredEnumeration::Overrides::IssuesHelperPatch,
        strategy: :prepend }
    end
  end
end
