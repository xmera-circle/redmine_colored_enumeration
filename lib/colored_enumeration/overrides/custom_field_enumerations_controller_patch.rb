# frozen_string_literal: true

# This file is part of the Plugin Redmine Colored Enumeration.
#
# Copyright (C) 2021 - 2022 Liane Hampe <liaham@xmera.de>, xmera.
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
  module Overrides
    module CustomFieldEnumerationsControllerPatch
      def self.prepended(base)
        base.prepend(InstanceMethods)
      end

      module InstanceMethods
        private

        ##
        # Add color attribute.
        #
        # @override CustomFieldEnumerationsController#enumeration_params
        #
        def enumeration_params
          params.require(:custom_field_enumeration).permit(*permitted_attrs)
        end

        ##
        # Add color attribute.
        #
        # @override CustomFieldEnumerationsController#update_each_params
        #
        def update_each_params
          params.permit(custom_field_enumerations: permitted_attrs).require(:custom_field_enumerations)
        end

        def permitted_attrs
          %i[color name active position]
        end
      end
    end
  end
end
