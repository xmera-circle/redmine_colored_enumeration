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

require File.expand_path('../../../../../test_helper', __dir__)
require 'redmine/field_format'

class Redmine::EnumerationFieldFormatTest
  define_method(:test_value_from_keyword_for_multiple_custom_field_should_return_enumeration_ids) do
    # This test cannot be done since multiple values are not supported when
    # using Redmine Colored Enumeration plugin!
    assert true
  end

  define_method(:test_edit_tag_with_multiple_should_select_current_values) do
    # This test cannot be done since multiple values are not supported when
    # using Redmine Colored Enumeration plugin!
    assert true
  end
end
