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
  class CustomFieldEnumerationTest < ActiveSupport::TestCase
    include Redmine::I18n

    def setup
      @field = CustomFieldEnumeration.new(default_args)
    end

    test 'should respond to color' do
      assert @field.respond_to? :color
    end

    test 'correct hex color should be valid' do
      field = CustomFieldEnumeration.new(args_with_color('#9e1030'))
      assert field.valid?
    end

    test 'color field length should be restricted' do
      field = CustomFieldEnumeration.new(args_with_color('#9ee1030'))
      assert_not field.valid?
      assert_equal 2, field.errors.count
    end

    test 'should reject usual string with correct length' do
      field = CustomFieldEnumeration.new(args_with_color('9e1030'))
      assert_not field.valid?
      assert field.errors.present?
      assert_equal 1, field.errors.count
    end

    private

    def args_with_color(color)
      default_args.merge(color: color)
    end

    def default_args
      { name: 'Enum Field',
        position: 1,
        custom_field_id: 9999 }
    end
  end
end
