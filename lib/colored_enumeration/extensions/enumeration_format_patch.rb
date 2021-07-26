# frozen_string_literal: true

# This file is part of the Plugin Redmine Colored Enumeration.
#
# Copyright (C) 2021 Liane Hampe <liaham@xmera.de>, xmera.
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

module ColoredEnumeration
  module Extensions
    module EnumerationFormatPatch
      def self.included(base)
        base.include(InstanceMethods)
      end

      module InstanceMethods
        def cast_color(custom_field, value, customized = nil)
          value_object(custom_field, value, customized)&.color || ''
        end

        def value_object(custom_field, value, customized)
          cast_value(custom_field, value, customized)
        end
        # def possible_values_options(custom_field, object = nil)
        #   possible_values_records(custom_field, object).map do |u|
        #     [u.name, u.id.to_s, class: 'field-bg-color', data: { color: u.color }]
        #   end
        # end

        # def possible_custom_value_options(custom_value)
        #   options = possible_values_options(custom_value.custom_field, custom_value.customized)
        #   byebug
        #   missing = [custom_value.value_was].flatten.reject(&:blank?) - options.map(&:last)
        #   if missing.any?
        #     options += target_class.where(:id => missing.map(&:to_i)).map {|o| [o.to_s, o.id.to_s]}
        #   end
        #   options
        # end

        # def validate_custom_value(custom_value)
        #   values = Array.wrap(custom_value.value).reject {|value| value.to_s == ''}
        #   byebug
        #   invalid_values = values - possible_custom_value_options(custom_value).map(&:last)
        #   if invalid_values.any?
        #     [::I18n.t('activerecord.errors.messages.inclusion')]
        #   else
        #     []
        #   end
        # end
      end
    end
  end
end

Rails.configuration.to_prepare do
  patch = ColoredEnumeration::Extensions::EnumerationFormatPatch
  klass = Redmine::FieldFormat::EnumerationFormat
  klass.include patch unless klass.included_modules.include?(patch)
end
