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

##
# Credits to https://coderwall.com/p/upx61q/css-hex-color-validation-in-rails
#
class CssHexColorValidator < ActiveModel::EachValidator
  include Redmine::I18n

  def validate_each(object, attribute, value)
    return true if value.nil? || value =~ /^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$/i

    object.errors[attribute] << (options[:message] || l(:error_invalid_css_hex_color))
  end
end
