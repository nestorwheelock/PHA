��    d      <  �   \      �  c  �  E   �  �   +     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �             h        o  	   x  B   �     �     �  
   �  
   �     �                7  m   ;     �     �  !   �  
   �     �             z   1     �    �  6   �  #   �     #  #   A  $   e  "   �     �     �     �     �               6  g   D     �     �     �  1   �       8   -  #   f  O   �  -   �           )     E  -   e     �     �  (   �  <   �     1     6  <   R  ^   �     �     �  E     
   H     S  %   d  E   �  N   �  F     C   f     �     �  1   �  �   �  	   |  0   �  `   �  *     *   C     n  =  �  c  �  E   $$  �   j$     !%     $%     '%     *%     -%     0%     3%     6%     9%     <%     ?%     B%     E%     H%     K%     N%     Q%     T%  o   W%     �%  
   �%  s   �%     T&     f&  
   n&  	   y&     �&     �&  .   �&     �&  l   �&     @'     Q'  2   ]'     �'     �'     �'  #   �'  4   �'     %(    ((  B   7)  &   z)  !   �)  #   �)  -   �)     *  "   *     <*     R*     a*     w*  %   �*     �*  x   �*     C+     ]+     x+  9   �+  #   �+  D   �+  6   5,  V   l,  5   �,  )   �,  $   #-  '   H-  )   p-  $   �-     �-  +   �-  N   .     Z.     `.  I   |.  z   �.  
   A/     L/  E   Z/     �/     �/  4   �/  F   �/  V   ?0  M   �0  C   �0     (1     61  U   O1  �   �1  	   82  >   B2  `   �2  *   �2  *   3     83     H      ,   M   >   D   +   I   B                  K   2   0                      _       O   Q   
         4       C              '   L   -   U       !      c           J   ^   5          	   #   Y   b   E       `   <             a   N       3       .   X   ]       )      %   :             *       (      =   "                  ;   S                          ?              9   7   $   W       @      V      F   A   &       P   Z   R              /   \   T      G       [   6           1   8                    d    
<div style="font-family: 'Lucica Grande', Ubuntu, Arial, Verdana, sans-serif; font-size: 12px; color: rgb(34, 34, 34); background-color: #FFF; ">

<p>I would like to remind you that we are approaching the deadline for the Intrastat Product declaration for month ${object.year_month}.</p>

<p>As there were no ${object.type} Intrastat Product declaration for that month in Odoo, a draft declaration has been generated automatically by Odoo.</p>

% if ctx.get('exception'):
<p>When trying to generate the lines of the ${object.type} Intrastat Product declaration, the following error was encountered:</p>

<p>${ctx.get('error_msg')}</p>

<p>You should solve this error, then go to the menu "Accounting > Reporting > Legal Reports > Intrastat reporting > Intrastat Product", open the ${object.type} declaration for month ${object.year_month} and click on the button "Generate lines from invoices".</p>

% else:
% if object.num_lines and object.num_lines > 0:
<p>This draft ${object.type} Intrastat Product declaration contains ${object.num_decl_lines} ${object.num_decl_lines == 1 and 'line' or 'lines'}.</p>
% else:
<p>This draft ${object.type} Intrastat Product declaration generated automatically by Odoo doesn't contain any line.</p>
% endif

<p>Go and check this declaration in Odoo in the menu "Accounting > Reporting > Legal Reports > Intrastat reporting > DEB".</p>

% endif

<p>
-- 
Automatic e-mail sent by Odoo.
<!-- TODO : print database name (we used object._cr.dbname in openerp 6.1, but it's not possible in OpenERP 7 because the executing of jinja2 is sandboxed and private attributes can't be accessed). -->
</p>
</div>
 ${object.type} DEB ${object.year_month} for ${object.company_id.name} '0' for procedure codes 19 and 29, '-1' for procedure code 25, '1' for all the others. This multiplier is used to compute the total fiscal value of the declaration. 11 12 13 14 19 21 22 23 29 30 41 42 51 52 70 80 91 99 An Intrastat Transaction already exists for this company with the same code and the same procedure code. Arrivals Companies Company identifier for Intrastat file export. Size : 4 characters. Computation Lines Contact Created by Created on Customer Invoice Customer Refund Customs accreditation identifier DEB Decides on which kind of Intrastat product report ('Import' or 'Export') this Intrastat type can be selected. Declaration Line Departement Department is not set on line %d. Dispatches Display Name EU fiscal representative Fiscal value multiplier For the 'DEB' declaration to France's customs administration, you should enter the number 'nature de la transaction' here. ID If this partner is located outside the EU but you deliver the goods inside the UE, the partner needs to have a fiscal representative with a VAT number inside the EU. In this scenario, the VAT number of the fiscal representative will be used for the Intrastat Product report (DEB). In France, Arrival DEB can only be Exempt or Extended. Intrastat Product Computation Lines Intrastat Product Declaration Intrastat Product Declaration Lines Intrastat Product Report Base Object Intrastat Product for France (DEB) Intrastat Supplementary Units Intrastat Transaction Intrastat product type Inventory Locations Is fiscal only ? Is partner VAT required? Label for DEB Label used in the XML file export of the French Intrastat Product Declaration for this unit of measure. Last Modified on Last Updated by Last Updated on Missing Country of Origin/Destination on line %d. Missing H.S. code on line %d. Missing Label for DEB on Intrastat Unit of Measure '%s'. Missing VAT number on partner '%s'. Missing country of origin on product %s. This product is present in invoice %s. Missing fiscal representative on partner '%s' Missing fiscal value on line %d. Missing partner on line %d. Missing partner on warehouse %s Missing product country of origin on line %d. Missing quantity on line %d. Missing weight on line %d. Mode of transport is not set on line %d. No declaration lines. You probably forgot to generate them ! None Number of Declaration Lines Only fiscal data should be provided for this procedure code. Origin partner for arrivals. Destination partner (or his fiscal representative) for dispatches Partner Possible on Pro.dou@ne only accepts XML file upload for the original declaration. Search DEB Supplier Invoice The SIRET is not set on company '%s'. The customs accreditation identifier is not set for the company '%s'. The fiscal representative '%s' of partner '%s' must be based in an EU country. The fiscal representative '%s' of partner '%s' must have a VAT number. The fiscal representative '%s' of partner '%s' must have a country. Total Amount Transaction code Transaction code on line %d should have 2 digits. True for all procedure codes except 11, 19 and 29. When False, the VAT number should not be filled in the Intrastat product line. Warehouse You must enter a value for the transaction code. You should not set a transaction code when the Code (i.e. Procedure Code) is '25', '26' or '31'. l10n.fr.intrastat.product.computation.line l10n.fr.intrastat.product.declaration.line res.config.settings Project-Id-Version: Odoo Server 11.0+e-20180122
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2018-04-15 21:32+0000
PO-Revision-Date: 2018-04-17 17:44+0100
Last-Translator: <>
Language-Team: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Language: en
X-Generator: Poedit 2.0.6
 
<div style="font-family: 'Lucica Grande', Ubuntu, Arial, Verdana, sans-serif; font-size: 12px; color: rgb(34, 34, 34); background-color: #FFF; ">

<p>I would like to remind you that we are approaching the deadline for the Intrastat Product declaration for month ${object.year_month}.</p>

<p>As there were no ${object.type} Intrastat Product declaration for that month in Odoo, a draft declaration has been generated automatically by Odoo.</p>

% if ctx.get('exception'):
<p>When trying to generate the lines of the ${object.type} Intrastat Product declaration, the following error was encountered:</p>

<p>${ctx.get('error_msg')}</p>

<p>You should solve this error, then go to the menu "Accounting > Reporting > Legal Reports > Intrastat reporting > Intrastat Product", open the ${object.type} declaration for month ${object.year_month} and click on the button "Generate lines from invoices".</p>

% else:
% if object.num_lines and object.num_lines > 0:
<p>This draft ${object.type} Intrastat Product declaration contains ${object.num_decl_lines} ${object.num_decl_lines == 1 and 'line' or 'lines'}.</p>
% else:
<p>This draft ${object.type} Intrastat Product declaration generated automatically by Odoo doesn't contain any line.</p>
% endif

<p>Go and check this declaration in Odoo in the menu "Accounting > Reporting > Legal Reports > Intrastat reporting > DEB".</p>

% endif

<p>
-- 
Automatic e-mail sent by Odoo.
<!-- TODO : print database name (we used object._cr.dbname in openerp 6.1, but it's not possible in OpenERP 7 because the executing of jinja2 is sandboxed and private attributes can't be accessed). -->
</p>
</div>
 ${object.type} DEB ${object.year_month} for ${object.company_id.name} '0' pour les codes régime 19 et 29, '-1' pour le code régime 25, '1' pour tous les autres. Ce multiplicateur est utilisé pour calculer la valeur fiscale totale de la déclaration. 11 12 13 14 19 21 22 23 29 30 41 42 51 52 70 80 91 99 Une transaction Intrastat existe déjà pour cette société avec le même code et le même code de procédure. Introductions Sociétés Numéro d'habilitation pour les fichiers de DEB délivré par l'administration des douanes. Taille : 4 caractères. Computation Lines Contact Créé par Créé le Factures client Avoir client Numéro d'habilitation délivré par la douane DEB Décide sur quel type de DEB ('Introduction' ou 'Expédition') ce type pour la DEB peut être sélectionné. Declaration Line Departement Le département n'est pas défini sur la ligne% d. Expéditions Nom à afficher Représentant fiscal dans l'UE Multiplicateur de la valeur fiscale Entrez le code 'nature de la transaction' de la DEB. ID Si ce partenaire est situé en dehors de l'UE mais que vous livrez des produits dans l'UE, ce partenaire doit avoir un représentant fiscal avec un numéro de TVA dans l'UE. Dans ce scénario, c'est le numéro de TVA du représentant fiscal qui est utilisé pour la DEB. En France, DEB introduction ne peut être ni exonéré ni étendu. Lignes de calcul de produits Intrastat Déclaration de produit Intrastat Intrastat Product Declaration Lines Objet de base de rapport de produit Intrastat DEB Unités supplémentaires Intrastat Transaction Intrastat Flux de la DEB Emplacements de stock Données fiscales seulement ? Numéro de TVA du partenaire requis ? Label pour DEB Libellé utilisé dans l'exportation de fichier XML de la déclaration de produit Intrastat pour cette unité de mesure. Dernière modification le Dernière mise à jour par Dernière mise à jour le Pays d'origine / de destination manquant sur la ligne% d. H.S. manquant code sur la ligne% d. Etiquette manquante pour DEB sur l'unité de mesure Intrastat '% s'. Numéro de TVA non renseigné pour le partenaire '%s'. Pays d'origine manquant sur le produit% s. Ce produit est présent dans la facture% s. Représentant fiscal manquant sur le partenaire '% s' Valeur fiscale manquante sur la ligne %d. Partenaire manquant sur la ligne% d. Partenaire manquant dans l'entrepôt% s Pays d'origine manquant pour la ligne %d. Quantité manquante sur la ligne %d. Poids manquant sur la ligne %d. Le mode de transport est manquant ligne %d. Aucune ligne de déclaration. Vous avez probablement oublié de les générer! Aucun Number of Declaration Lines Seules les données fiscales doivent être fournies pour ce code régime. Partenaire d'origine pour les introductions. Partenaire de destination (ou son représentant fiscal) pour les expéditions Partenaire Possible pour Pro.dou@ne only accepts XML file upload for the original declaration. Rechercher DEB Facture fournisseur Le SIRET n'est pas renseigné sur la société '%s'. Le numéro d'habilitation n'est pas renseigné pour la société '%s'. Le représentant fiscal '%s' du partenaire '%s' doit être basé dans un pays de l'UE. Le représentant fiscal '%s' du partenaire '%s' doit avoir un numéro de TVA. Le représentant fiscal '%s' du partenaire '%s' doit avoir un pays. Montant total Nature de la transaction Le code 'nature de la transaction' sur la ligne %d doit être composé de 2 chiffres. Vrai pour tous les codes régime excepté 11, 19 et 29. Quand il est à Faux, le numéro de TVA ne doit pas être renseigné dans la ligne de DEB. Entrepôt Vous devez entrer une valeur pour la nature de la transaction. You should not set a transaction code when the Code (i.e. Procedure Code) is '25', '26' or '31'. l10n.fr.intrastat.product.computation.line l10n.fr.intrastat.product.declaration.line res.config.settings 