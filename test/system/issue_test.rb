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
  class IssueTest < ApplicationSystemTestCase
    include ColoredEnumeration::Enumerations

    fixtures %i[projects users email_addresses roles members member_roles
                trackers projects_trackers enabled_modules issue_statuses issues
                enumerations custom_fields custom_values custom_fields_trackers
                watchers journals journal_details versions
                workflows]

    def setup
      super
      @issue = Issue.find(3)

      @custom_field = create_custom_field
      @values = @custom_field.enumerations.map(&:id)

      @cf = CustomValue.create!(custom_field: @custom_field,
                                value: @values[1],
                                customized: @issue,
                                customized_type: Issue)
      @cf.save!
      @issue.save_custom_field_values
      Capybara.current_session.reset!
      log_user 'admin', 'admin'
    end

    test 'should render custom field enumerations with background color' do
      visit issue_path(@issue)
      expected_color = 'rgba(0, 128, 0, 1)'
      current_color = page.find(".enumeration_cf.cf_#{@custom_field.id} .value td").style('background-color')['background-color']
      assert_equal expected_color, current_color
    end

    test 'should render custom field enumeration color badge for single issue' do
      visit issue_path(@issue)
      expected_color = 'rgba(0, 128, 0, 1)'
      current_color = page.find('.enumeration-badge td').style('background-color')['background-color']
      assert_equal expected_color, current_color
    end

    test 'should render custom field enumeration color badge for issue list' do
      visit issues_path
      skip, 'Test does not create a query at all which is needed in view_issues_index_bottom_hook_listener.rb!'
      within('fieldset#options') do
        page.find('legend').click
        select @custom_field.name, from: 'Available Columns'
        page.find('input.move-right').click
      end
      within('#query_form_with_buttons') do
        page.find('p.buttons a.icon.icon-checked').click
      end
      expected_color = 'rgba(0, 128, 0, 1)'
      current_color = page.find('table.enumeration-badge td').style('background-color')['background-color']
      assert_equal expected_color, current_color
    end
  end
end
