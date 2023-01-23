# frozen_string_literal: true

# This file is part of the Plugin Redmine Colored Enumeration.
#
# Copyright (C) 2022-2023 Liane Hampe <liaham@xmera.de>, xmera Solutions GmbH.
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

Deface::Override.new(
  virtual_path: 'issues/_list',
  name: 'change-custom-field-html-attributes',
  replace: "erb[loud]:contains('content_tag')",
  partial: 'issues/custom_field_html_attributes',
  original: 'bd95c86e071738eb4b96aeaf49ff35f01020b2e5',
  sequence: 10,
  namespaced: true
)