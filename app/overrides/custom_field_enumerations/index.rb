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

Deface::Override.new(
  virtual_path: 'custom_field_enumerations/index',
  name: 'add-color-field',
  insert_after: '.icon-only.icon-sort-handle.sort-handle',
  partial: 'custom_field_enumerations/color_field',
  original: '4c39884753fd9da20e3acdd1a493eaa14c194d05',
  sequence: 10,
  namespaced: true
)
