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

require File.expand_path('../test_helper', __dir__)

module ColoredEnumeration
  class CustomFieldValueTest < ActiveSupport::TestCase
    include ColoredEnumeration::Enumerations

    fixtures :issues, :custom_fields, :custom_values

    def setup
      @issue = Issue.find(3)
      @custom_field = create_custom_field
      @values = @custom_field.enumerations.map(&:id)
    end

    test 'should give the color of an enumeration formatted custom field' do
      cfv = CustomFieldValue.new(custom_field: @custom_field,
                                 customized: @issue,
                                 value: @values[0])
      assert yellow, cfv.cast_color(cfv.value)
    end

    test 'should give nil color for formats other than enumeration' do
      cfv = CustomFieldValue.new(custom_field: CustomField.find(1),
                                 customized: @issue,
                                 value: 'MySQL')
      assert_equal '', cfv.cast_color(cfv.value)
    end
  end
end
