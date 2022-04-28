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
  module Extensions
    module BaseFormatPatch
      def self.included(base)
        base.include(InstanceMethods)
      end

      module InstanceMethods
        def cast_color(*)
          ''
        end
      end
    end
  end
end

Rails.configuration.to_prepare do
  patch = ColoredEnumeration::Extensions::BaseFormatPatch
  klass = Redmine::FieldFormat::Base
  klass.include patch unless klass.included_modules.include?(patch)
end
