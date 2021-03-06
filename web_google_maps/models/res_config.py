# -*- coding: utf-8 -*-
# License LGPL-3.0 or later (http://www.gnu.org/licenses/lgpl).
from odoo import api, fields, models

GMAPS_LANG_LOCALIZATION = [
    ('ar', 'Arabic'),
    ('bg', 'Bulgarian'),
    ('bn', 'Bengali'),
    ('ca', 'Catalan'),
    ('cs', 'Czech'),
    ('da', 'Danish'),
    ('de', 'German'),
    ('el', 'Greek'),
    ('en', 'English'),
    ('en-AU', 'English (Australian)'),
    ('en-GB', 'English (Great Britain)'),
    ('es', 'Spanish'),
    ('eu', 'Basque'),
    ('eu', 'Basque'),
    ('fa', 'Farsi'),
    ('fi', 'Finnish'),
    ('fil', 'Filipino'),
    ('fr', 'French'),
    ('gl', 'Galician'),
    ('gu', 'Gujarati'),
    ('hi', 'Hindi'),
    ('hr', 'Croatian'),
    ('hu', 'Hungarian'),
    ('id', 'Indonesian'),
    ('it', 'Italian'),
    ('iw', 'Hebrew'),
    ('ja', 'Japanese'),
    ('kn', 'Kannada'),
    ('ko', 'Korean'),
    ('lt', 'Lithuanian'),
    ('lv', 'Latvian'),
    ('ml', 'Malayalam'),
    ('mr', 'Marathi'),
    ('nl', 'Dutch'),
    ('no', 'Norwegian'),
    ('pl', 'Polish'),
    ('pt', 'Portuguese'),
    ('pt-BR', 'Portuguese (Brazil)'),
    ('pt-PT', 'Portuguese (Portugal)'),
    ('ro', 'Romanian'),
    ('ru', 'Russian'),
    ('sk', 'Slovak'),
    ('sl', 'Slovenian'),
    ('sr', 'Serbian'),
    ('sv', 'Swedish'),
    ('ta', 'Tamil'),
    ('te', 'Telugu'),
    ('th', 'Thai'),
    ('tl', 'Tagalog'),
    ('tr', 'Turkish'),
    ('uk', 'Ukrainian'),
    ('vi', 'Vietnamese'),
    ('zh-CN', 'Chinese (Simplified)'),
    ('zh-TW', 'Chinese (Traditional)'),
]


class ResConfigSettings(models.TransientModel):
    _inherit = 'res.config.settings'

    @api.model
    def get_region_selection(self):
        country_ids = self.env['res.country'].search([])
        values = [(country.code, country.name) for country in country_ids]
        return values

    google_maps_view_api_key = fields.Char(string='Google Maps View Api Key')
    google_maps_lang_localization = fields.Selection(
            selection=GMAPS_LANG_LOCALIZATION,
            string='Google Maps Language Localization')
    google_maps_region_localization = fields.Selection(
            selection=get_region_selection,
            string='Google Maps Region Localization')
    google_maps_theme = fields.Selection(
            selection=[('default', 'Default'),
                       ('aubergine', 'Aubergine'),
                       ('night', 'Night'),
                       ('dark', 'Dark'),
                       ('retro', 'Retro'),
                       ('silver', 'Silver')],
            string='Map theme')

    @api.onchange('google_maps_lang_localization')
    def onchange_lang_localization(self):
        if not self.google_maps_lang_localization:
            self.google_maps_region_localization = ''

    @api.multi
    def set_values(self):
        super(ResConfigSettings, self).set_values()
        ICPSudo = self.env['ir.config_parameter'].sudo()
        lang_localization = self._set_google_maps_lang_localization()
        region_localization = self._set_google_maps_region_localization()

        ICPSudo.set_param('google_maps_view_api_key',
                          self.google_maps_view_api_key)
        ICPSudo.set_param('google_maps_lang_localization',
                          lang_localization)
        ICPSudo.set_param('google_maps_region_localization',
                          region_localization)
        ICPSudo.set_param('google_maps_theme', self.google_maps_theme)

    @api.model
    def get_values(self):
        res = super(ResConfigSettings, self).get_values()
        ICPSudo = self.env['ir.config_parameter'].sudo()

        lang_localization = self._get_google_maps_lang_localization()
        region_localization = self._get_google_maps_region_localization()
        res.update({
            'google_maps_view_api_key': ICPSudo.get_param(
                    'google_maps_view_api_key', default=''),
            'google_maps_lang_localization': lang_localization,
            'google_maps_region_localization': region_localization,
            'google_maps_theme': ICPSudo.get_param(
                    'google_maps_theme', default='default')
        })
        return res

    @api.multi
    def _set_google_maps_lang_localization(self):
        if self.google_maps_lang_localization:
            lang_localization = '&language=%s' % \
                                self.google_maps_lang_localization
        else:
            lang_localization = ''

        return lang_localization

    @api.model
    def _get_google_maps_lang_localization(self):
        ICPSudo = self.env['ir.config_parameter'].sudo()
        google_maps_lang = ICPSudo.get_param(
                'google_maps_lang_localization', default='')
        val = google_maps_lang.split('=')
        lang = val and val[-1] or ''
        return lang

    @api.multi
    def _set_google_maps_region_localization(self):
        if self.google_maps_region_localization:
            region_localization = '&region=%s' % \
                                  self.google_maps_region_localization
        else:
            region_localization = ''

        return region_localization

    @api.model
    def _get_google_maps_region_localization(self):
        ICPSudo = self.env['ir.config_parameter'].sudo()
        google_maps_region = ICPSudo.get_param(
                'google_maps_region_localization', default='')
        val = google_maps_region.split('=')
        region = val and val[-1] or ''
        return region
