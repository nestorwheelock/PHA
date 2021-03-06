# -*- coding: utf-8 -*-
##############################################################################
#
#    OpenERP, Open Source Management Solution
#    Copyright (C) 2011 Numérigraphe SARL.
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Affero General Public License as
#    published by the Free Software Foundation, either version 3 of the
#    License, or (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Affero General Public License for more details.
#
#    You should have received a copy of the GNU Affero General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
##############################################################################

{
    "name": "European NACE partner categories",
    "version": "11.0.1.0.0",
    'author': u'Numérigraphe SARL,Sistheo,Odoo Community Association (OCA)',
    "category": "Localization",
    "depends":["contacts"],
    "data": [
        "security/ir.model.access.csv",
        "data/res.partner.nace.csv",
        'views/partner_view.xml',
    ],
    'installable': True,
    'license': 'AGPL-3',
}
