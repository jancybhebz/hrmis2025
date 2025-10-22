#
# TABLE STRUCTURE FOR: tblAgency
#

DROP TABLE IF EXISTS `tblAgency`;

CREATE TABLE `tblAgency` (
  `agencyName` varchar(100) NOT NULL DEFAULT '',
  `abbreviation` varchar(10) NOT NULL DEFAULT '',
  `dtrScheme` varchar(10) NOT NULL DEFAULT '',
  `fixedFrom` time DEFAULT '00:00:00',
  `address` varchar(255) NOT NULL DEFAULT '',
  `zipCode` varchar(4) NOT NULL DEFAULT '',
  `telephone` varchar(50) NOT NULL DEFAULT '',
  `facsimile` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(80) NOT NULL DEFAULT '',
  `website` varchar(80) NOT NULL DEFAULT '',
  `fixedTo` time DEFAULT '00:00:00',
  `morningFrom` time DEFAULT '00:00:00',
  `morningTo` time DEFAULT '00:00:00',
  `afternoonFrom` time DEFAULT '00:00:00',
  `afternoonTo` time DEFAULT '00:00:00',
  `salarySchedule` varchar(10) NOT NULL DEFAULT '',
  `mins_before_OT` time DEFAULT NULL,
  `minOT` time DEFAULT NULL,
  `maxOT` time DEFAULT NULL,
  `expr_cto_mon` int(11) DEFAULT NULL,
  `expr_cto_yr` int(11) DEFAULT NULL,
  `flagTime` time NOT NULL,
  `autoComputeTax` tinyint(4) NOT NULL,
  `pagibigId` varchar(20) NOT NULL DEFAULT '',
  `gsisId` varchar(20) NOT NULL DEFAULT '',
  `gsisEmpShare` int(4) NOT NULL DEFAULT 0,
  `gsisEmprShare` int(4) NOT NULL DEFAULT 0,
  `pagibigEmpShare` int(4) NOT NULL DEFAULT 0,
  `pagibigEmprShare` int(4) NOT NULL DEFAULT 0,
  `philhealthEmpShare` int(4) DEFAULT 0,
  `philhealthEmprShare` int(11) DEFAULT 0,
  `providentEmpShare` int(4) DEFAULT 0,
  `providentEmprShare` int(4) DEFAULT 0,
  `philhealthPercentage` decimal(4,2) NOT NULL DEFAULT 0.00,
  `lbStartMonth` int(2) NOT NULL DEFAULT 0,
  `lbStartYear` int(4) NOT NULL DEFAULT 0,
  `agencyTin` varchar(25) NOT NULL DEFAULT '',
  `PhilhealthNum` varchar(20) DEFAULT NULL,
  `Vision` text DEFAULT NULL,
  `Mission` text DEFAULT NULL,
  `Mandate` text NOT NULL,
  `zonecode` varchar(20) NOT NULL DEFAULT '',
  `region` varchar(20) NOT NULL DEFAULT '',
  `AccountNum` varchar(20) DEFAULT NULL,
  `expirationCTO` datetime DEFAULT NULL,
  PRIMARY KEY (`agencyName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblAgency` (`agencyName`, `abbreviation`, `dtrScheme`, `fixedFrom`, `address`, `zipCode`, `telephone`, `facsimile`, `email`, `website`, `fixedTo`, `morningFrom`, `morningTo`, `afternoonFrom`, `afternoonTo`, `salarySchedule`, `mins_before_OT`, `minOT`, `maxOT`, `expr_cto_mon`, `expr_cto_yr`, `flagTime`, `autoComputeTax`, `pagibigId`, `gsisId`, `gsisEmpShare`, `gsisEmprShare`, `pagibigEmpShare`, `pagibigEmprShare`, `philhealthEmpShare`, `philhealthEmprShare`, `providentEmpShare`, `providentEmprShare`, `philhealthPercentage`, `lbStartMonth`, `lbStartYear`, `agencyTin`, `PhilhealthNum`, `Vision`, `Mission`, `Mandate`, `zonecode`, `region`, `AccountNum`, `expirationCTO`) VALUES ('MUNICIPAL GOVERNMENT OF PAETE | MISO Version 1.0', 'LGU-PAETE', '', '00:00:00', 'JV Quesada St. Municipal Building Paete, Laguna', '4016', '(049) 501-6475', '0', 'info@paete.gov.ph', 'www.paete.gov.ph', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', 'Bi-Monthly', NULL, '00:00:00', '00:00:00', '0', '0', '00:08:00', '0', '2-0496976000-2', '1000021657', '9', '12', '100', '100', '50', '50', '2', '5', '0.00', '1', '2005', '000631660000', '142230100010', 'A nation enjoying and sustaining its natural resources and a clean and healthy environment.', 'To mobilize our citizenry in protecting, conserving, and managing the environment and natural resources for the present and future generations.', 'The Department is the primary agency responsible for the conservation, management, development, and proper use of the country’s environment and natural resources, specifically forest and grazing lands, mineral resources, including those in reservation and watershed areas, and lands of the public domain, as well as the licensing and regulation of all natural resources as may be provided for by law in order to ensure equitable sharing of the benefits derived therefrom for the welfare of the present and future generations of Filipinos.', '', 'Calabarzon', 'LBP 3302 1038 51', NULL);


#
# TABLE STRUCTURE FOR: tblAgencyImages
#

DROP TABLE IF EXISTS `tblAgencyImages`;

CREATE TABLE `tblAgencyImages` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `agencyLogo` longblob NOT NULL,
  `agencyName` varchar(70) NOT NULL DEFAULT '',
  `filename` varchar(50) NOT NULL DEFAULT '',
  `filesize` varchar(50) NOT NULL DEFAULT '',
  `filetype` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblAgencyImages` (`id`, `agencyLogo`, `agencyName`, `filename`, `filesize`, `filetype`) VALUES ('57', '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0`\0\0\0`\0\0\0�w8\0\0\0	pHYs\0\0\0\0\0��\0\0\nOiCCPPhotoshop ICC profile\0\0xڝSgTS�=���BK���KoR RB���&*!	J�!��Q�EEȠ�����Q,�\n��!���������{�kּ������>�����H3Q5��B�������.@�\n$p\0�d!s�#\0�~<<+\"��\0x�\0�M��0���B�\\���t�8K�\0@z�B�\0@F���&S\0�\0`�cb�\0P-\0`\'��\0����{\0[�!��\0 e�D\0h;\0��V�E\0X0\0fK�9\0�-\00IWfH\0��\0���\0\00Q��)\0{\0`�##x\0��\0F�W<�+��*\0\0x��<�$9E�[-qWW.(�I+6aa�@.�y�2�4���\0\0������x����6��_-��\"bb���ϫp@\0\0�t~��,/�\Z�;�m��%�h^�u��f�@�\0���W�p�~<<E���������J�B[a�W}�g�_�W�l�~<�����$�2]�G�����L�ϒ	�b��G�����\"�Ib�X*�Qq�D���2�\"�B�)�%��d��,�>�5\0�j>{�-�]c�K\'Xt���\0\0�o��(�h���w��?�G�%\0�fI�q\0\0^D$.Tʳ?�\0\0D��*�A��,�����`6�B$��BB\nd�r`)��B(�Ͱ*`/�@4�Qh��p.�U�=p�a��(��	A�a!ڈb�X#����!�H�$ ɈQ\"K�5H1R�T UH�=r9�\\F��;�\02����G1���Q=��C��7\Z�F��dt1�����r�\Z=�6��Ыhڏ>C�0��3�l0.��B�8,	�c˱\"���\Z�V����cϱw�E�	6wB aAHXLXN�H� $4�	7	�Q�\'\"��K�&���b21�XH,#��/{�C�7$�C2\'��I��T��F�nR#�,��4H\Z#���dk�9�, +ȅ����3��!�[\n�b@q��S�(R�jJ��4�e�2AU��Rݨ�T5�ZB���R�Q��4u�9̓IK�����\Zhh�i��t�ݕN��W���G���w\r��ǈg(�gw��L�Ӌ�T071���oUX*�*|��\n�J�&�*/T����ުU�U�T��^S}�FU3S�	Ԗ�U��P�SSg�;���g�oT?�~Y��Y�L�OC�Q��_�� c�x,!k\r��u�5�&���|v*�����=���9C3J3W�R�f?�q��tN	�(���~���)�)�4L�1e\\k����X�H�Q�G�6������E�Y��A�J\'\\\'Gg����S�Sݧ\n�M=:��.�k���Dw�n��^��Lo��y���}/�T�m���GX�$��<�5qo</���QC]�@C�a�a�ᄑ��<��F�F�i�\\�$�m�mƣ&&!&KM�M�RM��)�;L;L���͢�֙5�=1�2��כ߷`ZxZ,����eI��Z�Yn�Z9Y�XUZ]�F���%ֻ�����N�N���gð�ɶ�����ۮ�m�}agbg�Ů��}�}��=\r���Z~s�r:V:ޚΜ�?}����/gX���3��)�i�S��Ggg�s�󈋉K��.�>.���Ƚ�Jt�q]�z���������ۯ�6�i�ܟ�4�)�Y3s���C�Q��?��0k߬~OCO�g��#/c/�W�װ��w��a�>�>r��>�<7�2�Y_�7��ȷ�O�o�_��C#�d�z��\0��%g��A�[��z|!��?:�e����A���AA�������!h�쐭!��Α�i�P~���a�a��~\'���W�?�p�X\Z�1�5w��Cs�D�D�Dޛg1O9�-J5*>�.j<�7�4�?�.fY��X�XIlK9.*�6nl��������{�/�]py�����.,:�@L�N8��A*��%�w%�\ny��g\"/�6ш�C\\*N�H*Mz�쑼5y$�3�,幄\'���L\rLݛ:��v m2=:�1����qB�!M��g�g�fvˬe����n��/��k���Y-\n�B��TZ(�*�geWf�͉�9���+��̳�ې7�����ᒶ��KW-X潬j9�<qy�\n�+�V�<���*m�O��W��~�&zMk�^�ʂ��k�U\n�}����]OX/Yߵa���>������(�x��oʿ�ܔ���Ĺd�f�f���-�[����n\r�ڴ\r�V����E�/��(ۻ��C���<��e����;?T�T�T�T6��ݵa��n��{��4���[���>ɾ�UUM�f�e�I���?�������m]�Nmq����#�׹���=TR��+�G�����w-\r6\rU����#pDy���	��\r:�v�{���vg/jB��F�S��[b[�O�>����z�G��4<YyJ�T�i��ӓg�ό���}~.��`ۢ�{�c��jo�t��E���;�;�\\�t���W�W��:_m�t�<���Oǻ�����\\k��z��{f���7����y���՞9=ݽ�zo������~r\'��˻�w\'O�_�@�A�C݇�?[�����j�w����G��������C���ˆ\r��8>99�?r����C�d�&����ˮ/~�����јѡ�򗓿m|������������x31^�V���w�w��O�| (�h���SЧ��������c3-�\0\0\0 cHRM\0\0z%\0\0��\0\0��\0\0��\0\0u0\0\0�`\0\0:�\0\0o�_�F\0\0)�IDATx��}yt$Wy����U�/�n�[j�͌�Y<x�/<!6�k���!/$�?&�`�����m��6�l�Fk����������VK�m$����Q�\\���������R����u��j�4�B)\0`��q\\�a�I�2����\0�1��,WdY��V?�ۂ�T���|>0��\\Y,v�Şj�\"*�\nJ5B��,A�l6ۤ�fv:���N�3�e������,Q?��SQj�ѴL\0\0xޤ�͖��nv�\\G�N��,�0���<�lT(��D\"~��l�]�xlw�\\F�ZC�V�$I�e���R\nB���d�_<A��l���:�?����-��F.4�󛗯PU��U��*U�]�(�MQ8(2AM���_���\n\0`Y�>w�(���;::����}��?\\(�ѹwML�$����\"\n�\"��\n�����\n$I�$I� �8��O�j��f���p��p�f���i�z{����=���m��yQ(��w(J�$��]��*P�i�VI�����������`Y�6�������1�x�\\�Թ0 P,���O=03��fsH��H$�H&�H����r(�J(�˨�jPU���a����/����z��������r��-�ٱc�=��_��t���]��L�b�E ��_\r�A�T�@�H���䋟��\ZE���Á�ZZZ��=�s��u�=O��4�����?y���2�4b�8fg�0;;���y�R)d�Y��T�U(�UUa�n�	�eY�<����������mho����RٝJ%ٱc��m�U���_< K�ߩTv��r@\"$�E\"I��T��D ��J@i�-���fUn��b^f�A�JeW:��������m�8!dl�\Z�iZ���\'>sf��D\"�HdSSS�Ø��\"�ɠT*C�$(���C���p��a���r����G(ԉ��ntv�������;�g�+��q���I�鿖j��=�c����0?��A��A�\0�X��6!���e����dYn��b�K~+B�Ntww����>���K.��6�7��a\rPUu�ر�������b||cc��È��(����a��;EQ�(\n$IB�\\A.�C&�E&�A>�G__/E�.I�\r���d�n���_)��H�(\"��	`r\n���P*� +<O`��P��U���E��\nY�Q.����Ng�N�������EQvH���{��a5&p�E9\'N�����`$2���Q���\"#�J�\\.C��M�UUQ�T`HY�\\F�\\j�2Ji\0�?߷�k�U\n�g����X��\0FG��I \Zr9@�\0E����{�?ShD_ì6wUU�(�Ys�e��6\0O��w������>��gΌ�Dfp��0���155�t:�Z���ԟ�P�r��.\nc�&��d2���K�ް^�p�����wG���(���:�q�Tj���l]s��4�]����=(��^�733���&�����������0&\'�\Z�ov�[9TUE�Z��i�gǁ�����;v�g���С���J��&Ӊ�$0>�@�-��5�β�N�������fittr�앧N��D\"���	���6$�x�����Z�\"���������o�z}o�z}��\"��ҵ�꥟M&��	�S���1�����!�Js�W�A\0ϟ����<������	�R��ԉ�d2�Dfp����02�,j��y\'~�$	�\\�pgΌ5�����(�2��9�����##��I$�?񗛻A���0��N���gEq4߻��x�ht��%099���i�RiT���fvV��Z��l6�H$���)D�Q$q.��@`���R��4����v^��Zs�d��D\"���l��\"��\0��b��i=��ß��򘛛E8F2�D�\\�r�{�R2�D8���,2�,��F�R�j�p���Z��_�Y��\rS��(�a���_!��	�T\Z�H��s�d28sf�/$��v����Ʉ�J�133�h4�B��%��f��R��X}\'	�r9��ξ���r��ו��d������j^ܹ��/�=�/`nn�]K�����T*!�H \Z�W��Ŝ�������#O ��czz򝚦u�T*mw�r���<E&M ��YDӯ�\n~�C�e�ryD�Q��	��y�̄o�4m[��Z5�Ew\n�zb-�J�z�L�r6�R� �ZH����Y���n\0���~]���&�@t� �dP�hPd��h\0��L}Y���ca�)$����9e+����fsW��e�r9���r9��Z�\\u.\nH$��H�R���}-\0d2��$A,F��Sd2\Z�s >�K���\04\nPJ���*�R\'|\Z�\\�j\r�T��: �I��V��X,!�͢X,��H�S+�uI���BL?s��;�;_�JR��@�L�2f�\ndi�w6��O���\Z8���@eY(��)s�U�r9����Z!s���b��M�dT��jUPJa2���x[aK�a85�cq�����|�h<v�+�y��b2�h�j�;	�1��4=\0�C\Z�Uc�A��{�M��$I(�(�udwj����4��T*��I��5�\'K��˩�A\\����Z�5��\\Uۨ+닜8�É\'���Q�� ���mV\n�e ����4\n0@)���k��A�L�6ǔ�FXZ�VQ��P.�I����(NY����d��4�܈�0:��/B4MkTǌ:�Z��忟�;�*\n�<�A��/�L,�y��\0,�s�:C(T�@�umb+_)�\Z�Y? IR���(2E�p���F���\n��ju�B�jC/Z�]��F!ø�W����Fq��40�i���f���R�aP���~�Y���%��h�$\rQS�M&8��?w�~�x��0Z8JU�a�i�H�-���r#�Xr�F(����ĀP�����\"�X,���,�쫯�ֺ�wɊ\"YV �5�R���C�G�����e����Xt�e���)�cT�a�H*�jvh�{B��\Z4M�,K��,��M�!��RHj����qf���������\'\n&Q������Z�M�ʰ\0��\0X,��F~x���i��W�t�\nkX��\Z�e��$I�/����n��#��,w�F��ӧ�=�dY^�fތ3n���@�t�Ҳ<O!&��eU�2��ۏ�m ��c	D�X���*�r�Љ��(��|>����Q\0���lU�U,�M��M�^`]\"Ö9\0�8��8���`�oT@S5�&)]nƻRh��,��<�1�.\'̈́���*!(���p8|���f�\\�����Z����J�77�qo��q\\�\0Ad\'i���X�<��b5��z^E�!\0Y6�,C����n�$�d^2�Litt�C���������cX6��R0S�a2� �f�LB����WD8�tT�EݨKP[�%ɺϐe@UUT\nPB�,�e�J����lvxxĒN�1h�̐i�ҿ�b��e��j�(�p:�c,������ \0��XD<�;׵��	��C(ÃRu��\r���Lh�����Z�\\�����V������5̏(\n������EN��(�)f�A�E\n����8\\,���#��.#����@ԕ��v�/���g���_�e<���j��ʴ��P��`����x�t: �\"ZZ�O.*����/L�R��\0�~���L����4H�4}nt�h�T]i�p�R��3ӣG��eYƓO�<�Մ۪a�~������	��	��ux��J�Lч�v��8�<�)Z�w����\'�x�T�X���8v���G�f��f�����p��������t:\nu�˲ų�P0�a�(����v\r�\0`��Y�M1aLB���V�x�G��i�T�׾���f|��z;�~����}��l��}�֔E��ʽ/��̣n7A(Ġ�����f}�{���*&4�B{����㜢�Q���x���w�����Ӟ��n����=���AOO߯,�芆X��lU��==@W�Ң��[��ڰL�d2���5Mk4����b����{��A�\r�;v����ۃ`0�˅�޾{�Rc\0\\~��ӂp��n7��M�m�����0�9�\'��S���鹹�Fln�!M������СC��-�&�	6��`}}}����ۂ;v}U�Sk�\"�\\sɗ�֩�����;v�����L`�/��R���?�~���T�A����@h~~�\"߆@ ���>���!����TWW�}X���<�\\�����#� �};�� ���|z���.�B066&�q�]���t��H$����}���F��6�l۶\r��;��Յ��vi׮=�\"�L�;\Z�W��\"�t�\'B!`�N`�`�6�`;�tR�\n��F�\0�W��bm�8�y$	�v�mr<_dr��J)�~�����kx����.Ҍh��v������ؽ{W����{�M&��Ȳa�j�����>|%!��dٖ]���bN`z�A4����*�*���D�̹�����w\"��-�ܒ:y�dKs1������i.~����a��O�{ｻ��E��3���r��a6��v��ޮ����~tuu���\r|��j]q�䚆�Uο���W2L�a�\r�I4�\\��K13K0?K�L1��)L&������,�R\"f���o�?~����,-i\Z�7�o8�|p�$�N}�3��4ʣ�x��W-� ����m6+|>:::��ۃ��.�����о[�v�KXe��,��}��\0��С�0��=`�\n�	�ڀ� E,���MUNICIPAL GOVERNMENT OF PAETE | MISO Version 1.0\r,׭a0A/+.0�ᇿ�sxx$���޹m�6�j�eDcU�S\n�O�Y��f�����G{{�P��Ax�-���=�s�%��5W���d���/=������g,���N��\'�Łh� ��P�HC(X�5`���r\Z�N���������4l}��]M��}�q�,�g�}������>y�]�z���\'�X��`}���b������ϋ@�\r~��Ow}�������}q������_~��?(��?�<D�[r9�ZUφJ�Mc���J��*��������655u�\rӲZ�ظw�Y�4\r�T\Zw�u��\'����;���v�5�t��p�&�b#�t:�usӎ@ ��V?�n�������c����s���p0��׼��\0~���>?�7k��z��\\��Vh\Z�j�B�2��]�T0J)���*?��Oƿ���\r����0���^��4s5k����e�F5�І���7�g�y�_~E�-oyK�����|�&�L&k�Z��b=�\n�����΀6�����������06\0ܱ�h��W�	�Kǎ�t���H;��_UV�RU:se.�;�Ng�(2*�r1��F��(�=�ܳ�^x����w7�����R�^�J��QFX�9U�@�Ç����G���V�߿o���ˊ}}}V��G�_͖|>_t:\0l6��;14�wj׮�G�������ϙLB�@Lي�Tw�T�X,�a�ꫫ�p�|��gs�eᰏq8N�J�Rinnnltt�#�N�:<99��ͩ���j%��R��R\'ݬm�����L�S������s�10�/��s�?���=��bS.�sPS�>o�֬nWk��k���W�i���%�,K޹��?����=	��] ss�H&�(PU�����W\\�pD�4D�Q;v���O>���W�ܕH$\ZLXj6���f�.�y�f����r>���[�������*˥��2�v�L��g0xd������<\"ɷ��$Se��rR�\'���[�][���/�7qA�(ʞ����\'&��*�J\"��#�L!\Z�b~>�D\"�|>���Z�մ���0�� ����\r7܀X,��~��/}��MO��q�\"i5���W�#����1`�ޡ�{��W�7��\r���o�!���Uь\Z�j\Z*e32�P� ���s䭄���_N>b6����+���|3�;�N]�����bQK&�E2�B,�=�H �N�X��#4M��6���-��|>�y�Co{����/~���P�Zm4�6���EC˙#��MP::���O�������Ų�k� �^l�\nob!K�j���	�(�d�$u��f�󩧦1����W�o9(��c�:y���L��󘛛���,b�(R�4\n���RC�x���dZ�&X)�`4���n��?}j覛n�~�c�;ڢi��(�46���6wf��މv뭷N�ӟ�\n]g��5P��WT7kbY���R��b1\r�4�H��~O�;e�ۡCG��k.�֖1@��}Ǐ����ɉ�X�pS���\'���P���aA`2���Lc��r�������o�я~�O~��}���X�A/�o����e6���}n��xG�-��i��-��R�ѭd��P`�JQT�s�\Z�3mm@g���Ep�/}�С�뜎�_��\'o��$x��#?	�����s���8\"��J��Y��	rnMR��Y�V�����x</}�_2\"\Z�$���m\"�a~\\.��oD���ڞ��Vn(��U#�$�r	�d�|� ��1!�$��(����ηj�y��#���.�o����9z��ǧ�����a���bt�\"�2�,*�ʪ\0M�I��g|���8����/�,�ˈ\Z�4@���߈���׶-g���xW��F=+�4@��\nP��\"��i�e	J%\r�� ����<���_��A�@)�=q�أ����a�:u\Z###�#���k\"���b�H�����\\.��W���W\Z�g�&(���@�\0��ᡇ�y�k�����I�����܌�����HA�Tk:䙦ttxw���K/�p���>m�螘8s���؞�ٹ:P�����fs��B������㓿��/{B�o�\0�eq�����|��}jn���Q��~��`�i��a*_p�r{V�$�L�|����\'066���Q��d��W��`_�җz|>�\"[o���-��2������B�UU�W�LSS�����E<NQ*���С��]����<u����L���ÝA.����-��������˲R�	�x�^�{�]k~��#q�R��402���L��V��g�}~�j螛�}w<3E�QLNN5��\nZͯ�z�[v_u�U�c0��я����ټ�L04az\Z�\0��bQ@��vϊPU�666zW6����\"�0�*���\nZ�n�����η��W}�;�ٷ�}�[��e=<�����\0�4A�\Z|�3�}�e�GoI��H&����C,G�\\���,0�����j���k�u\rЯ;�cJ�k̛ռ�0�X�+�ሁ��@�[޳�ggg�^,�H$�E����h�j�o��ˆ	r�=��?{s��]2{�2��i�F�hLC.G Im�>��Z1�R)�F���B��T*�T*�R�|^M�F���7W_}����\nB����Ͽj�fcs\"���:��ZO�4�\\a�LiH�	r9�VQ*�s���k����|>�MϹ�����ݎ�/�y�]w����ٹΩ�MT�Ѭ�<ӷc��m`T�|� �rY�J�4�u���d.7�jr9�{+�+M�R�N���9�Þ={�[��^.!J��K�lm��s���R���l�T)�y���p�.\n۪�\Z��\0��-��3Qm�r��������moiiAOO��<JPJXMkj�$M��B�*����B�\"_�(���)�n\0`TU���NI�P�TP�T6�|��0���ƿ�m����\0`@���\Zؖ1��MvW�2��\Z�\")����\\S	�-�!���i@�BP*PT*��A�H\'\00���,h�H��E�����lyTb|���wv�o�~���F�\"�Q\r���$�}��FV�/`׸Sǵ��b�A�L I������4U4:�ey��x��1r5<obȖm��S�V���ڵ���\Z��峰�Kz�S�\0��\0O\r��V�nʤ\ZP�0(���T\0p�Rn	�ʖ9M�������l�Ja)���>��cT�^J�J)�L&�#�x|Q�f�~�c����N�\\.ϣT�HU�B�(!��6�	!�\Z!��iŒ@JeA��,��J�e3�q���ԓ��ȇ���zd��7�Q��UL��a�P�nM� %`\0Ma����Q�����q�҉�ҩ3���l�b�~����\n�e?���� ��Y��վ�ZM2馺J�E�x\rC��*�P�t�Z��KҥPՎ�t)�0Rs!�(ho4m��$	���JM;����C���4_Z%�O�%`XMU@���4Ü���T��M,a2�P,��|ZF߉Y��(���i�(�h*d�E�AUeP��a��8>k2	u�2�Xo���:��):8���%<G�z�d���P\r:R�(R�-� ��/\n-\r�2��ql�g�t�F|�Bt��Ou��X�-�l�9��4p�9�۔�ͱ�T�*�e\n�%�B����\r��+��qQ���U��9����ey/��G��2�V�����!C��q�\"2ԃ=y(\"L&!�������(�v�vA@�R�Tf$�\niV����]YOA\0�B`�����&��;���a\\�Kē�\'�A�TD*�n�}���V�@8���b��j� p:c,�9\0p�=��x�~����Ba�8i��ʲ���==+�\ZT�����3��	Р����%�yӿ{��=95=�ߧO\r�^Q4d2i��͢P(,�yqӀ�q8���0��p�</D��q�݇Dq�8����)*�F�i�0���9�� �z���}��]�=\0�����|��������_���J�8�~r�W#&��x�X\'�͖	��?c�������\r�ż�4B#�i\n����D\rEk+��8�5�|�/\0@�s�P�����EK��u����0E�^o�N\'\\.7���TGG�[v�\r>���mp�\\[$I���u�Ѐ����@[�����ؓ���8Sl����;N�~�~+�N���}+,\0��\r�\Z���Î���X�-73\0��m�s�[��z������ji��l�%6�\0�EEk+A����O`�i���==���}�@���nwc�~�oK����,�f3|>_}^~��tt��R�\Z����r9��.;��z!��EQg��q)|>�]\Z�B<-f��O��-�Zad�}i��3	�e)ˍ���B�x�������l[�+��r0����������Ӎ���ݮ����M^G�u������@p8j�Xb����H/�����Ѓ~[�y�.�� \\�<��р�	p�����M{ʸ%*sj׮K>��e���ՉB��h=704/�EQ\'~W�}EW7S�,\Z��������Į]�?�ͦ���Չ|>�h��D���v������^ov���o� �,�ޥ���~�}��u�$�lhdYi����E�����\n�-��6��~{z��oi��|۶���$��J��j�q��T|�����ߏ��~��������|\0ke`j``�ߖJ�m��l36^PJ133�x����8]�=��S\'���\n�#q��߹sp_r���ڶm��R��cEQ�eYj�\"����y��3\nP:\\M۷o���vtv���ޑߵ�w,Wí�e��\\r�m�Z�IUU�F���9D\"3�F��tN���1^�X\0���\'�\0�+5�pL޶w�e��$��=��5M�,�a��Ap[}\Z,�q����A���cpp;zzz�����=�&�7���߮�D^\Z\Z��FM�~�0���8���قH$�8Sx}%L�p�Sz���p,�I\0�N������������A[�pď;o�첃g���^ػw�(�?!������333��Cތ6U?�ł���@��.�8p��Mf������3�ۿ��יL��8��6��p:p�݈D\"��b����2˥�J@a8�L\ZD��� �x4��2��:	�A��Z�?r:cw��wp|c�P|n���n�y���w�����˅���b1��&7���\0kFN1Y�P��]�p5�{���b��\nŭ�T��CC�o����y�z���8�y��u�~6xx��R���%0�D���	x=��O�omn��!A����Uz`�����9D��޽n�Zm�<w��j������\ZǐW*ճc^Jt���v�������@0؀�9�s����L5M�9,�����8u����x��d�H$����H$��Cʲ�� l�/��W��G�,RXm��q:	�n�����������X[k���>�;��z�������ƁpsϡX,�V�5̪�\r���7\0��Ě�煞�����ǃ]�.�������V2\0\0 ��P$�����[s�,��r�<�����FH&��f�,��\" ��Y$ͨ;�P� ��K0�����L���[�%�����\'&��4�ˣP( ��B��G�PD�R�$I\r�C��A`�Z�p8�t:�t:�p��==}O����c6[&p�d�	��Z��F��<�~k*�tT����\r���Ƹ����y�d8Nϗ�,�{��\n�Z����>�ɞ��$.��T*�����5�J���^�FS��\r\r`Y����8�A?��P(�@���s�	�,�3���Bn_*��.�M�f��k���Y60ϲ��XVͰ�5�ژ�={���ةbM�v�rك�T�l63��f��\r)�Y����t:�n��hK��I����qYl��lqը[UU�,K~EQ\\����\ZN�w��?�EqIRͯ(�GU5�R0�\0�T9�˚L�8ϛ��!����\0��4�9�)�\0\0\0\0IEND�B`�', 'Department of Science and Technology', 'dostco.png', '13520', 'image/x-png');


#
# TABLE STRUCTURE FOR: tblAgencyx
#

DROP TABLE IF EXISTS `tblAgencyx`;

CREATE TABLE `tblAgencyx` (
  `agencyName` varchar(100) NOT NULL DEFAULT '',
  `abbreviation` varchar(10) NOT NULL DEFAULT '',
  `dtrScheme` varchar(10) NOT NULL DEFAULT '',
  `fixedFrom` time DEFAULT '00:00:00',
  `address` varchar(255) NOT NULL DEFAULT '',
  `zipCode` varchar(4) NOT NULL DEFAULT '',
  `telephone` varchar(50) NOT NULL DEFAULT '',
  `facsimile` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(80) NOT NULL DEFAULT '',
  `website` varchar(80) NOT NULL DEFAULT '',
  `fixedTo` time DEFAULT '00:00:00',
  `morningFrom` time DEFAULT '00:00:00',
  `morningTo` time DEFAULT '00:00:00',
  `afternoonFrom` time DEFAULT '00:00:00',
  `afternoonTo` time DEFAULT '00:00:00',
  `salarySchedule` varchar(10) NOT NULL DEFAULT '',
  `pagibigId` varchar(20) NOT NULL DEFAULT '',
  `gsisId` varchar(20) NOT NULL DEFAULT '',
  `gsisEmpShare` int(4) NOT NULL DEFAULT 0,
  `gsisEmprShare` int(4) NOT NULL DEFAULT 0,
  `pagibigEmpShare` int(4) NOT NULL DEFAULT 0,
  `pagibigEmprShare` int(4) NOT NULL DEFAULT 0,
  `philhealthEmpShare` int(4) DEFAULT 0,
  `philhealthEmprShare` int(11) DEFAULT 0,
  `providentEmpShare` int(4) DEFAULT 0,
  `providentEmprShare` int(4) DEFAULT 0,
  `philhealthPercentage` decimal(4,2) NOT NULL DEFAULT 0.00,
  `lbStartMonth` int(2) NOT NULL DEFAULT 0,
  `lbStartYear` int(4) NOT NULL DEFAULT 0,
  `agencyTin` varchar(25) NOT NULL DEFAULT '',
  `PhilhealthNum` varchar(20) DEFAULT NULL,
  `Vision` text DEFAULT NULL,
  `Mission` text DEFAULT NULL,
  `Mandate` text NOT NULL,
  `zonecode` varchar(20) NOT NULL DEFAULT '',
  `region` varchar(20) NOT NULL DEFAULT '',
  `AccountNum` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`agencyName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblAgencyx` (`agencyName`, `abbreviation`, `dtrScheme`, `fixedFrom`, `address`, `zipCode`, `telephone`, `facsimile`, `email`, `website`, `fixedTo`, `morningFrom`, `morningTo`, `afternoonFrom`, `afternoonTo`, `salarySchedule`, `pagibigId`, `gsisId`, `gsisEmpShare`, `gsisEmprShare`, `pagibigEmpShare`, `pagibigEmprShare`, `philhealthEmpShare`, `philhealthEmprShare`, `providentEmpShare`, `providentEmprShare`, `philhealthPercentage`, `lbStartMonth`, `lbStartYear`, `agencyTin`, `PhilhealthNum`, `Vision`, `Mission`, `Mandate`, `zonecode`, `region`, `AccountNum`) VALUES ('MUNICIPAL GOVERNMENT OF PAETE | MISO Version 1.0', 'DOST', '', '00:00:00', 'General Santos Ave., Bicutan, Taguig City', '1631', '8372071-82', '8372937', '  ', 'www.dost.gov.ph', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', 'Bi-Monthly', '', '', '9', '12', '100', '100', '50', '50', '2', '5', '0.00', '1', '2005', '044-000-553-203', '140039100007', 'A prosperous Filipino nation whose socio-economic well-being is assured through competent and responsible use of scientific knowledge and technological innovations.', 'To direct, lead, and coordinate scientific and technological efforts in the country and ensure that these result to the maximum economic and social benefits for the Filipino people.', '', '', 'NCR', '     ');


#
# TABLE STRUCTURE FOR: tblAppointment
#

DROP TABLE IF EXISTS `tblAppointment`;

CREATE TABLE `tblAppointment` (
  `appointmentCode` varchar(20) NOT NULL DEFAULT '',
  `appointmentDesc` varchar(50) NOT NULL DEFAULT '',
  `header` varchar(255) NOT NULL DEFAULT '',
  `leaveEntitled` char(1) NOT NULL DEFAULT '',
  `paymentBasis` varchar(5) NOT NULL DEFAULT '',
  `system` tinyint(1) NOT NULL DEFAULT 0,
  `incPlantilla` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`appointmentCode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblAppointment` (`appointmentCode`, `appointmentDesc`, `header`, `leaveEntitled`, `paymentBasis`, `system`, `incPlantilla`) VALUES ('T', 'Temporary', 'DOST-ICT', 'N', 'WKDY', '1', '0');
INSERT INTO `tblAppointment` (`appointmentCode`, `appointmentDesc`, `header`, `leaveEntitled`, `paymentBasis`, `system`, `incPlantilla`) VALUES ('a', 'Probationary', 'STII', 'N', 'CLNDR', '1', '0');
INSERT INTO `tblAppointment` (`appointmentCode`, `appointmentDesc`, `header`, `leaveEntitled`, `paymentBasis`, `system`, `incPlantilla`) VALUES ('P', 'Permanent', 'Permanent', 'Y', 'CLNDR', '1', '1');
INSERT INTO `tblAppointment` (`appointmentCode`, `appointmentDesc`, `header`, `leaveEntitled`, `paymentBasis`, `system`, `incPlantilla`) VALUES ('Emrg', 'Emergency Employee', 'Emergency Employee', 'N', 'CLNDR', '1', '0');
INSERT INTO `tblAppointment` (`appointmentCode`, `appointmentDesc`, `header`, `leaveEntitled`, `paymentBasis`, `system`, `incPlantilla`) VALUES ('Cas', 'Casual', 'Casual', 'Y', 'CLNDR', '1', '0');
INSERT INTO `tblAppointment` (`appointmentCode`, `appointmentDesc`, `header`, `leaveEntitled`, `paymentBasis`, `system`, `incPlantilla`) VALUES ('Prt', 'Part-time', 'Part Time', 'N', 'CLNDR', '1', '0');
INSERT INTO `tblAppointment` (`appointmentCode`, `appointmentDesc`, `header`, `leaveEntitled`, `paymentBasis`, `system`, `incPlantilla`) VALUES ('SU', 'Substitute', 'Substitute Employee', 'N', 'CLNDR', '1', '0');
INSERT INTO `tblAppointment` (`appointmentCode`, `appointmentDesc`, `header`, `leaveEntitled`, `paymentBasis`, `system`, `incPlantilla`) VALUES ('Phs', 'Phase Out', 'Phase Out', 'N', 'CLNDR', '1', '0');
INSERT INTO `tblAppointment` (`appointmentCode`, `appointmentDesc`, `header`, `leaveEntitled`, `paymentBasis`, `system`, `incPlantilla`) VALUES ('CT', 'Co-terminous', 'Co-terminous', 'Y', 'CLNDR', '1', '1');
INSERT INTO `tblAppointment` (`appointmentCode`, `appointmentDesc`, `header`, `leaveEntitled`, `paymentBasis`, `system`, `incPlantilla`) VALUES ('Susp', 'Suspended', 'Suspended', 'N', '', '1', '0');
INSERT INTO `tblAppointment` (`appointmentCode`, `appointmentDesc`, `header`, `leaveEntitled`, `paymentBasis`, `system`, `incPlantilla`) VALUES ('Lump', 'Contractual-Lumpsum', '', 'N', '', '1', '0');
INSERT INTO `tblAppointment` (`appointmentCode`, `appointmentDesc`, `header`, `leaveEntitled`, `paymentBasis`, `system`, `incPlantilla`) VALUES ('GIA', 'Contractual-GIA', '', 'N', '', '1', '0');
INSERT INTO `tblAppointment` (`appointmentCode`, `appointmentDesc`, `header`, `leaveEntitled`, `paymentBasis`, `system`, `incPlantilla`) VALUES ('PA', 'Presidential Appointee', '', 'Y', '', '1', '1');
INSERT INTO `tblAppointment` (`appointmentCode`, `appointmentDesc`, `header`, `leaveEntitled`, `paymentBasis`, `system`, `incPlantilla`) VALUES ('JO', 'Job Order', '', 'N', '', '1', '0');
INSERT INTO `tblAppointment` (`appointmentCode`, `appointmentDesc`, `header`, `leaveEntitled`, `paymentBasis`, `system`, `incPlantilla`) VALUES ('GOV', 'Goverment Employee', '', 'Y', '', '1', '0');
INSERT INTO `tblAppointment` (`appointmentCode`, `appointmentDesc`, `header`, `leaveEntitled`, `paymentBasis`, `system`, `incPlantilla`) VALUES ('OJT', 'On The Job Training', '', 'N', '', '1', '0');
INSERT INTO `tblAppointment` (`appointmentCode`, `appointmentDesc`, `header`, `leaveEntitled`, `paymentBasis`, `system`, `incPlantilla`) VALUES ('CONT', 'Contractual', '', 'N', '', '1', '0');
INSERT INTO `tblAppointment` (`appointmentCode`, `appointmentDesc`, `header`, `leaveEntitled`, `paymentBasis`, `system`, `incPlantilla`) VALUES ('OA', 'Original appointment', '', 'N', '', '1', '0');
INSERT INTO `tblAppointment` (`appointmentCode`, `appointmentDesc`, `header`, `leaveEntitled`, `paymentBasis`, `system`, `incPlantilla`) VALUES ('PRI', 'Private', '', 'Y', '', '1', '0');
INSERT INTO `tblAppointment` (`appointmentCode`, `appointmentDesc`, `header`, `leaveEntitled`, `paymentBasis`, `system`, `incPlantilla`) VALUES ('Prom', 'Promotion', '', 'Y', '', '1', '0');
INSERT INTO `tblAppointment` (`appointmentCode`, `appointmentDesc`, `header`, `leaveEntitled`, `paymentBasis`, `system`, `incPlantilla`) VALUES ('PromTran', 'PromotionTransfer', '', 'Y', '', '1', '0');
INSERT INTO `tblAppointment` (`appointmentCode`, `appointmentDesc`, `header`, `leaveEntitled`, `paymentBasis`, `system`, `incPlantilla`) VALUES ('E', 'Elective', '', 'Y', '', '1', '0');
INSERT INTO `tblAppointment` (`appointmentCode`, `appointmentDesc`, `header`, `leaveEntitled`, `paymentBasis`, `system`, `incPlantilla`) VALUES ('Proj', 'Project Based', '', 'Y', '', '1', '0');
INSERT INTO `tblAppointment` (`appointmentCode`, `appointmentDesc`, `header`, `leaveEntitled`, `paymentBasis`, `system`, `incPlantilla`) VALUES ('Trainee', 'Trainee', '', 'N', '', '1', '0');
INSERT INTO `tblAppointment` (`appointmentCode`, `appointmentDesc`, `header`, `leaveEntitled`, `paymentBasis`, `system`, `incPlantilla`) VALUES ('Reg', 'Regular', '', 'Y', '', '1', '0');
INSERT INTO `tblAppointment` (`appointmentCode`, `appointmentDesc`, `header`, `leaveEntitled`, `paymentBasis`, `system`, `incPlantilla`) VALUES ('O', 'Others', '', 'Y', '', '1', '0');
INSERT INTO `tblAppointment` (`appointmentCode`, `appointmentDesc`, `header`, `leaveEntitled`, `paymentBasis`, `system`, `incPlantilla`) VALUES ('SE', 'Secondment', '', 'Y', '', '1', '0');
INSERT INTO `tblAppointment` (`appointmentCode`, `appointmentDesc`, `header`, `leaveEntitled`, `paymentBasis`, `system`, `incPlantilla`) VALUES ('PC1', 'Conferred the rank of Scientist I', '', 'Y', '', '1', '1');
INSERT INTO `tblAppointment` (`appointmentCode`, `appointmentDesc`, `header`, `leaveEntitled`, `paymentBasis`, `system`, `incPlantilla`) VALUES ('PC2', 'Conferred the rank of Scientist II', '', 'Y', '', '1', '1');
INSERT INTO `tblAppointment` (`appointmentCode`, `appointmentDesc`, `header`, `leaveEntitled`, `paymentBasis`, `system`, `incPlantilla`) VALUES ('PC3', 'Conferred the rank of Scientist III', '', 'Y', '', '1', '1');
INSERT INTO `tblAppointment` (`appointmentCode`, `appointmentDesc`, `header`, `leaveEntitled`, `paymentBasis`, `system`, `incPlantilla`) VALUES ('PC4', 'Conferred the rank of Scientist IV', '', 'Y', '', '1', '1');
INSERT INTO `tblAppointment` (`appointmentCode`, `appointmentDesc`, `header`, `leaveEntitled`, `paymentBasis`, `system`, `incPlantilla`) VALUES ('PC5', 'Conferred the rank of Scientist V', '', 'Y', '', '1', '1');
INSERT INTO `tblAppointment` (`appointmentCode`, `appointmentDesc`, `header`, `leaveEntitled`, `paymentBasis`, `system`, `incPlantilla`) VALUES ('CTI', 'Co-Terminous with the Incumbent', '', 'Y', '', '1', '1');
INSERT INTO `tblAppointment` (`appointmentCode`, `appointmentDesc`, `header`, `leaveEntitled`, `paymentBasis`, `system`, `incPlantilla`) VALUES ('Int', 'Intern', '', 'Y', '', '0', '0');


#
# TABLE STRUCTURE FOR: tblAttendanceCode
#

DROP TABLE IF EXISTS `tblAttendanceCode`;

CREATE TABLE `tblAttendanceCode` (
  `code` varchar(5) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblAttendanceCode` (`code`, `name`) VALUES ('PL', 'Privilege Leave');
INSERT INTO `tblAttendanceCode` (`code`, `name`) VALUES ('VL', 'Vacation Leave');
INSERT INTO `tblAttendanceCode` (`code`, `name`) VALUES ('SL', 'Sick Leave');
INSERT INTO `tblAttendanceCode` (`code`, `name`) VALUES ('PTL', 'Paternity Leave');
INSERT INTO `tblAttendanceCode` (`code`, `name`) VALUES ('ML', 'Maternity Leave');
INSERT INTO `tblAttendanceCode` (`code`, `name`) VALUES ('FL', 'Force Leave');
INSERT INTO `tblAttendanceCode` (`code`, `name`) VALUES ('STL', 'Study Leave');
INSERT INTO `tblAttendanceCode` (`code`, `name`) VALUES ('HFL', 'Half-day Force Leave');
INSERT INTO `tblAttendanceCode` (`code`, `name`) VALUES ('HPL', 'Half-day Privilege Leave');
INSERT INTO `tblAttendanceCode` (`code`, `name`) VALUES ('HVL', 'Half-day Vacation Leave');
INSERT INTO `tblAttendanceCode` (`code`, `name`) VALUES ('HSL', 'Half-day Sick Leave');
INSERT INTO `tblAttendanceCode` (`code`, `name`) VALUES ('OB', 'Official Business');
INSERT INTO `tblAttendanceCode` (`code`, `name`) VALUES ('QB', 'Quasi Official Business');
INSERT INTO `tblAttendanceCode` (`code`, `name`) VALUES ('OT', 'Overtime');
INSERT INTO `tblAttendanceCode` (`code`, `name`) VALUES ('TO', 'Travel Order');
INSERT INTO `tblAttendanceCode` (`code`, `name`) VALUES ('TT', 'Trip Ticket');
INSERT INTO `tblAttendanceCode` (`code`, `name`) VALUES ('MET', 'Meeting');
INSERT INTO `tblAttendanceCode` (`code`, `name`) VALUES ('FC', 'Flag Ceremony');
INSERT INTO `tblAttendanceCode` (`code`, `name`) VALUES ('OFF', 'Offset');


#
# TABLE STRUCTURE FOR: tblAttendanceScheme
#

DROP TABLE IF EXISTS `tblAttendanceScheme`;

CREATE TABLE `tblAttendanceScheme` (
  `schemeCode` varchar(5) NOT NULL DEFAULT '',
  `schemeName` varchar(255) NOT NULL DEFAULT '',
  `schemeType` varchar(20) NOT NULL DEFAULT '',
  `amTimeinFrom` time NOT NULL DEFAULT '00:00:00',
  `amTimeinTo` time NOT NULL DEFAULT '00:00:00',
  `overtimeStarts` time NOT NULL DEFAULT '00:00:00',
  `overtimeEnds` time NOT NULL DEFAULT '00:00:00',
  `gracePeriod` int(2) NOT NULL DEFAULT 0,
  `gpLeaveCredits` char(1) NOT NULL DEFAULT 'Y',
  `gpLate` char(1) NOT NULL DEFAULT 'N',
  `wrkhrLeave` int(2) NOT NULL DEFAULT 0,
  `hlfLateUnd` char(1) NOT NULL DEFAULT 'N',
  `fixMonday` char(1) NOT NULL,
  `allow30` char(1) NOT NULL,
  `strict` char(1) NOT NULL,
  `pmTimeoutFrom` time DEFAULT NULL,
  `pmTimeoutTo` time DEFAULT NULL,
  `nnTimeinTo` time DEFAULT NULL,
  `nnTimeoutFrom` time DEFAULT NULL,
  `nnTimeoutTo` time DEFAULT NULL,
  `nnTimeinFrom` time DEFAULT NULL,
  PRIMARY KEY (`schemeCode`),
  KEY `schemeName` (`schemeName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblAttendanceScheme` (`schemeCode`, `schemeName`, `schemeType`, `amTimeinFrom`, `amTimeinTo`, `overtimeStarts`, `overtimeEnds`, `gracePeriod`, `gpLeaveCredits`, `gpLate`, `wrkhrLeave`, `hlfLateUnd`, `fixMonday`, `allow30`, `strict`, `pmTimeoutFrom`, `pmTimeoutTo`, `nnTimeinTo`, `nnTimeoutFrom`, `nnTimeoutTo`, `nnTimeinFrom`) VALUES ('GEN', 'General', 'Sliding', '07:00:00', '09:00:00', '00:00:00', '00:00:00', '0', 'N', 'N', '0', 'N', 'Y', 'N', 'N', '04:00:00', '06:00:00', '02:00:00', '12:00:00', '12:59:00', '12:00:00');
INSERT INTO `tblAttendanceScheme` (`schemeCode`, `schemeName`, `schemeType`, `amTimeinFrom`, `amTimeinTo`, `overtimeStarts`, `overtimeEnds`, `gracePeriod`, `gpLeaveCredits`, `gpLate`, `wrkhrLeave`, `hlfLateUnd`, `fixMonday`, `allow30`, `strict`, `pmTimeoutFrom`, `pmTimeoutTo`, `nnTimeinTo`, `nnTimeoutFrom`, `nnTimeoutTo`, `nnTimeinFrom`) VALUES ('FIX', 'Fixed', 'Fixed', '08:00:00', '08:00:00', '00:00:00', '00:00:00', '0', 'Y', 'Y', '0', 'Y', 'Y', 'N', 'N', '05:00:00', '05:00:00', '01:00:00', '12:00:00', '12:59:00', '01:00:00');
INSERT INTO `tblAttendanceScheme` (`schemeCode`, `schemeName`, `schemeType`, `amTimeinFrom`, `amTimeinTo`, `overtimeStarts`, `overtimeEnds`, `gracePeriod`, `gpLeaveCredits`, `gpLate`, `wrkhrLeave`, `hlfLateUnd`, `fixMonday`, `allow30`, `strict`, `pmTimeoutFrom`, `pmTimeoutTo`, `nnTimeinTo`, `nnTimeoutFrom`, `nnTimeoutTo`, `nnTimeinFrom`) VALUES ('test', 'test', 'Sliding', '07:00:00', '12:00:00', '00:00:00', '00:00:00', '0', 'Y', 'N', '0', 'N', 'Y', 'N', 'N', '12:00:00', '04:00:00', '12:00:00', '12:00:00', '12:00:00', '12:00:00');


#
# TABLE STRUCTURE FOR: tblAttendanceScheme_Online_DTR
#

DROP TABLE IF EXISTS `tblAttendanceScheme_Online_DTR`;

CREATE TABLE `tblAttendanceScheme_Online_DTR` (
  `schemeCode` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `schemeName` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `schemeType` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `amTimeinFrom` time NOT NULL DEFAULT '00:00:00',
  `amTimeinTo` time NOT NULL DEFAULT '00:00:00',
  `overtimeStarts` time NOT NULL DEFAULT '00:00:00',
  `overtimeEnds` time NOT NULL DEFAULT '00:00:00',
  `gracePeriod` int(2) NOT NULL DEFAULT 0,
  `gpLeaveCredits` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'Y',
  `gpLate` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'N',
  `wrkhrLeave` int(2) NOT NULL DEFAULT 0,
  `hlfLateUnd` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'N',
  `fixMonday` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `allow30` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `strict` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pmTimeoutFrom_old_data` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pmTimeoutTo_old_data` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nnTimeinTo_old_data` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nnTimeoutFrom_old_data` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nnTimeoutTo_old_data` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nnTimeinFrom_old_data` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pmTimeoutFrom` time DEFAULT NULL,
  `pmTimeoutTo` time DEFAULT NULL,
  `nnTimeinTo` time DEFAULT NULL,
  `nnTimeoutFrom` time DEFAULT NULL,
  `nnTimeoutTo` time DEFAULT NULL,
  `nnTimeinFrom` time DEFAULT NULL,
  PRIMARY KEY (`schemeCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `tblAttendanceScheme_Online_DTR` (`schemeCode`, `schemeName`, `schemeType`, `amTimeinFrom`, `amTimeinTo`, `overtimeStarts`, `overtimeEnds`, `gracePeriod`, `gpLeaveCredits`, `gpLate`, `wrkhrLeave`, `hlfLateUnd`, `fixMonday`, `allow30`, `strict`, `pmTimeoutFrom_old_data`, `pmTimeoutTo_old_data`, `nnTimeinTo_old_data`, `nnTimeoutFrom_old_data`, `nnTimeoutTo_old_data`, `nnTimeinFrom_old_data`, `pmTimeoutFrom`, `pmTimeoutTo`, `nnTimeinTo`, `nnTimeoutFrom`, `nnTimeoutTo`, `nnTimeinFrom`) VALUES ('FIX', 'Fixed', 'Fixed', '08:00:00', '08:00:00', '00:00:00', '00:00:00', '0', 'Y', 'Y', '0', 'Y', 'Y', 'N', 'N', '05:00:00', '05:00:00', '01:00:00', '12:00:00', '12:59:00', '01:00:00', '17:00:00', '17:00:00', '13:00:00', '12:00:00', '12:59:00', '13:00:00');
INSERT INTO `tblAttendanceScheme_Online_DTR` (`schemeCode`, `schemeName`, `schemeType`, `amTimeinFrom`, `amTimeinTo`, `overtimeStarts`, `overtimeEnds`, `gracePeriod`, `gpLeaveCredits`, `gpLate`, `wrkhrLeave`, `hlfLateUnd`, `fixMonday`, `allow30`, `strict`, `pmTimeoutFrom_old_data`, `pmTimeoutTo_old_data`, `nnTimeinTo_old_data`, `nnTimeoutFrom_old_data`, `nnTimeoutTo_old_data`, `nnTimeinFrom_old_data`, `pmTimeoutFrom`, `pmTimeoutTo`, `nnTimeinTo`, `nnTimeoutFrom`, `nnTimeoutTo`, `nnTimeinFrom`) VALUES ('GEN', 'General', 'Sliding', '07:00:00', '09:00:00', '00:00:00', '00:00:00', '0', 'N', 'N', '0', 'N', 'Y', 'N', 'N', '04:00:00', '06:00:00', '02:00:00', '12:00:00', '12:59:00', '12:00:00', '16:00:00', '18:00:00', '14:00:00', '12:00:00', '12:59:00', '12:00:00');
INSERT INTO `tblAttendanceScheme_Online_DTR` (`schemeCode`, `schemeName`, `schemeType`, `amTimeinFrom`, `amTimeinTo`, `overtimeStarts`, `overtimeEnds`, `gracePeriod`, `gpLeaveCredits`, `gpLate`, `wrkhrLeave`, `hlfLateUnd`, `fixMonday`, `allow30`, `strict`, `pmTimeoutFrom_old_data`, `pmTimeoutTo_old_data`, `nnTimeinTo_old_data`, `nnTimeoutFrom_old_data`, `nnTimeoutTo_old_data`, `nnTimeinFrom_old_data`, `pmTimeoutFrom`, `pmTimeoutTo`, `nnTimeinTo`, `nnTimeoutFrom`, `nnTimeoutTo`, `nnTimeinFrom`) VALUES ('test', 'test', 'Sliding', '07:00:00', '12:00:00', '00:00:00', '00:00:00', '0', 'Y', 'N', '0', 'N', 'Y', 'N', 'N', '12:00:00', '04:00:00', '12:00:00', '12:00:00', '12:00:00', '12:00:00', '12:00:00', '16:00:00', '12:00:00', '12:00:00', '12:00:00', '12:00:00');


#
# TABLE STRUCTURE FOR: tblBackUpScheduler
#

DROP TABLE IF EXISTS `tblBackUpScheduler`;

CREATE TABLE `tblBackUpScheduler` (
  `id` int(10) NOT NULL DEFAULT 0,
  `scriptpath` varchar(100) NOT NULL DEFAULT '',
  `time_interval` int(10) DEFAULT NULL,
  `fire_time` int(10) NOT NULL DEFAULT 0,
  `time_last_fired` int(10) DEFAULT NULL,
  `name` varchar(50) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblBackup
#

DROP TABLE IF EXISTS `tblBackup`;

CREATE TABLE `tblBackup` (
  `id` int(11) NOT NULL DEFAULT 0,
  `db_backup_name` varchar(100) NOT NULL DEFAULT '',
  `time_last_run` int(11) NOT NULL DEFAULT 0,
  `next_run_time` int(11) NOT NULL DEFAULT 0,
  `status` varchar(10) NOT NULL DEFAULT '',
  `xversion` varchar(6) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblBackupConfig
#

DROP TABLE IF EXISTS `tblBackupConfig`;

CREATE TABLE `tblBackupConfig` (
  `id` int(10) NOT NULL DEFAULT 0,
  `time_interval` int(10) DEFAULT NULL,
  `fire_time` int(11) NOT NULL DEFAULT 0,
  `time_last_fired` int(11) NOT NULL DEFAULT 0,
  `email` varchar(50) NOT NULL DEFAULT '',
  `ftpadd` varchar(50) NOT NULL DEFAULT '',
  `ftpuname` varchar(20) NOT NULL DEFAULT '',
  `ftppass` varchar(20) NOT NULL DEFAULT '',
  `xtable` text NOT NULL,
  `xstatus` varchar(50) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblBrokenSched
#

DROP TABLE IF EXISTS `tblBrokenSched`;

CREATE TABLE `tblBrokenSched` (
  `rec_ID` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `empNumber` varchar(20) NOT NULL DEFAULT '',
  `schemeCode` varchar(5) NOT NULL DEFAULT '',
  `dateFrom` date NOT NULL DEFAULT '0000-00-00',
  `dateTo` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`rec_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblChangeLog
#

DROP TABLE IF EXISTS `tblChangeLog`;

CREATE TABLE `tblChangeLog` (
  `changeLogId` int(10) NOT NULL AUTO_INCREMENT,
  `empNumber` varchar(30) NOT NULL DEFAULT '',
  `module` varchar(20) NOT NULL DEFAULT '',
  `tablename` varchar(30) NOT NULL DEFAULT '',
  `databaseevent` varchar(15) NOT NULL DEFAULT '',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` longtext NOT NULL,
  `data` longtext NOT NULL,
  `data2` longtext NOT NULL,
  `ip` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`changeLogId`)
) ENGINE=MyISAM AUTO_INCREMENT=503 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('1', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-13 14:34:04', 'Added 123-1 Personal Information', '123-1;;Badoy;Phoebe Cates;;;;;;;Female;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('2', '1111', 'HR Module', 'tblempaccount', '', '2021-07-13 14:35:27', 'Added phoebe_hr User_account', '123-1;phoebe_hr;21232f297a57a5a743894a0e4a801fc3;1;0;;hr;123456', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('3', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-13 14:36:06', 'Added 123-2 Personal Information', '123-2;;Miravalles;Rhonelyn;;;;;;;Female;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('4', '1111', 'HR Module', 'tblempaccount', '', '2021-07-13 14:36:30', 'Added rhonelyn_hr User_account', '123-2;rhonelyn_hr;21232f297a57a5a743894a0e4a801fc3;1;0;;hr;123456', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('5', '1111', 'HR Module', 'tblempaccount', '', '2021-07-13 14:37:01', 'Update Password  User_account', '21232f297a57a5a743894a0e4a801fc3', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('6', '1111', 'HR Module', 'tblempaccount', '', '2021-07-13 14:38:08', 'Added phoeberobles User_account', '123-1;phoeberobles;21232f297a57a5a743894a0e4a801fc3;1;1;;hr;123456', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('7', '1111', 'HR Module', 'tblempaccount', '', '2021-07-13 14:39:51', 'Added pbadoy User_account', '123-1;pbadoy;81dc9bdb52d04dc20036dbd8313ed055;1;0;;hr;123456', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('8', '1111', 'HR Module', 'tblempaccount', '', '2021-07-13 14:41:03', 'Edited hrmis User_account', '1111;hrmis;1;0;;hr;123456', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('9', '1111', 'HR Module', 'tblempaccount', '', '2021-07-13 14:41:17', 'Added probles User_account', '123-1;probles;81dc9bdb52d04dc20036dbd8313ed055;5;0;;employee;', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('10', '1111', 'HR Module', 'tblagency', '', '2021-07-13 14:46:47', 'Edited Department of Environment and Natural Resources - Region VI Agency_profile', 'Department of Environment and Natural Resources - Region VI;DENR;Western Visayas;044-000-553-203;Pepita Aquino Avenue, Iloilo City;5000;8372071-82;8372937;  ;r6.denr.gov.ph;Bi-Monthly;;;;;;0;;9;12;;100;100;2;5;50;50;0.00;140039100007;To mobilize our citizenry in protecting, conserving, and managing the environment and natural resources for the present and future generations.;A nation enjoying and sustaining its natural resources and a clean and healthy environment.;The Department is the primary agency responsible for the conservation, management, development, and proper use of the country’s environment and natural resources, specifically forest and grazing lands, mineral resources, including those in reservation and watershed areas, and lands of the public domain, as well as the licensing and regulation of all natural resources as may be provided for by law in order to ensure equitable sharing of the benefits derived therefrom for the welfare of the present and future generations of Filipinos.  To accomplish this mandate, the Department shall be guided by the following objectives:  1. Assure the availability and sustainability of the country\'s natural resources through judicious use and systematic restoration or replacement, whenever possible;    2.  Increase the productivity of natural resources in order to meet the demands for forest, mineral, and land resources if a growing population;    3.  Enhance the contribution of natural resources for achieving national economic and social development;    4.  Promote equitable access to natural resources by the different sectors of the population; and    5.  Conserve specific terrestrial and marine areas representative of the Philippine natural and cultural heritage for present and future generations.;', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('11', '1111', 'HR Module', 'tblagency', '', '2021-07-13 14:48:32', 'Edited Department of Environment and Natural Resources - Region VI Agency_profile', 'Department of Environment and Natural Resources - Region VI;DENR;Western Visayas;044-000-553-203;Pepita Aquino Ave., Iloilo City;5000;8372071-82;8372937;  ;r6.denr.gov.ph;Bi-Monthly;;;;;;0;;9;12;;100;100;2;5;50;50;0.00;140039100007;To mobilize our citizenry in protecting, conserving, and managing the environment and natural resources for the present and future generations.;A nation enjoying and sustaining its natural resources and a clean and healthy environment.;The Department is the primary agency responsible for the conservation, management, development, and proper use of the country’s environment and natural resources, specifically forest and grazing lands, mineral resources, including those in reservation and watershed areas, and lands of the public domain, as well as the licensing and regulation of all natural resources as may be provided for by law in order to ensure equitable sharing of the benefits derived therefrom for the welfare of the present and future generations of Filipinos.  To accomplish this mandate, the Department shall be guided by the following objectives:  1. Assure the availability and sustainability of the country\'s natural resources through judicious use and systematic restoration or replacement, whenever possible;    2.  Increase the productivity of natural resources in order to meet the demands for forest, mineral, and land resources if a growing population;    3.  Enhance the contribution of natural resources for achieving national economic and social development;    4.  Promote equitable access to natural resources by the different sectors of the population; and    5.  Conserve specific terrestrial and marine areas representative of the Philippine natural and cultural heritage for present and future generations.;     ', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('12', '1111', 'HR Module', 'tblagency', '', '2021-07-13 14:48:53', 'Edited MUNICIPAL GOVERNMENT OF PAETE | MISO Version 1.0 12 Agency_profile', 'MUNICIPAL GOVERNMENT OF PAETE | MISO Version 1.0 12;DOST;NCR;044-000-553-203;General Santos Ave., Bicutan, Taguig City;1631;8372071-82;8372937;  ;www.dost.gov.ph;Bi-Monthly;;;;;;0;;9;12;;100;100;2;5;50;50;0.00;140039100007;To direct, lead, and coordinate scientific and technological efforts in the country and ensure that these result to the maximum economic and social benefits for the Filipino people.;A prosperous Filipino nation whose socio-economic well-being is assured through competent and responsible use of scientific knowledge and technological innovations.;;     ', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('13', '1111', 'HR Module', 'tblagency', '', '2021-07-13 14:49:50', 'Edited MUNICIPAL GOVERNMENT OF PAETE | MISO Version 1.0 1 Agency_profile', 'MUNICIPAL GOVERNMENT OF PAETE | MISO Version 1.0 1;DOST;NCR;044-000-553-203;General Santos Ave., Bicutan, Taguig City;1631;8372071-82;8372937;  ;www.dost.gov.ph;Bi-Monthly;;;;;;0;;9;12;;100;100;2;5;50;50;0.00;140039100007;To direct, lead, and coordinate scientific and technological efforts in the country and ensure that these result to the maximum economic and social benefits for the Filipino people.;A prosperous Filipino nation whose socio-economic well-being is assured through competent and responsible use of scientific knowledge and technological innovations.;;     ', '', '122.54.50.11');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('14', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-13 14:51:05', 'Edited Miravalles Personal', 'Ms;Miravalles;Rhonelyn;Judicpa;J;;Filipino;04-22-1973;Bacolod City;F;Single;;50.00;0.00;932-443-805;;A+;bull_rhone@yahoo.com;060137838002;11-000026118-1;;;Hedriana;Hedriana;;;Anilao;Anilao;Pavia;Pavia;Iloilo;Iloilo;5001;5001;09071537904;;09363147605;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('15', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-13 14:52:31', 'Edited Miravalles Personal', 'Ms;Miravalles;Rhonelyn;Judicpa;J;;Filipino;0000-00-00;Bacolod City;F;Single;2001451909;50.00;0.00;932-443-805;;A+;bull_rhone@yahoo.com;060137838002;11-000026118-1;;;Hedriana;Hedriana;;;Anilao;Anilao;Pavia;Pavia;Iloilo;Iloilo;5001;5001;09071537904;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('16', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-13 14:54:31', 'Edited Miravalles Personal', 'Ms;Miravalles;Rhonelyn;Judicpa;J;;Filipino;0000-00-00;Bacolod City;F;Single;;50.00;0.00;932-443-805;;A+;bull_rhone@yahoo.com;060137838002;11-000026118-1;;;Hedriana;Hedriana;;;Anilao;Anilao;Pavia;Pavia;Iloilo;Iloilo;5001;5001;09071537904;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('17', '1111', 'HR Module', 'tblempaccount', '', '2021-07-14 10:30:24', 'Added phoebe User_account', '123-1;phoebe;21232f297a57a5a743894a0e4a801fc3;2;0;;finance;01234', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('18', '1111', 'HR Module', 'tblempaccount', '', '2021-07-14 10:40:57', 'Added rjmiravalles User_account', '123-2;rjmiravalles;7ebe635f8b9dfc5760d15f97e3af130c;1;0;;hr;123456', '', '202.90.141.34');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('19', '1111', 'HR Module', 'tblAppointment', '', '2021-07-14 10:42:54', 'Edited Casual Appointment status', ';Cas;Casual;Y;0', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('20', '1111', 'HR Module', 'tblempaccount', '', '2021-07-14 10:43:05', 'Added rjmiravalles User_account', '123-2;rjmiravalles;7ebe635f8b9dfc5760d15f97e3af130c;5;0;;employee;', '', '202.90.141.34');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('21', '1111', 'HR Module', 'tblempaccount', '', '2021-07-14 10:54:28', 'Added pbadoy User_account', '123-1;pbadoy;827ccb0eea8a706c4c34a16891f84e7b;5;0;;employee;', '', '202.90.141.34');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('22', '1111', 'HR Module', 'tblempaccount', '', '2021-07-14 10:59:16', 'Added pbadoy User_account', '123-1;pbadoy;4646912a90a13893fc9576a8444e6760;5;0;;employee;', '', '202.90.141.34');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('23', '1111', 'HR Module', 'tblempaccount', '', '2021-07-14 10:59:23', 'Deleted pbadoy User_account', '123-1;pbadoy;4646912a90a13893fc9576a8444e6760;5;employee;;;;;0', '', '202.90.141.34');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('24', '1111', 'HR Module', 'tblempaccount', '', '2021-07-14 11:03:09', 'Added pbadoy User_account', '123-1;pbadoy;4646912a90a13893fc9576a8444e6760;5;0;;employee;', '', '202.90.141.34');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('25', '1111', 'HR Module', 'tblempaccount', '', '2021-07-14 11:03:46', 'Deleted pbadoy User_account', '123-1;pbadoy;4646912a90a13893fc9576a8444e6760;5;employee;;;;;0', '', '202.90.141.34');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('26', '1111', 'HR Module', 'tblempaccount', '', '2021-07-14 11:04:27', 'Added rjmiravalles User_account', '123-2;rjmiravalles;7ebe635f8b9dfc5760d15f97e3af130c;5;0;;employee;', '', '202.90.141.34');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('27', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-14 11:20:36', 'Edited Miravalles Personal', 'Ms;Miravalles;Rhonelyn;Judicpa;J;;Filipino;0000-00-00;Bacolod City;F;Single;;50.00;0.00;932-443-805;;A+;bull_rhone@yahoo.com;060137838002;11-000026118-1;;;Hedriana;Hedriana;;;Anilao;Anilao;Pavia;Pavia;Iloilo;Iloilo;5001;5001;09071537904;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('28', '1111', 'HR Module', 'tblempaccount', '', '2021-07-14 11:39:01', 'Added phoeber User_account', '123-1;phoeber;21232f297a57a5a743894a0e4a801fc3;3;0;;officer;', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('29', '1111', 'HR Module', 'tblagency', '', '2021-07-14 11:39:36', 'Edited Department of Environment and Natural Resources - Region VI Agency_profile', 'Department of Environment and Natural Resources - Region VI;DENR;Western Visayas;044-000-553-203;General Santos Ave., Bicutan, Taguig City;1631;8372071-82;8372937;  ;www.dost.gov.ph;Bi-Monthly;;;;;;0;;9;12;;100;100;2;5;50;50;0.00;140039100007;To direct, lead, and coordinate scientific and technological efforts in the country and ensure that these result to the maximum economic and social benefits for the Filipino people.;A prosperous Filipino nation whose socio-economic well-being is assured through competent and responsible use of scientific knowledge and technological innovations.;;     ', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('30', '1111', 'HR Module', 'tblempaccount', '', '2021-07-14 12:31:06', 'Edited rjmiravalles User_account', '123-2;rjmiravalles;2;0;;finance;01234', '', '202.90.141.34');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('31', '1111', 'HR Module', 'tblagency', '', '2021-07-14 13:53:56', 'Edited Department of Environment and Natural Resources  - Region VI Agency_profile', 'Department of Environment and Natural Resources  - Region VI;DOST;NCR;044-000-553-203;General Santos Ave., Bicutan, Taguig City;1631;8372071-82;8372937;  ;www.dost.gov.ph;Bi-Monthly;;;;;;0;;9;12;;100;100;2;5;50;50;0.00;140039100007;To direct, lead, and coordinate scientific and technological efforts in the country and ensure that these result to the maximum economic and social benefits for the Filipino people.;A prosperous Filipino nation whose socio-economic well-being is assured through competent and responsible use of scientific knowledge and technological innovations.;;     ', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('32', '1111', 'HR Module', 'tblagency', '', '2021-07-15 10:39:51', 'Edited MUNICIPAL GOVERNMENT OF PAETE | MISO Version 1.0 1! Agency_profile', 'MUNICIPAL GOVERNMENT OF PAETE | MISO Version 1.0 1!;DOST;NCR;044-000-553-203;General Santos Ave., Bicutan, Taguig City;1631;8372071-82;8372937;  ;www.dost.gov.ph;Bi-Monthly;;;;;;0;;9;12;;100;100;2;5;50;50;0.00;140039100007;To direct, lead, and coordinate scientific and technological efforts in the country and ensure that these result to the maximum economic and social benefits for the Filipino people.;A prosperous Filipino nation whose socio-economic well-being is assured through competent and responsible use of scientific knowledge and technological innovations.;;     ', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('33', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-15 14:59:09', 'Added INFOSA2-98-2014 Personal Information', 'INFOSA2-98-2014;;Logronio;Kim;Balome;B;;Filipino;1992-03-12;Alimodian, Iloilo;Female;Single;;92;1.52;;;A;;;;;;;;;;;Sta. Clara;;Oton;;Iloilo;;5020;;;+639453324140;3307045752', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('34', '1111', 'HR Module', 'tblempaccount', '', '2021-07-15 15:33:45', 'Added kblogronio User_account', 'INFOSA2-98-2014;kblogronio;21232f297a57a5a743894a0e4a801fc3;2;0;;finance;01234', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('35', '1111', 'HR Module', 'tblEmpRequest', '', '2021-07-21 12:03:46', 'Added Oton Travel Order', 'Oton;2021-07-22;2021-07-28;Wblaals;Y;2021-07-21;Filed Request;TO;1111;[]', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('36', '1111', 'HR Module', 'tblEmpRequest', '', '2021-07-21 13:05:05', 'Added asdasd Travel Order', 'asdasd;2021-07-29;2021-08-04;asdasdasdas;Y;2021-07-21;Filed Request;TO;1111;[]', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('37', '1111', 'HR Module', 'tblempaccount', '', '2021-07-21 13:27:08', 'Edited kblogronio User_account', 'INFOSA2-98-2014;kblogronio;1;0;;hr;123456', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('38', 'INFOSA2-98-2014', 'HR Module', 'tblEmpRequest', '', '2021-07-21 13:28:29', 'Added CENRO Sara Travel Order', 'CENRO Sara;2021-07-28;2021-07-30;To check computers.;;2021-07-21;Filed Request;TO;INFOSA2-98-2014;[]', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('39', 'INFOSA2-98-2014', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 13:32:40', 'Added 12134 Personal Information', '12134;Mr.;Duran;Livino;;;;Filipino;;;Male;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('40', 'INFOSA2-98-2014', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 13:33:27', 'Added 1232 Personal Information', '1232;Atty.;Empleo;Noel;;;;Filipino;;;Male;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('41', 'INFOSA2-98-2014', 'HR Module', 'tblgroup1', '', '2021-07-21 13:34:30', 'Added ORD Org_structure', 'ORD;Office of the Regional Director;12134;Regional Director;', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('42', 'INFOSA2-98-2014', 'HR Module', 'tblgroup2', '', '2021-07-21 13:35:22', 'Added MSD Org_structure', 'ORD;MSD;Management Services Division;1232;Assistant Regional Director;123-1', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('43', 'INFOSA2-98-2014', 'HR Module', 'tblgroup1', '', '2021-07-21 13:35:29', 'Edited ORD Org_structure', 'ORD;Office of the Regional Director;12134;Regional Director;123-2', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('44', 'INFOSA2-98-2014', 'HR Module', 'tblEmpRequest', '', '2021-07-21 13:36:33', 'Added Oton Iloilo Travel Order', 'Oton Iloilo;2021-07-27;2021-07-29;To check and repair computers;Y;2021-07-21;Filed Request;TO;INFOSA2-98-2014;[]', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('45', 'INFOSA2-98-2014', 'HR Module', 'tblgroup2', '', '2021-07-21 14:05:48', 'Deleted  Org_structure', '', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('46', '1111', 'HR Module', 'tblagency', '', '2021-07-21 14:40:32', 'Edited Department of Environment and Natural Resources Agency_profile', 'Department of Environment and Natural Resources;DENR;REGION 6;000-535-643-036;Pepita Aquino Street Port Area, Iloilo City;5000;8372071-82;8372937;  ;www.dost.gov.ph;Bi-Monthly;;;;;;0;;9;12;;100;100;2;5;50;50;0.00;140039100007;To direct, lead, and coordinate scientific and technological efforts in the country and ensure that these result to the maximum economic and social benefits for the Filipino people.;A prosperous Filipino nation whose socio-economic well-being is assured through competent and responsible use of scientific knowledge and technological innovations.;;     ', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('47', '1111', 'HR Module', 'tblagency', '', '2021-07-21 14:48:36', 'Edited Department of Environment and Natural Resources Agency_profile', 'Department of Environment and Natural Resources;DENR;Region 6;000-535-643-036;Pepita Aquino Street Port Area, Iloilo City;5000;(033) 329-4724;0000;  r6@denr.gov.ph;www.denr.gov.ph;Bi-Monthly;;;;;;0;;;;;;;;;;;0.0;;To mobilize our citizenry in protecting, conserving, and managing the environment and natural resources for the present and future generations.;A nation enjoying and sustaining its natural resources and a clean and healthy environment.;The Department is the primary agency responsible for the conservation, management, development, and proper use of the country’s environment and natural resources, specifically forest and grazing lands, mineral resources, including those in reservation and watershed areas, and lands of the public domain, as well as the licensing and regulation of all natural resources as may be provided for by law in order to ensure equitable sharing of the benefits derived therefrom for the welfare of the present and future generations of Filipinos.;     ', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('48', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 14:56:15', 'Edited Duran Personal', 'Mr.;Duran;Livino;Bandiola;B.;;Filipino;16-26-59;;M;Married;;0.00;0.00;;;;;;;;;;;;;;;;;;;0;0;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('49', '1111', 'HR Module', 'tblgroup1', '', '2021-07-21 14:58:53', 'Added ARDMS Org_structure', 'ARDMS;Office of the Assistant Regional Director for Management Services;1232;ATTY.;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('50', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 14:59:48', 'Edited Empleo Personal', 'Atty.;Empleo;Noel;Cordero;C.;;Filipino;0000-00-00;;M;Married;;0.00;0.00;;;;;;;;;;;;;;;;;;;0;0;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('51', '1111', 'HR Module', 'tblgroup1', '', '2021-07-21 15:00:44', 'Edited ORD Org_structure', 'ORD;Office of the Regional Executive Director;12134;Regional Executive Director;123-2', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('52', '1111', 'HR Module', 'tblgroup1', '', '2021-07-21 15:01:28', 'Edited ARDMS Org_structure', 'ARDMS;Office of the Assistant Regional Director for Management Services;1232;ARD for Management Services;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('53', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 15:04:55', 'Added PENRO-33-1998 Personal Information', 'PENRO-33-1998;Mr.;Lorilla;Raul ;Ligas;L.;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('54', '1111', 'HR Module', 'tblgroup1', '', '2021-07-21 15:06:07', 'Added ARDTS Org_structure', 'ARDTS;Office of the Assistant Regional Director for Technical Services;PENRO-33-1998;ARD for Technical Services;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('55', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 15:24:26', 'Edited Badoy Personal', 'Ms.;Badoy;Phoebe C;Robles;R.;;Filipino;1990-09-01;Cuartero, Capiz;F;Married;BP NO. 2004839015;0.00;0.00;441-777-577;07-2696935-7;O;phoeberish@gmail.com;1210-3002-8198;11-050555726-3;Blk. 32 Lot 61;Blk. 32 Lot 61;;;DHPRR Village 1;DHPRR Village 1;Pandac;Pandac;Pavia;Pavia;Iloilo;Iloilo;5001;5001;;;09278674515;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('56', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 15:25:56', 'Edited Badoy Personal', 'Badoy;Donald ;Ungsod;;Governent Employee;Office of the Ombudsman;2F CAP Building, General Luna St., Iloilo City ;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('57', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 15:26:40', 'Edited Badoy Personal', 'Ms.;Badoy;Phoebe;Robles;R.;;Filipino;1990-09-01;Cuartero, Capiz;F;Married;BP NO. 2004839015;0.00;0.00;441-777-577;07-2696935-7;O;phoeberish@gmail.com;1210-3002-8198;11-050555726-3;Blk. 32 Lo;Blk. 32 Lo;;;DHPRR Village 1;DHPRR Village 1;Pandac;Pandac;Pavia;Pavia;Iloilo;Iloilo;5001;5001;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('58', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 15:36:55', 'Edited Miravalles Personal', 'Ms.;Miravalles;Rhonelyn;Judicpa;J.;;Filipino;0000-00-00;Bacolod City;F;Single;BP. NO. 2001451909;50.00;0.00;932-443-805;;A+;bull_rhone@yahoo.com;060137838002;11-000026118-1;;;Hedriana;Hedriana;;;Anilao;Anilao;Pavia;Pavia;Iloilo;Iloilo;5001;5001;09071537904;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('59', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 16:20:25', 'Added POS5-5-2014 Personal Information', 'POS5-5-2014;Mr. ;Piñosa;Dennis;Sipole;S. ;;Filipino;1965-06-21;;Male;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('60', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 16:21:58', 'Added POS4-5-2014 Personal Information', 'POS4-5-2014;Mr. ;Abordo;Rene;Grande;G.;;Filipino;1967-08-07;;Male;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('61', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 16:23:41', 'Added ADAS3-85-2004 Personal Information', 'ADAS3-85-2004;Ms.;Collado;Beverly;Armada;A.;;Filipino;1964-01-25;;Female;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('62', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 16:25:37', 'Added ADA6-752-2014 Personal Information', 'ADA6-752-2014;Mr.;Sombrador;Leejil;Denolan;D.;;Filipino;1982-08-04;;Male;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('63', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 16:26:57', 'Added SRCDO-19-2014 Personal Information', 'SRCDO-19-2014;Mr. ;Colacion;Artemio Salvador;Catedrilla;C.;;Filipino;1963-09-21;;Male;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('64', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 16:28:41', 'Added COMDO2-17-2014 Personal Information', 'COMDO2-17-2014;Ms. ;Reyes;Jessie;Lucencio;L.;;Filipino;1973-12-05;;Female;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('65', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 16:29:55', 'Added INFO2-21-2014 Personal Information', 'INFO2-21-2014;Ms. ;Ruefa;Maria Christina;Cuñada;C.;;Filipino;1976-12-17;;Female;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('66', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 16:31:06', 'Added COMDO1-20-2014 Personal Information', 'COMDO1-20-2014;Ms. ;Sallave;Roanne Joy;Briones;B.;;Filipino;1979-09-23;;Female;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('67', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 16:32:44', 'Added INFO1-24-2014 Personal Information', 'INFO1-24-2014;Ms. ;Arceta;Jovette Aimee;Barcelona;B.;;Filipino;1992-07-10;;Female;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('68', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 16:33:58', 'Added ADAS2-242-2004 Personal Information', 'ADAS2-242-2004;Ms. ;Tribunal;Fanny;Fruto;F.;;Filipino;1978-09-29;;Female;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('69', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 16:35:18', 'Added PLO5-2-1998 Personal Information', 'PLO5-2-1998;Ms. ;Locsin;Edna;Baleña;B.;;Filipino;1958-12-02;;Female;Single;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('70', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 16:37:13', 'Added PLO4-23-2014 Personal Information', 'PLO4-23-2014;Ms. ;Regino;Evangeline;Jardinico;J.;;Filipino;1969-12-16;;Female;Single;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('71', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 16:38:23', 'Added ADAS1-171-2014 Personal Information', 'ADAS1-171-2014;Ms. ;Villanueva;Lilian;Alfaras;A.;;Filipino;1967-05-21;;Female;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('72', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 16:40:21', 'Added PLO3-13-1998 Personal Information', 'PLO3-13-1998;Ms. ;Caspillo;Marivic;Jalbuena;J.;;Filipino;1975-01-23;;Female;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('73', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 16:41:50', 'Added ADOF4-156-2004 Personal Information', 'ADOF4-156-2004;Mr.;Gregorio;Vivencio;Aguirre;A.;;Filipino;1974-09-26;;Male;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('74', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 16:42:58', 'Added PEO3-28-2014 Personal Information', 'PEO3-28-2014;Ms.;Galilea;Leah;Gedor;G.;;Filipino;1973-04-18;;Female;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('75', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 16:44:25', 'Added PEO2-19-1998 Personal Information', 'PEO2-19-1998;Ms. ;Calicaran;Debbie Mae;Solinap;S.;;Filipino;1966-03-24;;Female;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('76', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 16:48:22', 'Added PEO1-27-2014 Personal Information', 'PEO1-27-2014;Ms.;Erael;April;Cabigao;C.;;Filipino;1992-04-19;;Female;Single;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('77', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 16:49:52', 'Added STAT2-5-1998 Personal Information', 'STAT2-5-1998;Ms.;Libo-on;Nona;Apitong;A.;;Filipino;1966-02-19;;Female;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('78', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 16:51:32', 'Added STAT2-6-1998 Personal Information', 'STAT2-6-1998;Ms.;Tibobos;Nolyn;Gencianeo;G.;;Filipino;1988-07-14;;Female;Single;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('79', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 16:52:49', 'Added STAT1-30-2014 Personal Information', 'STAT1-30-2014;Ms. ;Jamorin;Asuncion;Maderal;M.;;Filipino;1965-08-15;;Female;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('80', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 16:53:45', 'Added INFOSA3-30-2014 Personal Information', 'INFOSA3-30-2014;Mr.;Valla;Jade;Jaula;J.;;Filipino;1977-02-16;;Male;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('81', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 16:55:01', 'Added INFOSA2-94-2014 Personal Information', 'INFOSA2-94-2014;Mr. ;Demetita;Israel;Gedaya;G.;;Filipino;1983-06-19;;Male;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('82', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 16:56:12', 'Added ADAS3-97-2014 Personal Information', 'ADAS3-97-2014;Ms. ;Anatan;Jennifer;Jamorin;J.;;Filipino;1978-08-26;;Female;Single;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('83', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 16:58:26', 'Added ECOMS2-151-2014 Personal Information', 'ECOMS2-151-2014;Ms. ;Peñafiel;Femme;Pedrajas;P.;;Filipino;1978-12-03;;Female;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('84', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 18:21:50', 'Added SADOF-48-2014 Personal Information', 'SADOF-48-2014;Ms. ;Sardia;Amellee;Rosario;R.;;Filipino;1978-11-12;;Female;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('85', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 18:22:48', 'Added ADAS1-172-2014 Personal Information', 'ADAS1-172-2014;Ms.;Sombilon;Ana Marie;Contreras;C.;;Filipino;1966-05-14;;Female;Single;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('86', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 18:24:03', 'Added ADOF5-84-2004 Personal Information', 'ADOF5-84-2004;Ms. ;Carmen;Dorotea;Villacastin;V.;;Filipino;1957-02-06;;Female;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('87', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 18:25:15', 'Added ADOF4-157-2004 Personal Information', 'ADOF4-157-2004;Ms.;Tayo;Lilian;Pagara;P.;;Filipino;1973-09-06;;Female;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('88', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 18:26:07', 'Added ADOF4-91-2014 Personal Information', 'ADOF4-91-2014;Ms. ;Catalan;Lea;Causing;C.;;Filipino;1961-09-06;;Female;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('89', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 18:27:00', 'Added ADOF2-123-2004 Personal Information', 'ADOF2-123-2004;Ms.;Colomer;Analiza;Jinon;J.;;Filipino;1973-05-26;;Female;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('90', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 18:28:13', 'Added A3-8-1998 Personal Information', 'A3-8-1998;Ms.;Abrico;Myleine Ann ;Eslabon;E.;;Filipino;1962-03-16;;Female;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('91', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 18:29:11', 'Added A2-46-1998 Personal Information', 'A2-46-1998;Ms.;Villalobos;Lynnette;Simpas;S.;;Filipino;1966-06-04;;Female;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('92', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 18:30:08', 'Added A1-31-1998 Personal Information', 'A1-31-1998;Ms.;Flores;Diana Lex;Caro;C.;;Filipino;1996-01-30;;Female;Single;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('93', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 18:31:06', 'Added AA-38-2014 Personal Information', 'AA-38-2014;Ms. ;Nieves;Analisa;Jayona;J.;;Filipino;1969-09-28;;Female;Single;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('94', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 18:32:15', 'Added ADAS3-87-2004 Personal Information', 'ADAS3-87-2004;Ms.;Delima;Emma;Panaguiton;P.;;Filipino;1959-09-17;;Female;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('95', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 18:33:17', 'Added ADAS2-235-2004 Personal Information', 'ADAS2-235-2004;Ms.;Guion;Preciosa;Sequito;S.;;Filipino;1963-06-27;;Male;Widowed;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('96', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-21 18:34:22', 'Added CADOF-31-2004 Personal Information', 'CADOF-31-2004;Mr.;Federiso;Ernest;Checa;C.;;Filipino;1967-10-12;;Male;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('97', '1111', 'HR Module', 'tblposition', '', '2021-07-21 18:53:49', 'Added  Park Operation Superintendent V  Position', 'OSEC-DENRB-POS5-5-2014; Park Operation Superintendent V ;OSEC-DENRB-POS5-5-2014', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('98', '1111', 'HR Module', 'tblposition', '', '2021-07-21 18:54:03', 'Edited  Park Operation Superintendent V  Position', 'OSEC-DENRB-POS5-5-20; Park Operation Superintendent V ;OSEC-DENRB-POS5-5-2014', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('99', '1111', 'HR Module', 'tblCourse', '', '2021-07-21 18:56:26', 'Added Course', 'BSFAgro;Bachelor of Science in Forestry Major in Agroforestry', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('100', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 08:20:48', 'Added SADOF-49-2014 Personal Information', 'SADOF-49-2014;Ms.;Reyno;Myla;Celda;C.;;Filipino;1970-10-27;;Female;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('101', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 08:21:57', 'Added ADAS1-173-2014 Personal Information', 'ADAS1-173-2014;Ms.;Cablas ;Ruby;Ganancial;G.;;Filipino;1961-09-12;;Female;Widowed;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('102', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 08:22:56', 'Added ADOF5-85-2004 Personal Information', 'ADOF5-85-2004;Ms. ;Alcon;Dorothy;Castro;C.;;Filipino;1960-09-19;;Female;Single;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('103', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 08:25:01', 'Added ADOF2-128-2004 Personal Information', 'ADOF2-128-2004;Ms.;Sombrador;Sharon;Jalandoni;J.;;Filipino;1978-08-15;;Female;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('104', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 08:26:37', 'Added ADOF2-61-2014 Personal Information', 'ADOF2-61-2014;Ms.;Drilon;Gloria;Antiqeuña;A.;;Filipino;1966-07-23;;Female;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('105', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 08:27:57', 'Added ADAS3-98-2014 Personal Information', 'ADAS3-98-2014;Ms.;Alonzo;Nannette;Brillantes;B.;;Filipino;1959-12-07;;Female;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('106', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 08:29:21', 'Added ADOF5-69-2014 Personal Information', 'ADOF5-69-2014;Ms.;Botavara;Ma. Pacita;Vizcarra;V.;;Filipino;1966-01-24;;Female;Single;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('107', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 08:30:09', 'Added ADOF4-92-2014 Personal Information', 'ADOF4-92-2014;Ms.;Estiaga;Scarlet;Acedera;A.;;Filipino;1977-04-01;;Female;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('108', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 08:31:06', 'Added ADOF2-125-2004 Personal Information', 'ADOF2-125-2004;Ms. ;Mooc;Dianne Marie;Paguntalan;P.;;Filipino;1992-06-12;;Female;Single;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('109', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 08:32:19', 'Added ADOF2-127-2004 Personal Information', 'ADOF2-127-2004;Ms. ;Enicola;Rhoda April Rosalind;Ga;G.;;Filipino;1973-04-08;;Female;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('110', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 08:33:35', 'Added ADAS3-99-2014 Personal Information', 'ADAS3-99-2014;Ms.;Monroy;Rhoda;Gofolco;G.;;Filipino;1958-12-19;;Female;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('111', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 08:34:29', 'Added ADAS2-241-2004 Personal Information', 'ADAS2-241-2004;Ms.;Amador;Thea Faith;Alentaje;A.;;Filipino;1991-02-09;;Female;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('112', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 08:35:30', 'Added ADOF5-70-2014 Personal Information', 'ADOF5-70-2014;Ms.;Rico;Carolyn;Lanabe;L.;;Filipino;1961-04-30;;Female;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('113', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 08:37:11', 'Added ADOF3-58-2004 Personal Information', 'ADOF3-58-2004;Ms. ;Sumergido;Maria Elsie;Manua;M. ;;Filipino;1967-10-14;;Female;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('114', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 08:38:21', 'Added ADOF1-235-2004 Personal Information', 'ADOF1-235-2004;Ms. ;Huele;Christine Joy;Socias;S.;;Filipino;1990-06-21;;Female;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('115', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 08:39:11', 'Added ADAS2-236-2004 Personal Information', 'ADAS2-236-2004;Ms.;Nonan;Fe;Titular;T.;;Filipino;1959-05-21;;Female;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('116', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 08:41:14', 'Added ADAS1-174-2014 Personal Information', 'ADAS1-174-2014;Ms.;Portillo;Remia;Saldo;S.;;;1964-08-21;;;;;;;157-142-021;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('117', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 08:42:15', 'Added ADOF5-87-2004 Personal Information', 'ADOF5-87-2004;Mr.;Lagunilla;Joel;Bautista;B.;;Filipino;1964-04-17;;Male;Single;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('118', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 08:43:25', 'Added ADOF4-159-2004 Personal Information', 'ADOF4-159-2004;Ms.;Lozano;Cecile;Malate;M.;;Filipino;1963-08-29;;Female;Married;;;;145-630-931;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('119', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 08:44:23', 'Added ADAS2-238-2004 Personal Information', 'ADAS2-238-2004;Ms.;Cadornigara;Aleta;Maloto;M.;;Filipino;1957-06-21;;Female;Single;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('120', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 08:45:35', 'Added ADAS1-68-2004 Personal Information', 'ADAS1-68-2004;Ms.;Mellizas;Loida;Lorque;L.;;Filipino;1959-02-21;;Female;Married;;;;138-116-099;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('121', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 08:47:02', 'Added ADOF3-57-2004 Personal Information', 'ADOF3-57-2004;Ms.;Lorque;Cirila;Cabulos;C. ;;Filipino;1963-10-28;;Female;Married;;;;127-763-126;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('122', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 08:52:11', 'Added ADAS1-69-2004 Personal Information', 'ADAS1-69-2004;Ms. ;Peñafiel;Pinky;Cordero;C.;;Filipino;1978-10-07;;Female;Married;;;;924-048-333;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('123', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 08:54:45', 'Added ADOF5-71-2014 Personal Information', 'ADOF5-71-2014;Ms.;Sobrejuanite;Luz;Cang;C.;;Filipino;1963-10-22;;Female;Single;;;;123-748-308;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('124', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 08:56:40', 'Added ADOF3-56-2004 Personal Information', 'ADOF3-56-2004;Ms.;Guzman;Fatima;Dondoyano;D.;;Filipino;1960-05-13;;Female;Married;;;;138-116-080;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('125', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 08:58:01', 'Added CROF1-5-1998 Personal Information', 'CROF1-5-1998;Ms.;Elunan;Aivie;Parcon;P.;;Filipino;1981-06-26;;Female;Married;;;;230-472-519;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('126', '1111', 'HR Module', 'tblagency', '', '2021-07-22 09:13:16', 'Edited Department of Environment and Natural Resources Agency_profile', 'Department of Environment and Natural Resources;DENR;6;000-535-643-036;Pepita Aquino Street Port Area, Iloilo City;5000;(033) 3294741;8372937;  r6@denr.gov.ph;www.denr.gov.ph;Bi-Monthly;;;;;;0;;9;12;2-0496976000-2;100;100;2;5;50;50;0.00;;To mobilize our citizenry in protecting, conserving, and managing the environment and natural resources for the present and future generations.;A nation enjoying and sustaining its natural resources and a clean and healthy environment.;The Department is the primary agency responsible for the conservation, management, development, and proper use of the country’s environment and natural resources, specifically forest and grazing lands, mineral resources, including those in reservation and watershed areas, and lands of the public domain, as well as the licensing and regulation of all natural resources as may be provided for by law in order to ensure equitable sharing of the benefits derived therefrom for the welfare of the present and future generations of Filipinos.;     ', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('127', '1111', 'HR Module', 'tblgroup1', '', '2021-07-22 09:18:15', 'Deleted  Org_structure', 'ARDMS;Office of the Assistant Regional Director for Management Services;ATY5-8-1998;ARD for Management S;;;6;Empleo;Noel;Cordero;C.;;Atty.;M;Married;;;;;;;;;;;Filipino;;0;0000-00-00;;;0.00;0.00;;;;;;;;0;;;;;;;;;0;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;0000-00-00;;;0000-00-00;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('128', '1111', 'HR Module', 'tblgroup1', '', '2021-07-22 09:18:20', 'Deleted  Org_structure', 'ARDTS;Office of the Assistant Regional Director for Technical Services;PENRO-33-1998;ARD for Technical Se;;;7;Lorilla;Raul ;Ligas;L.;;Mr.;;;;;;;;;;;;;;;0;0000-00-00;;;0.00;0.00;;;;;;;;0;;;;;;;;;0;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;0000-00-00;;;0000-00-00;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('129', '1111', 'HR Module', 'tblgroup2', '', '2021-07-22 09:20:21', 'Added ARDMS Org_structure', 'ORD;ARDMS;Assistant Regional Director for Management Services;ATY5-8-1998;ARD for Management Services;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('130', '1111', 'HR Module', 'tblgroup2', '', '2021-07-22 09:21:41', 'Added ARDTS Org_structure', 'ORD;ARDTS;Assistant Regional Director for Technical Services;PENRO-33-1998;ARD for Technical Services;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('131', '1111', 'HR Module', 'tblgroup3', '', '2021-07-22 09:24:07', 'Added PMD Org_structure', 'ORD;ARDMS;PMD;Planning and Management Division;PLO5-2-1998;Chief, Planning and Management Division;ADAS3-97-2014', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('132', '1111', 'HR Module', 'tblgroup3', '', '2021-07-22 09:24:16', 'Edited PMD Org_structure', 'ORD;ARDMS;PMD;Planning and Management Division;PLO5-2-1998;Chief, Pla;ADAS3-97-2014', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('133', '1111', 'HR Module', 'tblgroup3', '', '2021-07-22 09:24:49', 'Edited PMD Org_structure', 'ORD;ARDMS;PMD;Planning and Management Division;PLO5-2-1998;Chief, Pla;ADAS3-97-2014', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('134', '1111', 'HR Module', 'tblgroup3', '', '2021-07-22 09:26:23', 'Added FD Org_structure', 'ORD;ARDMS;FD;Finance Division;SADOF-48-2014;Chief, Finance Division;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('135', '1111', 'HR Module', 'tblgroup3', '', '2021-07-22 09:27:51', 'Added AD Org_structure', 'ORD;ARDMS;AD;Administrative Division;CADOF-31-2004;Chief, Administrative Division;ADOF2-128-2004', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('136', '1111', 'HR Module', 'tblgroup3', '', '2021-07-22 09:33:20', 'Added LD Org_structure', 'ORD;ARDMS;LD;Legal Division;ATY5-8-1998;Chief, Legal Division;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('137', '1111', 'HR Module', 'tblgroup1', '', '2021-07-22 09:35:09', 'Edited ORD Org_structure', 'ORD;Office of the Regional Executive Director;PENRO-32-1998;Regional Executive D;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('138', '1111', 'HR Module', 'tblgroup1', '', '2021-07-22 09:36:32', 'Edited ORD Org_structure', 'ORD;Office of the Regional Executive Director;PENRO-32-1998;Regional Executive Director;INFO2-21-2014', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('139', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 09:55:36', 'Added ATY4-19-2014 Personal Information', 'ATY4-19-2014;Mr.;Militar;Elizur;Gabilo;G.;;Filipino;1969-05-20;;Male;Married;;;;138-115-933;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('140', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 09:57:01', 'Added ATY3-36-1998 Personal Information', 'ATY3-36-1998;Ms.;Palmes;Connie;Soquera;S.;;Filipino;1982-01-25;;Female;Single;;;;942-473-034;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('141', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 09:58:34', 'Added ATY3-37-1998 Personal Information', 'ATY3-37-1998;Atty. ;Arceta;Francis Glenn;Soriano;S.;;Filipino;1977-01-10;;Male;Married;;;;935-318-081;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('142', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 09:59:02', 'Edited Empleo Personal', 'Atty.;Empleo;Noel;Cordero;C.;;Filipino;0000-00-00;;M;Married;;0.00;0.00;;;;;;;;;;;;;;;;;;;0;0;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('143', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 09:59:27', 'Edited Militar Personal', 'Atty.;Militar;Elizur;Gabilo;G.;;Filipino;1969-05-20;;M;Married;;0.00;0.00;138-115-933;;;;;;;;;;;;;;;;;;0;0;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('144', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 09:59:59', 'Edited Palmes Personal', 'Atty.;Palmes;Connie;Soquera;S.;;Filipino;1982-01-25;;F;Single;;0.00;0.00;942-473-034;;;;;;;;;;;;;;;;;;0;0;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('145', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 10:00:21', 'Edited Arceta Personal', 'Atty. ;Arceta;Francis Glenn;Soriano;S.;;Filipino;1977-01-10;;M;Married;;0.00;0.00;935-318-081;;;;;;;;;;;;;;;;;;0;0;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('146', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 10:01:59', 'Added ATY3-18-2014 Personal Information', 'ATY3-18-2014;Atty.;Librero;Cheryll Rose;Villanueva;V.;;Filipino;1977-08-04;;Female;Single;;;;924-978-124;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('147', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 10:02:57', 'Added ATY2-29-1998 Personal Information', 'ATY2-29-1998;Atty.;Pacete;May Flor;Ebide;E.;;Filipino;1981-05-22;;Female;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('148', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 10:04:17', 'Added ATY2-22-2014 Personal Information', 'ATY2-22-2014;Atty. ;Granada;Anna Jade;Lao;L.;;Filipino;1990-02-22;;Female;Single;;;;413-574-102;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('149', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 10:05:35', 'Added ATY2-23-2014 Personal Information', 'ATY2-23-2014;Atty. ;Gayongorsa;Bronwen May;Lagura;L.;;Filipino;1989-04-24;;Female;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('150', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 10:07:08', 'Added LEA2-25-1998 Personal Information', 'LEA2-25-1998;Ms.;Aldana;Ma. Hessel; Luzuriaga;L.;;Filipino;1978-12-03;;Female;Single;;;;442-857-675;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('151', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 10:08:50', 'Added LEA2-27-1998 Personal Information', 'LEA2-27-1998;Mr.;Loriega;Sean Carlo Rey;Villa;V.;;Filipino;1985-01-23;;Male;Single;;;;303-518-544;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('152', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 10:10:00', 'Added ADAS1-175-2014 Personal Information', 'ADAS1-175-2014;Ms.;Jamotillo;Helen Grace;Flores;F. ;;Filipino;1977-07-28;;Female;Married;;;;924-987-052;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('153', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 10:11:19', 'Added ADA6-201-2004 Personal Information', 'ADA6-201-2004;Ms.;Licawan;Alwyn;Alibango;A.;;Filipino;1977-01-20;;Female;Single;;;;933-585-664;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('154', '1111', 'HR Module', 'tblgroup1', '', '2021-07-22 10:12:43', 'Edited ORD Org_structure', 'ORD;Office of the Regional Executive Director;PENRO-32-1998;Regional Executive Director;INFO2-21-2014', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('155', '1111', 'HR Module', 'tblplantillagroup', '', '2021-07-22 10:42:09', 'Added Office of the Regional Director Plantilla Group', '407.0000 ;Office of the Regional Director;1', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('156', '1111', 'HR Module', 'tblplantillagroup', '', '2021-07-22 10:43:49', 'Added Planning & Management Division Plantilla Group', '408.0000;Planning & Management Division;2', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('157', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 10:49:21', 'Added DMO5-129-2014 Personal Information', 'DMO5-129-2014;Mr.;Lorilla;Danilo;Losaria;L.;;Filipino;1962-12-30;;Male;Single;;;;131-404-989;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('158', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 11:03:46', 'Added DMO4-151-2014 Personal Information', 'DMO4-151-2014;Ms.;Peñaranda;Emelyn;Sana;S. ;;Filipino;1964-04-15;;Female;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('159', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 11:07:37', 'Added ENG2-85-1998 Personal Information', 'ENG2-85-1998;Mr.;Tumasis;Ronnie;Tanaquin;T.;;Filipino;1959-12-20;;Male;Married;;;;123-347-765;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('160', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 11:08:58', 'Added ADA6-682-2004 Personal Information', 'ADA6-682-2004;Mr. ;Tumasis;Jose Marie;Tiezo;T.;;;1985-12-13;;Male;Married;;;;266-725-045;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('161', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 11:10:28', 'Added DMO3-276-2014 Personal Information', 'DMO3-276-2014;Ms.;Baldove;Mary Ann;Arellano;A.;;Filipino;1966-10-25;;Female;Married;;;;150-423-011;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('162', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 11:12:17', 'Added DMO2-288-2014 Personal Information', 'DMO2-288-2014;Ms.;Astete;Mary Ann;Ferraris;F. ;;Filipino;1974-09-20;;Female;Single;;;;910-129-170;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('163', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 11:13:23', 'Added DMO2-289-2014 Personal Information', 'DMO2-289-2014;Ms.;Salditos;Melba;Jumaran;J.;;Filipino;1962-05-28;;Female;Single;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('164', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 11:14:52', 'Added DMO1-92-2014 Personal Information', 'DMO1-92-2014;Ms.;Rodrigo;Cyndy Sol;Gabuya;G.;;Filipino;1990-11-01;;Female;Married;;;;409-473-446;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('165', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 11:18:59', 'Added DMO2-290-2014 Personal Information', 'DMO2-290-2014;Ms.;Atis;Doris;Cajurao;C.;;Filipino;1968-02-01;;Female;Married;;;;162-139-304;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('166', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 11:20:17', 'Added DMO1-86-2014 Personal Information', 'DMO1-86-2014;Ms.;Mendez;Ailene;Cadungo;C.;;Filipino;1986-04-24;;Female;Married;;;;268-586-762;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('167', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 11:22:17', 'Added ZOOT-3-1998 Personal Information', 'ZOOT-3-1998;Ms.;Palabrica;Kimberly;Caporte;C.;;Filipino;1994-07-19;;Female;Single;;;;473-682-620;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('168', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 11:28:07', 'Added DFM1-9-1998 Personal Information', 'DFM1-9-1998;Mr.;Casio;Rachel;Alicaway;A.;;Filipino;1974-08-15;;Male;Married;;;;183-295-864;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('169', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 11:30:59', 'Added DMO3-278-2014 Personal Information', 'DMO3-278-2014;Ms.;Flores;Gloria;Mason;M.;;Filipino;1971-01-08;;Female;Married;;;;145-630-819;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('170', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 11:38:26', 'Edited Flores Personal', 'Ms.;Flores;Gloria;Mason;M.;;Filipino;1971-01-08;;F;Married;;0.00;0.00;145-630-819;;;;;;;;;;;;;;;;;;0;0;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('171', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 11:40:01', 'Added DMO2-294-2014 Personal Information', 'DMO2-294-2014;Ms. ;Malate;Corazon;Benter;B.;;Filipino;1963-02-19;;Female;Widowed;;;;131-404-998;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('172', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 11:41:12', 'Added DMO1-87-2014 Personal Information', 'DMO1-87-2014;Mr.;Legada;John Carlo;Nerona;N.;;Filipino;1990-12-06;;Male;Married;;;;431-439-514;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('173', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 11:43:45', 'Added DMO1-88-2014 Personal Information', 'DMO1-88-2014;Ms.;Cabungcal;Liza Marie;Ladera;L.;;Filipino;1965-07-17;;Female;Single;;;;200-813-115;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('174', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 11:48:11', 'Added ENG5-2-1998 Personal Information', 'ENG5-2-1998;Engr. ;Meliton;Solas;Babon;B.;;Filipino;1962-05-20;;Male;Single;;;;138-130-131;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('175', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 11:51:14', 'Added ENG4-53-1998 Personal Information', 'ENG4-53-1998;Engr.;Sumaculub;Romulo;Osorio;O.;;Filipino;1965-12-14;;Male;Married;;;;161-505-586;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('176', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 11:52:47', 'Added ADA6-197-2004 Personal Information', 'ADA6-197-2004;Ms.;Subano;Manuela;Sepanton;S. ;;Filipino;1964-08-19;;Female;Married;;;;157-142-796;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('177', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 11:54:16', 'Added ADA6-199-2004 Personal Information', 'ADA6-199-2004;Mr.;Locsin;Pablo;Baleña;B.;Jr.;Filipino;1969-02-09;;Male;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('178', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 11:55:35', 'Added ENG3-26-1998 Personal Information', 'ENG3-26-1998;Engr.;Alvarez;Vivien;Morias;M.;;Filipino;1967-08-31;;Female;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('179', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 11:56:47', 'Added ENG3-27-1998 Personal Information', 'ENG3-27-1998;Engr.;Lebelo;Glenmark;Kadano;K.;;Filipino;1978-02-14;;Male;Married;;;;938-909-681;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('180', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 11:57:27', 'Added ENG3-28-1998 Personal Information', 'ENG3-28-1998;Engr.;Rubite;Agnes;Tormon;T.;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('181', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 11:59:00', 'Edited Rubite Personal', 'Engr.;Rubite;Agnes;Tormon;T.;;Dual Citizenship;1960-08-27;;F;;;0.00;0.00;;;;;;;;;;;;;;;;;;;0;0;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('182', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 11:59:35', 'Edited Abordo Personal', 'Mr. ;Abordo;Rene;Grande;G.;;Filipino;1967-08-07;;M;Married;;0.00;0.00;;;;;;;;;;;;;;;;;;;0;0;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('183', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 12:05:00', 'Added ENG3-130-1998 Personal Information', 'ENG3-130-1998;Engr. ;Gumapas;Teresita;Español;E.;;Filipino;1959-08-07;;Female;Married;;;;162-139-470;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('184', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 12:06:40', 'Added ENG2-87-1998 Personal Information', 'ENG2-87-1998;Engr.;Penida;Estelle;Caballero;C.;;Filipino;1979-03-10;;Female;Married;;;;938-037-221;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('185', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 12:08:09', 'Added ENG2-31-1998 Personal Information', 'ENG2-31-1998;Engr.;Castro;Marian Joy;Ferrer;F.;;Filipino;1987-09-04;;Female;Single;;;;282-463-724;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('186', '1111', 'HR Module', 'tblagency', '', '2021-07-22 12:08:13', 'Edited MUNICIPAL GOVERNMENT OF PAETE | MISO Version 1.0 Agency_profile', 'MUNICIPAL GOVERNMENT OF PAETE | MISO Version 1.0;PCHRD;NCR;044-000-553-203;General Santos Ave., Bicutan, Taguig City;1631;8372071-82;8372937;  ;www.dost.gov.ph;Bi-Monthly;;;;;;0;;9;12;;100;100;2;5;50;50;0.00;140039100007;To direct, lead, and coordinate scientific and technological efforts in the country and ensure that these result to the maximum economic and social benefits for the Filipino people.;A prosperous Filipino nation whose socio-economic well-being is assured through competent and responsible use of scientific knowledge and technological innovations.;;     ', '', '122.54.50.11');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('187', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 12:09:37', 'Added ENG1-46-1998 Personal Information', 'ENG1-46-1998;Engr.;Servita;Daphne;Doplayna;D.;;Filipino;1965-08-03;;Female;Married;;;;157-142-895;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('188', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 12:11:03', 'Added FORST3-208-1998 Personal Information', 'FORST3-208-1998;Mr.;Abrico;Pedro;Caniedo;C.;;Filipino;1960-07-02;;Male;Married;;;;138-119-937;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('189', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 12:12:07', 'Added FORST3-221-1998 Personal Information', 'FORST3-221-1998;Mr.;Balmores;Dave;Naval;N.;;Filipino;1975-11-12;;Male;Married;;;;919-281-025;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('190', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 12:13:31', 'Added FORST3-223-1998 Personal Information', 'FORST3-223-1998;Mr.;Paderna;Lino;Palomar;P.;;Filipino;1960-01-01;;Male;Married;;;;150-792-606;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('191', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 12:15:44', 'Added FORST3-224-1998 Personal Information', 'FORST3-224-1998;Mr.;Buñag;Albert;Diamante;D.;;Filipino;1965-04-29;;Male;Married;;;;134-346-967;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('192', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 12:16:50', 'Added FORST3-225-1998 Personal Information', 'FORST3-225-1998;Mr.;Logronio;Ramon;Tano;T.;;Filipino;1964-09-07;;Male;Married;;;;131-400-799;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('193', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 12:18:21', 'Added FORST2-712-1998 Personal Information', 'FORST2-712-1998;Mr.;Corbal;Apolinario;Librodo;L.;;Filipino;1969-03-08;;Male;Married;;;;145-630-868;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('194', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 12:19:49', 'Added FORST2-766-1998 Personal Information', 'FORST2-766-1998;Mr.;Villasor;Dennis;Dollolasa;D.;;Filipino;1973-02-08;;Male;Married;;;;181-053-957;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('195', '1111', 'HR Module', 'tblagency', '', '2021-07-22 12:20:14', 'Edited MUNICIPAL GOVERNMENT OF PAETE | MISO Version 1.0 - Central Office Agency_profile', 'MUNICIPAL GOVERNMENT OF PAETE | MISO Version 1.0 - Central Office;DENR-VI;NCR;044-000-553-203;General Santos Ave., Bicutan, Taguig City;1631;8372071-82;8372937;  ;www.dost.gov.ph;Bi-Monthly;00:00:00;00:00:00;0;0;00:00:00;0;;9;12;;100;100;2;5;50;50;0.00;140039100007;To direct, lead, and coordinate scientific and technological efforts in the country and ensure that these result to the maximum economic and social benefits for the Filipino people.;A prosperous Filipino nation whose socio-economic well-being is assured through competent and responsible use of scientific knowledge and technological innovations.;;     ', '', '122.54.50.11');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('196', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 12:21:20', 'Added FORST2-767-1998 Personal Information', 'FORST2-767-1998;Mr. ;Lechoncito;Vicente;Lacuesta;L.;Jr.;Filipino;1972-03-02;;Male;Married;;;;928-946-358;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('197', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 12:24:19', 'Added FORST2-769-1998 Personal Information', 'FORST2-769-1998;Ms.;Bandies;Evangeline;Labitan;L.;;Filipino;1960-05-03;;Female;Married;;;;143-313-985;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('198', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 12:25:09', 'Added FORST2-771-1998 Personal Information', 'FORST2-771-1998;Ms.;Lastica;Ma. Agnes;Casumpang;C.;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('199', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 12:26:13', 'Edited Lastica Personal', 'Ms.;Lastica;Ma. Agnes;Casumpang;C.;;Filipino;1964-09-22;;F;Married;;0.00;0.00;131-400-656;;;;;;;;;;;;;;;;;;0;0;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('200', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 12:27:47', 'Added FORST2-772-1998 Personal Information', 'FORST2-772-1998;Mr.;Panigua;Johnny;Firma;F.;;Filipino;1975-11-03;;Male;Married;;;;921-641-121;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('201', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 12:29:08', 'Added FORST2-773-1998 Personal Information', 'FORST2-773-1998;Ms.;Maceda;Fe;Labaniego;L.;;Filipino;1962-12-31;;Female;Married;;;;143-313-878;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('202', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 12:30:31', 'Added FORST2-414-1998 Personal Information', 'FORST2-414-1998;Ms.;Parcon;Nelyn;Lames;L.;;Filipino;1968-06-22;;Female;Widowed;;;;919-281-017;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('203', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 12:31:49', 'Added FORST2-417-1998 Personal Information', 'FORST2-417-1998;Ms.;Salditos;Elizabeth;Gallego;G.;;Filipino;1965-07-23;;Female;Married;;;;143-897-429;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('204', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 12:33:45', 'Added CGR4-43-1998 Personal Information', 'CGR4-43-1998;Ms.;Haro;Debbie;Mombay;M.;;Filipino;1962-01-19;;Female;Widowed;;;;174-205-689;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('205', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 12:36:30', 'Added CGR3-6-1998 Personal Information', 'CGR3-6-1998;Mr.;Garzon;Jose;Superticioso;S.;;Filipino;1957-08-03;;Male;Separated;;;;157-142-528;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('206', '1111', 'HR Module', 'tblagency', '', '2021-07-22 13:06:00', 'Edited Department of Environment and Natural Resources Agency_profile', 'Department of Environment and Natural Resources;DENR-VI;VI;000535643036;Pepita Aquino Street, Port Area, Iloilo City;5000;(033) 329-4724;8372937;  r6@denr.gov.ph;www.denr.gov.ph;Bi-Monthly;00:00:00;00:00:00;0;0;00:00:00;0;1000021657;9;12;2-0496976000-2;100;100;2;5;50;50;0.00;142230100010;To mobilize our citizenry in protecting, conserving, and managing the environment and natural resources for the present and future generations.;A nation enjoying and sustaining its natural resources and a clean and healthy environment.;The Department is the primary agency responsible for the conservation, management, development, and proper use of the country’s environment and natural resources, specifically forest and grazing lands, mineral resources, including those in reservation and watershed areas, and lands of the public domain, as well as the licensing and regulation of all natural resources as may be provided for by law in order to ensure equitable sharing of the benefits derived therefrom for the welfare of the present and future generations of Filipinos.;     ', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('207', '1111', 'HR Module', 'tblagency', '', '2021-07-22 13:12:21', 'Edited Department of Environment and Natural Resources Agency_profile', 'Department of Environment and Natural Resources;DENR-VI;VI;000535643036;Pepita Aquino Street, Port Area, Iloilo City;5000;(033) 329-4724;0;  r6@denr.gov.ph;www.denr.gov.ph;Bi-Monthly;00:00:00;00:00:00;0;0;00:00:00;0;1000021657;9;12;2-0496976000-2;100;100;2;5;50;50;0.00;142230100010;To mobilize our citizenry in protecting, conserving, and managing the environment and natural resources for the present and future generations.;A nation enjoying and sustaining its natural resources and a clean and healthy environment.;The Department is the primary agency responsible for the conservation, management, development, and proper use of the country’s environment and natural resources, specifically forest and grazing lands, mineral resources, including those in reservation and watershed areas, and lands of the public domain, as well as the licensing and regulation of all natural resources as may be provided for by law in order to ensure equitable sharing of the benefits derived therefrom for the welfare of the present and future generations of Filipinos.;     ', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('208', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 13:27:12', 'Added ADASI-178-2014 Personal Information', 'ADASI-178-2014;;Ausin;Emily;Balome;B;;Filipino;;;Female;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('209', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 13:27:35', 'Added ADA4-553-2004 Personal Information', 'ADA4-553-2004;;Castillon;Mary May;;;;Filipino;;;Female;Single;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('210', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 13:28:48', 'Added CADOF-96-2014 Personal Information', 'CADOF-96-2014;;Gunce;Rossinee;Tumlos;;;Filipino;;Sara Iloilo;Female;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('211', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 13:29:05', 'Added A3-96-2014 Personal Information', 'A3-96-2014;;Agdon;Iris;Defensor;D;;Filipino;;;Female;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('212', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 13:29:42', 'Added ADOF4-97-2014 Personal Information', 'ADOF4-97-2014;;Monegro;Belen;Muyuela;;;Filipino;;Cabatuan Iloilo;Female;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('213', '1111', 'HR Module', 'tblagency', '', '2021-07-22 13:40:11', 'Edited Department of Environment and Natural Resources Agency_profile', 'Department of Environment and Natural Resources;DENR-VI;VI;000535643036;Pepita Aquino Street, Port Area, Iloilo City;5000;(033) 329-4724;0;  r6@denr.gov.ph;www.denr.gov.ph;Bi-Monthly;00:00:00;00:00:00;0;0;00:00:00;0;1000021657;9;12;2-0496976000-2;100;100;2;5;50;50;0.00;142230100010;To mobilize our citizenry in protecting, conserving, and managing the environment and natural resources for the present and future generations.;A nation enjoying and sustaining its natural resources and a clean and healthy environment.;The Department is the primary agency responsible for the conservation, management, development, and proper use of the country’s environment and natural resources, specifically forest and grazing lands, mineral resources, including those in reservation and watershed areas, and lands of the public domain, as well as the licensing and regulation of all natural resources as may be provided for by law in order to ensure equitable sharing of the benefits derived therefrom for the welfare of the present and future generations of Filipinos.;LBP 3302 1038 51', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('214', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 14:13:51', 'Added CGR3-7-1998 Personal Information', 'CGR3-7-1998;Mr.;Loriega;Gil Roque;Otilano;O.;;Filipino;1957-08-03;;Male;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('215', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 14:15:19', 'Added CGR2-91-1998 Personal Information', 'CGR2-91-1998;Ms.;Suyo;Nelia;Peniero;P.;;Filipino;1968-02-19;;Female;Married;;;;157-429-330;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('216', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 14:16:39', 'Added CGR2-96-1998 Personal Information', 'CGR2-96-1998;Mr.;Villanueva;Efren;Burlungan;B.;;Filipino;1973-03-30;;Male;Single;;;;192-623-934;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('217', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 14:18:34', 'Added CGR2-100-1998 Personal Information', 'CGR2-100-1998;Mr.;Escala;Edward;Dumaicos;D.;;Filipino;1966-12-19;;Male;Married;;;;157-142-624;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('218', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 14:20:00', 'Added CGR1-267-1998 Personal Information', 'CGR1-267-1998;Ms.;Jerez;Marjorie;Braña;B.;;Filipino;1962-04-06;;Female;Married;;;;157-142-536;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('219', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 14:21:54', 'Added CGR1-268-1998 Personal Information', 'CGR1-268-1998;Mr.;Patriarca;Remegio;Teves;T.;;Filipino;1959-08-06;;Male;;;;;157-142-577;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('220', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 14:25:56', 'Added CGR1-270-1998 Personal Information', 'CGR1-270-1998;Mr.;Gervero;Joe Marie;Fulgencio;F.;;Filipino;1972-08-12;;Male;;;;;928-928-637;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('221', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 14:27:20', 'Added CGR1-464-1998 Personal Information', 'CGR1-464-1998;Mr.;Lavega;Elias;Dairo;D.;;Filipino;1959-10-08;;Male;Married;;;;144-854-750;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('222', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 14:29:08', 'Added CGR1-501-1998 Personal Information', 'CGR1-501-1998;Ms.;Saldivia;Maria;Patriarca;P.;;Filipino;1964-12-24;;Female;Married;;;;157-428-852;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('223', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 14:30:46', 'Added CGR1-502-1998 Personal Information', 'CGR1-502-1998;Mr. ;Quilab;Cesar;Dumalagan;D.;;Filipino;1964-07-07;;Male;Married;;;;123-746-364;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('224', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 14:50:33', 'Added CGR1-503-1998 Personal Information', 'CGR1-503-1998;Ms.;Baldonado;Rosario;Yusay;Y.;;Filipino;1963-10-26;;Female;Married;;;;174-203-769;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('225', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 14:51:55', 'Added ENGA-341-1998 Personal Information', 'ENGA-341-1998;Ms.;Umadhay;Shirly;Alvariño;A.;;Filipino;1969-01-23;;Female;Married;;;;143-898-279;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('226', '1111', 'HR Module', 'tblEmpRequest', '', '2021-07-22 15:21:45', 'Added asdads Travel Order', 'asdads;2021-07-30;2021-07-31;asdasd;Y;2021-07-22;Filed Request;TO;1111;[]', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('227', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 15:22:47', 'Added ENGA-352-1998 Personal Information', 'ENGA-352-1998;Ms;Echeche;Roseny;Adlaon;A.;;Filipino;1984-09-23;;Female;Married;;;;404-354-360;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('228', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 15:25:46', 'Added ADOF1-75-2014 Personal Information', 'ADOF1-75-2014;;Subosa;Lory Ann;;;;Filipino;;;Female;Single;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('229', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 15:27:17', 'Added ADOF1-240-2004 Personal Information', 'ADOF1-240-2004;;Sontillanosa;Bella Marie;;;;Filipino;;;Female;Single;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('230', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 15:28:06', 'Added ADOF1-243-2004 Personal Information', 'ADOF1-243-2004;;Surmion;Rolly;;;;Filipino;;;Female;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('231', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 15:28:15', 'Added ENGA-363-1998 Personal Information', 'ENGA-363-1998;Ms.;Villanueva;Susan;Angelada;A.;;Filipino;1964-12-24;;Female;;;;;157-142-681;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('232', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 15:29:48', 'Added ENGA-384-1998 Personal Information', 'ENGA-384-1998;Mr.;Latoza;Fernando;Lebuna;L.;;Filipino;1970-12-05;;Male;Single;;;;936-801-940;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('233', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 15:32:23', 'Added ENGA-389-1998 Personal Information', 'ENGA-389-1998;Mr. ;Servita;Razel;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('234', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 15:34:50', 'Edited Servita Personal', 'Mr. ;Servita;Razel;Concepcion;C.;;Filipino;1970-11-25;;M;Married;;0.00;0.00;138-120-156;;;;;;;;;;;;;;;;;;0;0;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('235', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 15:38:34', 'Added ENGA-390-1998 Personal Information', 'ENGA-390-1998;Mr.;Aquino;Luzviminda;Baylen;B.;;Filipino;1957-06-24;;Female;;;;;157-142-480;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('236', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 15:41:07', 'Added ENGA-391-1998 Personal Information', 'ENGA-391-1998;Ms.;Chichirita;Sylvia;Sumadic;S. ;;Filipino;1964-02-06;;Female;Married;;;;157-143-014;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('237', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 15:42:47', 'Added ENGA-160-2014 Personal Information', 'ENGA-160-2014;Ms.;Jover;Ma. Suzetta Euvel;Balicas;B.;;Filipino;1960-03-31;;Female;Married;;;;157-142-991;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('238', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 15:44:09', 'Added ENGA-161-2014 Personal Information', 'ENGA-161-2014;Ms. ;Declaro;Fe;Camarista;C.;;Filipino;1958-06-01;;Female;Married;;;;157-142-616;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('239', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 15:46:25', 'Added ENGA-162-2014 Personal Information', 'ENGA-162-2014;Ms.;Delgado;Alyn;Barrido;B.;;Filipino;1964-03-31;;Female;;;;;157-425-940;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('240', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 15:47:50', 'Added MTH1-25-1998 Personal Information', 'MTH1-25-1998;Ms. ;Mangalisan;Rosela; Cirujales;C.;;Filipino;1963-10-31;;Female;Married;;;;157-142-499;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('241', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 15:50:29', 'Added MTH1-3-1998 Personal Information', 'MTH1-3-1998;Ms.;Sucgang;Julia;Lachica;L.;;Filipino;1965-09-13;;Female;Married;;;;157-142-523;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('242', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 15:53:38', 'Added MTHA2-44-1998 Personal Information', 'MTHA2-44-1998;Ms.;Vijar;Maria Donna;Pelonia;P.;;Filipino;1963-05-16;;Female;;;;;157-142-673;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('243', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 15:57:59', 'Added MTHA2-115-1998 Personal Information', 'MTHA2-115-1998;Ms.;Sabido;Leah;Flores;F.;;Filipino;1964-10-17;;Female;;;;;157-142-704;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('244', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 15:59:20', 'Added MTHA2-117-1998 Personal Information', 'MTHA2-117-1998;Ms.;Animas;Liezl;Calapaan;C.;;Filipino;1973-02-08;;Female;;;;;157-142-472;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('245', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 16:00:42', 'Added MTHA1-30-1998 Personal Information', 'MTHA1-30-1998;Mr.;Bilbao;Jose Kenn;Pueyo;P.;;Filipino;1977-03-09;;Male;Single;;;;942-465-872;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('246', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 16:02:26', 'Added MTHA1-31-1998 Personal Information', 'MTHA1-31-1998;Mr.;Uy;Redan Kenneth;Janas;J.;;Filipino;1989-10-31;;Male;Single;;;;438-900-074;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('247', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 16:03:53', 'Added MTHA1-36-1998 Personal Information', 'MTHA1-36-1998;Mr.;Rodeo;Eric;Indico;I.;;Filipino;1989-03-13;;Male;;;;;283-839-751;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('248', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 16:04:29', 'Edited Bilbao Personal', 'Mr.;Bilbao;Jose Kenn;Pueyo;P.;;Filipino;1977-03-09;;M;;;0.00;0.00;942-465-872;;;;;;;;;;;;;;;;;;0;0;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('249', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 16:09:13', 'Added TR-80-1998 Personal Information', 'TR-80-1998;Ms.;Tupas;Debbie Grace;Jalandoni;J.;;Filipino;1990-01-18;;Female;Single;;;;421-987-522;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('250', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 16:13:58', 'Added TR-17-1998 Personal Information', 'TR-17-1998;Mr.;Sillorequez;Rene;Sumague;S.;;Filipino;1961-10-04;;Male;;;;;157-142-657;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('251', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 16:15:31', 'Added ADOF5-72-2014 Personal Information', 'ADOF5-72-2014;Ms.;Malanguis;Doreen;Hautea;H.;;Filipino;1962-03-22;;Female;Married;;;;143-313-958;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('252', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 16:16:39', 'Added ADOF4-170-2004 Personal Information', 'ADOF4-170-2004;Ms.;Luis;Olivia;Fuentes;F.;;Filipino;1976-08-13;;Female;Single;;;;921-846-552;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('253', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 16:18:35', 'Added ADOF2-62-2014 Personal Information', 'ADOF2-62-2014;Ms.;Mendiola;Irene;Bernas;B.;;Filipino;1968-10-19;;Female;Married;;;;138-115-958;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('254', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 16:20:04', 'Added ADOF1-236-2004 Personal Information', 'ADOF1-236-2004;Ms.;Macahilig;Ma. Julieta;Espina;E.;;Filipino;1962-04-09;;Female;Married;;;;130-012-959;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('255', '1111', 'HR Module', 'tblgroup3', '', '2021-07-22 16:25:19', 'Added CDD Org_structure', 'ORD;ARDTS;CDD;Conservation and Development Division;DMO5-129-2014;Chief, Conservation and Development Division;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('256', '1111', 'HR Module', 'tblgroup3', '', '2021-07-22 16:26:49', 'Added SMD Org_structure', 'ORD;ARDTS;SMD;Surveys and Mapping Division;ENG5-2-1998;Chief, Surveys and Mapping Division;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('257', '1111', 'HR Module', 'tblgroup3', '', '2021-07-22 16:29:21', 'Added LPDD Org_structure', 'ORD;ARDTS;LPDD;Licenses, Patents and Deeds Division;ATY4-19-2014;Chief, Licenses, Patents and Deeds Division ;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('258', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 16:32:51', 'Added DMO4-152-2014 Personal Information', 'DMO4-152-2014;Ms.;Gallego;Sharcel;Navarra;N.;;Filipino;1967-07-04;;Female;Widowed;;;;123-747-018;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('259', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 16:34:07', 'Added DMO3-279-2014 Personal Information', 'DMO3-279-2014;Ms.;Vivencio;Gemma;Soriano;S.;;Filipino;1964-08-19;;Female;Married;;;;162-755-609;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('260', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 16:36:02', 'Added DMO3-280-2014 Personal Information', 'DMO3-280-2014;Mr.;Losare;Edgardo;Losbañes;L.;;Filipino;1962-06-20;;Male;Married;;;;138-119-790;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('261', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 16:37:22', 'Added DMO3-282-2014 Personal Information', 'DMO3-282-2014;Ms.;Paderna;Teresita;Nadales;N;;Filipino;1964-10-03;;Female;Married;;;;141-171-232;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('262', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 16:38:54', 'Added DMO2-293-2014 Personal Information', 'DMO2-293-2014;Ms.;Bretaña;Rebecca; Pavorito;P.;;Filipino;1964-11-07;;Female;Married;;;;127-690-745;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('263', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 16:42:41', 'Added DMO2-292-2014 Personal Information', 'DMO2-292-2014;Mr.;Celeste;Segundino;Delicana;D.;Jr.;Filipino;1964-01-31;;Male;Married;;;;157-142-456;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('264', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 16:46:12', 'Added DMO2-291-2014 Personal Information', 'DMO2-291-2014;Ms.;Ballejera;Mekrinke;Villareal;V. ;;Filipino;1962-05-24;;Female;Married;;;;150-423-029;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('265', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 16:52:13', 'Added DMO2-295-2014 Personal Information', 'DMO2-295-2014;Ms.;Lacrite;Ma. Elena;Traifalgar;T.;;Filipino;1970-10-12;;Female;Married;;;;162-754-761;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('266', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 16:54:02', 'Added DMO2-276-2014 Personal Information', 'DMO2-276-2014;Ms.;Apud;Arlene;Cordero;C.;;Filipino;1962-09-19;;Female;Single;;;;141-245-988;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('267', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 16:55:09', 'Added DMO2-277-2014 Personal Information', 'DMO2-277-2014;Ms.;Chio;Aileen;Tabjan;T.;;Filipino;1984-02-26;;Female;Single;;;;942-916-075;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('268', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 16:56:23', 'Added DMO2-278-2014 Personal Information', 'DMO2-278-2014;Mr.;Andraje;Renato;Bocateja;B.;;Filipino;1965-10-06;;Male;Married;;;;938-065-185;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('269', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 16:58:44', 'Added DMO1-89-2014 Personal Information', 'DMO1-89-2014;Ms.;Alarcon;Jeamee;Castillon;C.;;Filipino;1984-01-19;;Female;Single;;;;273-087-452;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('270', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 16:59:59', 'Added DMO1-90-2014 Personal Information', 'DMO1-90-2014;Ms.;Posa;Elaine Joy;Camarista;C.;;Filipino;1984-10-24;;Female;Married;;;;297-962-144;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('271', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 17:01:27', 'Added DMO1-91-2014 Personal Information', 'DMO1-91-2014;Ms.;Silomenio;Sarah Jane;Sudayan;S.;;Filipino;1992-04-27;;Female;Single;;;;439-505-230;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('272', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 17:02:46', 'Added CGR1-272-1998 Personal Information', 'CGR1-272-1998;Ms.;Ticzon;Narcisa;Capadosa;C.;;Filipino;1970-10-29;;Female;Married;;;;157-142-982;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('273', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 17:03:42', 'Edited Agdon Personal', 'Ms.;Agdon;Iris;Defensor;D;;Filipino;0000-00-00;;F;Married;;0.00;0.00;;;;;;;;;;;;;;;;;;;0;0;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('274', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 17:07:02', 'Edited Badoy Personal', 'Ms.;Badoy;Phoebe;Robles;R.;;Filipino;1990-09-01;Cuartero, Capiz;F;Married;BP NO. 2004839015;0.00;0.00;441-777-577;07-2696935-7;O;phoeberish@gmail.com;1210-3002-8198;11-050555726-3;Blk. 32 Lot 61;Blk. 32 Lot 61;;;DHPRR Village 1;DHPRR Village 1;Pandac;Pandac;Pavia;Pavia;Iloilo;Iloilo;5001;5001;;;09278674515;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('275', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 17:11:55', 'Added DFM2-6-1998 Personal Information', 'DFM2-6-1998;Ms.;Casuela;Melanie; Babao;B. ;;Filipino;1961-11-09;;Female;Married;;;;125-757-452;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('276', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 17:12:59', 'Added TR-78-1998 Personal Information', 'TR-78-1998;Ms.;Pumarin;Rosette;Doronilla;D. ;;Filipino;1960-11-17;;Female;Married;;;;157-143-006;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('277', '1111', 'HR Module', 'tblHoliday', '', '2021-07-22 17:13:36', 'Edited LD01 Holiday', 'LD01;Labor Day', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('278', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 17:22:05', 'Added CECMS-3-1998 Personal Information', 'CECMS-3-1998;Ms.;Garol; June Melissa;Catalan;C.;;Filipino;1966-06-01;;Female;Single;;;;139-174-326;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('279', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 17:24:08', 'Added SVEMS-16-1998 Personal Information', 'SVEMS-16-1998;Mr.;Villanueva;Jesrel;Dativo;D.;;Filipino;1964-07-20;;Male;Married;;;;138-119-880;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('280', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 17:25:33', 'Added ADA6-684-2014 Personal Information', 'ADA6-684-2014;Ms.;Obero;Christine Jane;Mamon;M.;;Filipino;1992-09-15;;Female;Single;;;;460-873-869;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('281', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 17:27:11', 'Added SREMS-29-1998 Personal Information', 'SREMS-29-1998;Ms.;Alenaje;Gregoria;Desierdo;D.;;Filipino;1968-07-26;;Female;Married;;;;138-116-216;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('282', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 17:28:47', 'Added SREMS-178-2014 Personal Information', 'SREMS-178-2014;Mr.;Bayona;Bonifacio;Eulatic;III;;Filipino;1959-08-29;;Male;Married;;;;123-746-294;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('283', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 17:30:06', 'Added ECOMS2-213-1998 Personal Information', 'ECOMS2-213-1998;Ms.;Palma;Phebe;Rafael;R.;;Filipino;1964-03-02;;Female;Married;;;;130-013-023;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('284', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 17:31:33', 'Added ECOMS2-165-2014 Personal Information', 'ECOMS2-165-2014;Ms.;Lastica;Mercedita;Galimba;G.;;Filipino;1965-05-02;;Female;Married;;;;131-404-971;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('285', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 17:33:21', 'Added ECOMS2-152-2014 Personal Information', 'ECOMS2-152-2014;Ms.;Cerebo;Mary Ann;Maquillo;M.;;Filipino;1967-01-21;;Female;Married;;;;130-012-975;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('286', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 17:34:57', 'Added ECOMS2-153-2014 Personal Information', 'ECOMS2-153-2014;Ms.;Manglinong;Mary Rose;Batir;B.;;Filipino;1968-06-12;;Female;Married;;;;145-630-835;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('287', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 17:36:31', 'Added ECOMS2-154-2014 Personal Information', 'ECOMS2-154-2014;Mr. ;Caserial;Airde Jay;Castigador;C.;;Filipino;1992-07-31;;Male;Single;;;;439-505-368;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('288', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 17:37:53', 'Added ECOMS2-155-2014 Personal Information', 'ECOMS2-155-2014;Mr.;Tayo;Aljohn;Alcalde;A. ;;Filipino;1990-09-23;;Male;;;;;431-919-225;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('289', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-22 17:39:11', 'Added ECOMS1-41-1998 Personal Information', 'ECOMS1-41-1998;Ms.;Lacorte;Stella;Bantay;B.;;Filipino;1992-08-18;;Female;Single;;;;455-429-167;;;;;;;;;;;;;;;;;;;;;;;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('290', '1111', 'HR Module', 'tblgroup3', '', '2021-07-22 17:40:34', 'Added ED Org_structure', 'ORD;ARDTS;ED;Enforcement Division;CECMS-3-1998;Chief, Enforcement Division;ECOMS1-41-1998', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('291', '1111', 'HR Module', 'tblgroup1', '', '2021-07-22 17:40:47', 'Edited ORD Org_structure', 'ORD;Office of the Regional Executive Director;PENRO-32-1998;Regional Executive D;INFO2-21-2014', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('292', 'ADOF1-234-2004', 'HR Module', 'tblEmpRequest', '', '2021-07-22 18:05:15', 'Added Penro Capiz Travel Order', 'Penro Capiz;2021-07-26;2021-07-27;To transact business pertaining the new system HRMIS.;Y;2021-07-22;Filed Request;TO;ADOF1-234-2004;[{\"fileid\":1,\"filepath\":\"uploads\\/employees\\/attachments\\/travel_order\\/\\/60f942db3c7e6.png\",\"filename\":\"DENR LOGO.png\"}]', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('293', '1111', 'HR Module', 'tblposition', '', '2021-07-22 18:29:08', 'Added  Park Operation Superintendent IV  Position', 'OSEC-DENRB-POS4-5-2014; Park Operation Superintendent IV ;PA', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('294', '1111', 'HR Module', 'tblposition', '', '2021-07-22 18:29:39', 'Edited  Park Operation Superintendent IV  Position', 'OSEC-DENRB-POS4-5-20; Park Operation Superintendent IV ;PAOSU', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('295', '1111', 'HR Module', 'tblplantillagroup', '', '2021-07-22 18:50:27', 'Added Finance Division Plantilla Group', '410.0000;Finance Division;3', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('296', '1111', 'HR Module', 'tblplantillagroup', '', '2021-07-22 18:51:14', 'Added Administrative Division Plantilla Group', '414.0000;Administrative Division;4', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('297', '1111', 'HR Module', 'tblplantillagroup', '', '2021-07-22 18:51:54', 'Added Legal Division Plantilla Group', '418.0000;Legal Division;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('298', '1111', 'HR Module', 'tblplantillagroup', '', '2021-07-22 18:52:11', 'Edited Legal Division Plantilla Group', '418.0000;Legal Division;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('299', '1111', 'HR Module', 'tblplantillagroup', '', '2021-07-22 18:52:16', 'Edited Legal Division Plantilla Group', '418.0000;Legal Division;', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('300', '1111', 'HR Module', 'tblgroup1', '', '2021-07-23 12:56:06', 'Edited ORD Org_structure', 'ORD;Office of the Regional Executive Director;PENRO-32-1998;Regional Executive Director;INFO2-21-2014', '', '175.176.72.149');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('301', '1111', 'HR Module', 'tblplantillagroup', '', '2021-07-23 12:58:05', 'Edited Legal Division Plantilla Group', '418.0000;Legal Division;5', '', '175.176.72.149');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('302', '1111', 'HR Module', 'tblplantillagroup', '', '2021-07-23 12:58:25', 'Edited Legal Division Plantilla Group', '418.0000;Legal Division;5', '', '175.176.72.149');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('303', '1111', 'HR Module', 'tblposition', '', '2021-07-23 13:04:08', 'Edited  Park Operation Superintendent IV  Position', 'OSEC-DENRB-POS4-5-20; Park Operation Superintendent IV ;PAOSU', '', '175.176.72.149');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('304', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-07-23 13:25:28', 'Edited Robles Personal', 'Robles;Eddie;Homopot;;Gemma;Guevara;Robles;Blk. 32 Lot 61 DHPRR, Pandac, Pavia, Iloilo', '', '175.176.72.149');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('305', '1111', 'HR Module', 'tblScholarship', '', '2021-07-23 13:44:00', 'Added CHED Scholarship Scholarship', 'CHED Scholarship', '', '175.176.72.149');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('306', '1111', 'HR Module', 'tblempaccount', '', '2021-07-23 14:00:27', 'Added federisoe User_account', 'CADOF-31-2004;federisoe;21232f297a57a5a743894a0e4a801fc3;3;0;;officer;', '', '175.176.72.149');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('307', '1111', 'HR Module', 'tblempaccount', '', '2021-07-23 14:02:10', 'Added duranl User_account', 'PENRO-32-1998;duranl;21232f297a57a5a743894a0e4a801fc3;4;0;;executive;', '', '175.176.72.149');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('308', '1111', 'HR Module', 'tblempaccount', '', '2021-07-23 14:03:13', 'Added empleon User_account', 'ATY5-8-1998;empleon;21232f297a57a5a743894a0e4a801fc3;3;0;;officer;', '', '175.176.72.149');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('309', '1111', 'HR Module', 'tblempaccount', '', '2021-07-23 14:03:50', 'Edited phoeber User_account', 'ADOF1-234-2004;phoeber;5;0;;employee;', '', '175.176.72.149');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('310', 'ADOF1-234-2004', 'HR Module', 'tblEmpRequest', '', '2021-07-23 14:06:44', 'Added Penro Capiz Travel Order', 'Penro Capiz;2021-07-29;2021-07-30;Hrmis installation;Y;2021-07-23;Filed Request;TO;ADOF1-234-2004;[]', '', '175.176.72.149');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('311', 'ADOF1-234-2004', 'HR Module', 'tblEmpRequest', '', '2021-07-23 14:09:35', 'Added Badoy PDS Update', 'Profile;Badoy;Phoebe;Robles;;1990-09-01;Cuartero, Capiz;Married;0.00;0.00;O;;BP NO. 2004839015;1210-3002-8198;11-050555726-3;441-777-577;B32 L61;Xiphias Street;DHPRR Village 1;Pandac;Pavia;Iloilo;5001;;B32 L61;Xiphias Street;DHPRR Village 1;Pandac;Pavia;Iloilo;5001;;phoeberish@gmail.com;09278674515;Filed Request;201 Profile;2021-07-23;Filed Request;201;ADOF1-234-2004', '', '175.176.72.149');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('312', 'ADOF1-234-2004', 'HR Module', 'tblEmpRequest', '', '2021-07-23 14:11:50', 'Added  PDS Update', 'Education;;Jaro I Elementary School;0;1997;2003;-;;;N;Y;2003;;201 Education;2021-07-23;Filed Request;201;ADOF1-234-2004', '', '175.176.72.149');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('313', 'ADOF1-234-2004', 'HR Module', 'tblEmpRequest', '', '2021-07-23 14:16:31', 'Added  PDS Update', 'Education;;Western Visayas College of Science and Technology;0;2003;2007;-;;;N;Y;2007;;201 Education;2021-07-23;Filed Request;201;ADOF1-234-2004', '', '175.176.72.149');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('314', 'ADOF1-234-2004', 'HR Module', 'tblEmpRequest', '', '2021-07-23 14:19:13', 'Added  PDS Update', 'Education;;West Visayas State University;0;2007;2011;-;10;;N;Y;2011;;201 Education;2021-07-23;Filed Request;201;ADOF1-234-2004', '', '175.176.72.149');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('315', 'ADOF1-234-2004', 'HR Module', 'tblEmpRequest', '', '2021-07-23 14:21:26', 'Added  PDS Update', 'Education;;University of Iloilo - PHINMA;0;2021;2021;36 units (CAR);;;N;Y;;;201 Education;2021-07-23;Filed Request;201;ADOF1-234-2004', '', '175.176.72.149');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('316', '1111', 'HR Module', 'tblempaccount', '', '2021-07-23 15:05:10', 'Edited phoeber User_account', 'ADOF1-234-2004;phoeber;1;0;;hr;123456', '', '175.176.72.149');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('317', '1111', 'HR Module', 'tblposition', '', '2021-07-24 13:03:59', 'Added  Administrative Assistant III Position', 'ADAS3-85-2004; Administrative Assistant III;ADAS3', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('318', '1111', 'HR Module', 'tblposition', '', '2021-07-24 13:05:27', 'Added  Administrative Aide VI (Driver II)  Position', 'ADA6-752-2014; Administrative Aide VI (Driver II) ;ADA6', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('319', '1111', 'HR Module', 'tblposition', '', '2021-07-24 13:07:46', 'Added  Senior Communications Development Officer Position', 'SRCDO-19-2014; Senior Communications Development Officer;SRCDO', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('320', '1111', 'HR Module', 'tblposition', '', '2021-07-24 13:08:18', 'Added Communication Development Officer II Position', 'COMDO2-17-2014;Communication Development Officer II;COMDO2', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('321', '1111', 'HR Module', 'tblposition', '', '2021-07-24 13:09:10', 'Added  Information Officer II  Position', 'INFO2-21-2014; Information Officer II ;INFO2', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('322', '1111', 'HR Module', 'tblposition', '', '2021-07-24 13:09:44', 'Added  Communication Development Officer I Position', 'COMDO1-20-2014; Communication Development Officer I;COMDO1', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('323', '1111', 'HR Module', 'tblposition', '', '2021-07-24 13:10:15', 'Added  Information Officer I  Position', 'INFO1-24-2014; Information Officer I ;INFO1', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('324', '1111', 'HR Module', 'tblposition', '', '2021-07-24 13:10:52', 'Added  Administrative Assistant II Position', 'ADAS2-242-2004; Administrative Assistant II;ADAS2', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('325', '1111', 'HR Module', 'tblplantillagroup', '', '2021-07-24 13:22:28', 'Edited Legal Division Plantilla Group', '418.0000;Legal Division;5', '', '124.106.87.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('326', '1111', 'HR Module', 'tblEmpRequest', '', '2021-07-26 20:44:25', 'Added sdasda Travel Order', 'sdasda;2021-07-26;2021-07-29;asdasd;;2021-07-26;Filed Request;TO;1111;[]', '', '49.145.59.161');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('327', '1111', 'HR Module', 'tblplantillagroup', '', '2021-08-01 09:49:50', 'Edited Legal Division Plantilla Group', '418.0000;Legal Division;5', '', '120.28.245.174');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('328', '1111', 'HR Module', 'tblplantillagroup', '', '2021-08-02 13:41:39', 'Edited Legal Division Plantilla Group', '418.0000;Legal Division;5', '', '120.28.245.174');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('329', '1111', 'HR Module', 'tblempaccount', '', '2021-08-03 09:34:54', 'Added RCablas User_account', 'ADAS1-173-2014;RCablas;21232f297a57a5a743894a0e4a801fc3;5;0;;employee;', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('330', '1111', 'HR Module', 'tblposition', '', '2021-08-03 13:09:46', 'Edited  Administrative Aide VI (Driver II)  Position', 'ADA6-752-2014; Administrative Aide VI (Driver II) ;ADA6', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('331', '1111', 'HR Module', 'tblplantillagroup', '', '2021-08-03 13:17:50', 'Edited Legal Division Plantilla Group', '418.0000;Legal Division;5', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('332', '1111', 'HR Module', 'tblplantillagroup', '', '2021-08-03 13:18:06', 'Edited Legal Division Plantilla Group', '418.0000;Legal Division;5', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('333', '1111', 'HR Module', 'tblEmpRequest', '', '2021-08-06 15:26:28', 'Added asasd Travel Order', 'asasd;2021-07-27;2021-08-02;asdasd;;2021-08-06;Filed Request;TO;1111;[]', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('334', '1111', 'HR Module', 'tblEmpRequest', '', '2021-08-07 20:50:42', 'Added asdasd Travel Order', 'asdasd;2021-08-19;2021-08-26;sdasd;;2021-08-07;Filed Request;TO;1111;[]', '', '49.145.62.229');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('335', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-08-12 11:33:56', 'Added OSEC-DENRB-CENRO-149 Personal Information', 'OSEC-DENRB-CENRO-149;;MANGLINONG;SALVADOR;CABUNAGAN;C;JR.;Filipino;1967-03-06;ST. PAULS HOSPITAL, ILOILO CITY;Female;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('336', '1111', 'HR Module', 'tblgroup4', '', '2021-08-12 11:35:52', 'Added PILOILO Org_structure', 'ORD;ARDMS;AD;PILOILO;PENRO ILOILO;OSEC-DENRB-CENRO-149;OIC - PENR OFFICER;ADA4-553-2004', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('337', '1111', 'HR Module', 'tblEmpPersonal', '', '2021-08-12 11:46:56', 'Added CRG1-284-1998 Personal Information', 'CRG1-284-1998;;AREVALO;CHRISTIAN ANGELO;ANDASAN;A;;Filipino;1986-06-06;SAN JOSE ANTIQUE;Male;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('338', '1111', 'HR Module', 'tblEmpRequest', '', '2021-09-14 13:55:18', 'Added asdasdasd Travel Order', 'asdasdasd;2021-09-01;2021-09-16;asdasdadad;;2021-09-14;Filed Request;TO;1111;[]', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('339', '1111', 'HR Module', 'tblposition', '', '2021-09-16 14:45:42', 'Edited  Administrative Aide VI (Driver II) a Position', 'ADA6-752-2014; Administrative Aide VI (Driver II) a;ADA6', '', '122.54.50.11');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('340', '1111', 'HR Module', 'tblposition', '', '2021-09-16 14:45:46', 'Edited  Administrative Aide VI (Driver II)  Position', 'ADA6-752-2014; Administrative Aide VI (Driver II) ;ADA6', '', '122.54.50.11');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('341', '1111', 'HR Module', 'tblCourse', '', '2021-09-16 14:46:07', 'Edited 4thYRBSCS Course', '4thYRBSCS;4th Year BS Computer Science', '', '122.54.50.11');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('342', '1111', 'HR Module', 'tblCourse', '', '2021-09-16 14:46:12', 'Edited 4thYRBSCS Course', '4thYRBSCS;4th Year BS Computer Sciencea', '', '122.54.50.11');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('343', '1111', 'HR Module', 'tblCourse', '', '2021-09-16 14:46:15', 'Edited 4thYRBSCS Course', '4thYRBSCS;4th Year BS Computer Science', '', '122.54.50.11');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('344', '1111', 'HR Module', 'tblempaccount', '', '2021-09-16 14:48:46', 'Edited kblogronio User_account', 'INFOSA2-98-2014;kblogronio;5;0;;employee;;21232f297a57a5a743894a0e4a801fc3', '', '122.54.50.11');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('345', 'INFOSA2-98-2014', 'HR Module', 'tblEmpRequest', '', '2021-09-16 14:49:42', 'Added Oton, Iloilo Travel Order', 'Oton, Iloilo;2021-09-20;2021-09-24;To obligate;;2021-09-16;Filed Request;TO;INFOSA2-98-2014;[]', '', '122.54.50.11');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('346', '1111', 'HR Module', 'tblposition', '', '2021-09-16 15:05:21', 'Edited  Administrative Aide VI (Driver II)  Position', 'ADA6-752-2014; Administrative Aide VI (Driver II) ;ADA6', '', '122.54.50.11');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('347', '1111', 'HR Module', 'tblposition', '', '2021-09-16 15:08:42', 'Deleted  Administrative Aide VI (Driver II)  Position', '4;ADA6-752-2014;ADA6; Administrative Aide VI (Driver II) ;;;;;', '', '122.54.50.11');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('348', '1111', 'HR Module', 'tblposition', '', '2021-09-16 15:08:50', 'Deleted  Administrative Assistant II Position', '10;ADAS2-242-2004;ADAS2; Administrative Assistant II;;;;;', '', '122.54.50.11');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('349', '1111', 'HR Module', 'tblEmpRequest', '', '2021-09-16 15:09:43', 'Added iiuuj Travel Order', 'iiuuj;2021-09-21;2021-09-25;lllll;;2021-09-16;Filed Request;TO;1111;[]', '', '122.54.50.11');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('350', '1111', 'HR Module', 'tblempaccount', '', '2021-09-16 15:12:32', 'Added smanglinong User_account', 'OSEC-DENRB-CENRO-149;smanglinong;4646912a90a13893fc9576a8444e6760;4;0;;executive;', '', '122.54.50.11');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('351', '1111', 'HR Module', 'tblposition', '', '2021-09-20 11:18:35', 'Added Provincial Environment & Natural Resources Officer Position', 'OSEC-DENRB-PENRO-33-1998;Provincial Environment & Natural Resources Officer;PENRO', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('352', '1111', 'HR Module', 'tblposition', '', '2021-09-20 11:18:57', 'Deleted Provincial Environment & Natural Resources Officer Position', '11;OSEC-DENRB-PENRO-33-;PENRO;Provincial Environment & Natural Resources Officer;;;;;', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('353', '1111', 'HR Module', 'tblposition', '', '2021-09-20 11:19:16', 'Added Provincial Environment & Natural Resources Officer Position', 'PENRO-33-1998;Provincial Environment & Natural Resources Officer;PENRO', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('354', '1111', 'HR Module', 'tblposition', '', '2021-09-20 11:19:31', 'Added  Administrative Assistant I (Computer Operator I) Position', 'ADAS1-178-2014; Administrative Assistant I (Computer Operator I);ADAS1', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('355', '1111', 'HR Module', 'tblposition', '', '2021-09-20 11:19:47', 'Added  Administrative Aide IV  Position', 'ADA4-553-2004; Administrative Aide IV ;ADA4', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('356', '1111', 'HR Module', 'tblposition', '', '2021-09-20 11:23:06', 'Added  Chief Administrative Officer  Position', 'CADOF-96-2014; Chief Administrative Officer ;CADOF', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('357', '1111', 'HR Module', 'tblposition', '', '2021-09-20 11:23:28', 'Added Accountant III  Position', 'A3-96-2014;Accountant III ;A3', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('358', '1111', 'HR Module', 'tblposition', '', '2021-09-20 11:24:30', 'Added Information Systems Analyst II Position', 'INFOSA2-98-2014;Information Systems Analyst II;INFOSA2', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('359', '1111', 'HR Module', 'tblposition', '', '2021-09-20 11:27:14', 'Added  Administrative Officer IV (Budget Officer II) Position', 'ADOF4-97-2014; Administrative Officer IV (Budget Officer II);ADOF4', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('360', '1111', 'HR Module', 'tblposition', '', '2021-09-20 11:27:37', 'Added Administrative Officer IV (HRMO II)  Position', 'ADOF4-165-2004;Administrative Officer IV (HRMO II) ;ADOF4', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('361', '1111', 'HR Module', 'tblposition', '', '2021-09-20 11:27:56', 'Added Planning Officer III  Position', 'PLO3-96-2014;Planning Officer III ;PLO3', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('362', '1111', 'HR Module', 'tblposition', '', '2021-09-20 11:28:16', 'Added Planning Officer II  Position', 'PLO2-74-2014;Planning Officer II ;PLO2', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('363', '1111', 'HR Module', 'tblposition', '', '2021-09-20 11:28:32', 'Added Planning Officer I Position', 'PLO1-76-2014;Planning Officer I;PLO1', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('364', '1111', 'HR Module', 'tblposition', '', '2021-09-20 11:28:58', 'Added Administrative Officer I (Supply Officer I)  Position', 'ADOF1-75-2014;Administrative Officer I (Supply Officer I) ;ADOF1', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('365', '1111', 'HR Module', 'tblposition', '', '2021-09-20 11:33:43', 'Added Administrative Officer I (Cashier I)  Position', 'ADOF1-240-2004;Administrative Officer I (Cashier I) ;ADOF1', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('366', '1111', 'HR Module', 'tblposition', '', '2021-09-20 11:34:02', 'Added Administrative Officer I (Records Officer I)  Position', 'ADOF1-243-2004;Administrative Officer I (Records Officer I) ;ADOF1', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('367', '1111', 'HR Module', 'tblposition', '', '2021-09-20 11:34:22', 'Added Administrative Assistant III (Computer Operator II) Position', 'ADAS3-101-2014;Administrative Assistant III (Computer Operator II);ADAS3', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('368', '1111', 'HR Module', 'tblposition', '', '2021-09-20 11:35:00', 'Added Administrative Assistant II (Senior Bookkeeper)  Position', 'ADAS2-61-2014;Administrative Assistant II (Senior Bookkeeper) ;ADAS2', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('369', '1111', 'HR Module', 'tblposition', '', '2021-09-20 11:35:17', 'Added Administrative Aide VI Position', 'ADA6-707-2014;Administrative Aide VI;ADA6', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('370', '1111', 'HR Module', 'tblposition', '', '2021-09-20 11:36:39', 'Added  Administrative Aide VI  Position', 'ADA6-708-2014; Administrative Aide VI ;ADA6', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('371', '1111', 'HR Module', 'tblposition', '', '2021-09-20 11:37:50', 'Added Development Management Officer V  Position', 'DMO5-134-2014;Development Management Officer V ;DMO5', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('372', '1111', 'HR Module', 'tblposition', '', '2021-09-20 11:39:40', 'Added Supervising  Ecosystems Management Specialist Position', 'SVEMS-207-2014;Supervising  Ecosystems Management Specialist;SVEMS', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('373', '1111', 'HR Module', 'tblposition', '', '2021-09-20 11:40:06', 'Added Development Management Officer III  Position', 'DMO3-289-2014;Development Management Officer III ;DMO3', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('374', '1111', 'HR Module', 'tblposition', '', '2021-09-20 11:40:30', 'Added  Development Management Officer III  Position', 'DMO3-290-2014; Development Management Officer III ;DMO3', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('375', '1111', 'HR Module', 'tblposition', '', '2021-09-20 14:53:58', 'Edited  Administrative Aide IV  Position', 'ADA4-553-2004-1010; Administrative Aide IV ;ADA4', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('376', '1111', 'HR Module', 'tblposition', '', '2021-09-20 15:01:20', 'Edited  Administrative Aide IV  Position', 'OSEC-DENRB-ADA4-553-2004; Administrative Aide IV ;ADA4', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('377', '1111', 'HR Module', 'tblposition', '', '2021-09-20 15:01:46', 'Edited  Administrative Aide IV  Position', 'ADA4-553-2014; Administrative Aide IV ;ADA4', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('378', '1111', 'HR Module', 'tblempaccount', '', '2021-09-29 10:04:08', 'Edited smanglinong User_account', 'OSEC-DENRB-CENRO-149;smanglinong;4;0;;executive;;21232f297a57a5a743894a0e4a801fc3', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('379', '1111', 'HR Module', 'tblplantillagroup', '', '2021-09-29 10:11:43', 'Edited Legal Division Plantilla Group', '418.0000;Legal Division;5', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('380', '1111', 'HR Module', 'tblplantillagroup', '', '2021-09-29 10:12:08', 'Edited Legal Division Plantilla Group', '418.0000;Legal Division;6', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('381', '1111', 'HR Module', 'tblposition', '', '2021-09-29 10:15:23', 'Deleted  Administrative Aide IV  Position', '14;ADA4-553-2014;ADA4; Administrative Aide IV ;;;;;', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('382', '1111', 'HR Module', 'tblposition', '', '2021-09-29 10:15:25', 'Deleted  Administrative Aide VI  Position', '29;ADA6-708-2014;ADA6; Administrative Aide VI ;;;;;', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('383', '1111', 'HR Module', 'tblposition', '', '2021-09-29 10:15:28', 'Deleted  Administrative Assistant I (Computer Operator I) Position', '13;ADAS1-178-2014;ADAS1; Administrative Assistant I (Computer Operator I);;;;;', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('384', '1111', 'HR Module', 'tblposition', '', '2021-09-29 10:15:30', 'Deleted  Administrative Assistant III Position', '3;ADAS3-85-2004;ADAS3; Administrative Assistant III;;;;;', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('385', '1111', 'HR Module', 'tblposition', '', '2021-09-29 10:15:35', 'Deleted  Administrative Officer IV (Budget Officer II) Position', '18;ADOF4-97-2014;ADOF4; Administrative Officer IV (Budget Officer II);;;;;', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('386', '1111', 'HR Module', 'tblposition', '', '2021-09-29 10:15:38', 'Deleted  Chief Administrative Officer  Position', '15;CADOF-96-2014;CADOF; Chief Administrative Officer ;;;;;', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('387', '1111', 'HR Module', 'tblposition', '', '2021-09-29 10:15:40', 'Deleted  Communication Development Officer I Position', '8;COMDO1-20-2014;COMDO1; Communication Development Officer I;;;;;', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('388', '1111', 'HR Module', 'tblposition', '', '2021-09-29 10:15:42', 'Deleted  Development Management Officer III  Position', '33;DMO3-290-2014;DMO3; Development Management Officer III ;;;;;', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('389', '1111', 'HR Module', 'tblposition', '', '2021-09-29 10:15:44', 'Deleted  Information Officer I  Position', '9;INFO1-24-2014;INFO1; Information Officer I ;;;;;', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('390', '1111', 'HR Module', 'tblposition', '', '2021-09-29 10:15:49', 'Deleted  Information Officer II  Position', '7;INFO2-21-2014;INFO2; Information Officer II ;;;;;', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('391', '1111', 'HR Module', 'tblposition', '', '2021-09-29 10:15:54', 'Deleted  Park Operation Superintendent IV  Position', '2;OSEC-DENRB-POS4-5-20;PA; Park Operation Superintendent IV ;;;;;', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('392', '1111', 'HR Module', 'tblposition', '', '2021-09-29 10:15:58', 'Deleted  Park Operation Superintendent V  Position', '1;OSEC-DENRB-POS5-5-20;OSEC-DENRB-POS5-5-2014; Park Operation Superintendent V ;;;;;', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('393', '1111', 'HR Module', 'tblposition', '', '2021-09-29 10:16:00', 'Deleted  Senior Communications Development Officer Position', '5;SRCDO-19-2014;SRCDO; Senior Communications Development Officer;;;;;', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('394', '1111', 'HR Module', 'tblposition', '', '2021-09-29 10:16:03', 'Deleted Accountant III  Position', '16;A3-96-2014;A3;Accountant III ;;;;;', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('395', '1111', 'HR Module', 'tblposition', '', '2021-09-29 10:16:05', 'Deleted Administrative Aide VI Position', '28;ADA6-707-2014;ADA6;Administrative Aide VI;;;;;', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('396', '1111', 'HR Module', 'tblposition', '', '2021-09-29 10:16:08', 'Deleted Administrative Assistant II (Senior Bookkeeper)  Position', '27;ADAS2-61-2014;ADAS2;Administrative Assistant II (Senior Bookkeeper) ;;;;;', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('397', '1111', 'HR Module', 'tblposition', '', '2021-09-29 10:16:11', 'Deleted Administrative Assistant III (Computer Operator II) Position', '26;ADAS3-101-2014;ADAS3;Administrative Assistant III (Computer Operator II);;;;;', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('398', '1111', 'HR Module', 'tblposition', '', '2021-09-29 10:16:15', 'Deleted Administrative Officer I (Cashier I)  Position', '24;ADOF1-240-2004;ADOF1;Administrative Officer I (Cashier I) ;;;;;', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('399', '1111', 'HR Module', 'tblposition', '', '2021-09-29 10:16:17', 'Deleted Administrative Officer I (Records Officer I)  Position', '25;ADOF1-243-2004;ADOF1;Administrative Officer I (Records Officer I) ;;;;;', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('400', '1111', 'HR Module', 'tblposition', '', '2021-09-29 10:16:20', 'Deleted Administrative Officer I (Supply Officer I)  Position', '23;ADOF1-75-2014;ADOF1;Administrative Officer I (Supply Officer I) ;;;;;', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('401', '1111', 'HR Module', 'tblposition', '', '2021-09-29 10:16:22', 'Deleted Administrative Officer IV (HRMO II)  Position', '19;ADOF4-165-2004;ADOF4;Administrative Officer IV (HRMO II) ;;;;;', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('402', '1111', 'HR Module', 'tblposition', '', '2021-09-29 10:16:23', 'Deleted Communication Development Officer II Position', '6;COMDO2-17-2014;COMDO2;Communication Development Officer II;;;;;', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('403', '1111', 'HR Module', 'tblposition', '', '2021-09-29 10:16:26', 'Deleted Development Management Officer III  Position', '32;DMO3-289-2014;DMO3;Development Management Officer III ;;;;;', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('404', '1111', 'HR Module', 'tblposition', '', '2021-09-29 10:16:30', 'Deleted Development Management Officer V  Position', '30;DMO5-134-2014;DMO5;Development Management Officer V ;;;;;', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('405', '1111', 'HR Module', 'tblposition', '', '2021-09-29 10:16:32', 'Deleted Information Systems Analyst II Position', '17;INFOSA2-98-2014;INFOSA2;Information Systems Analyst II;;;;;', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('406', '1111', 'HR Module', 'tblposition', '', '2021-09-29 10:16:35', 'Deleted Planning Officer I Position', '22;PLO1-76-2014;PLO1;Planning Officer I;;;;;', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('407', '1111', 'HR Module', 'tblposition', '', '2021-09-29 10:16:37', 'Deleted Planning Officer II  Position', '21;PLO2-74-2014;PLO2;Planning Officer II ;;;;;', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('408', '1111', 'HR Module', 'tblposition', '', '2021-09-29 10:16:38', 'Deleted Planning Officer III  Position', '20;PLO3-96-2014;PLO3;Planning Officer III ;;;;;', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('409', '1111', 'HR Module', 'tblposition', '', '2021-09-29 10:16:41', 'Deleted Provincial Environment & Natural Resources Officer Position', '12;PENRO-33-1998;PENRO;Provincial Environment & Natural Resources Officer;;;;;', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('410', '1111', 'HR Module', 'tblposition', '', '2021-09-29 10:16:43', 'Deleted Supervising  Ecosystems Management Specialist Position', '31;SVEMS-207-2014;SVEMS;Supervising  Ecosystems Management Specialist;;;;;', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('411', '1111', 'HR Module', 'tblSeparationCause', '', '2021-09-29 10:27:28', 'Added Permanent Employment Status', 'Permanent', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('412', '1111', 'HR Module', 'tblgroup5', '', '2021-09-29 10:29:20', 'Added CENRO_SARA Org_structure', 'ORD;ARDMS;AD;PILOILO;CENRO_SARA;COMMUNITY ENVIRONMENT & NATURAL RESOURCES OFFICE;POS4-5-2014;OIC - CENR Officer;INFOSA2-98-2014', '', '122.3.131.202');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('413', '1111', 'HR Module', 'tblRequestflow', '', '2021-10-14 10:15:22', 'Added TO Request', 'TO;ALLEMP;PILOILO;;RECOMMENDED;;CADOF-96-2014;APPROVED;;OSEC-DENRB-CENRO-149;APPROVED;;PENRO-33-1998;CERTIFIED;;PENRO-32-1998', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('414', '1111', 'HR Module', 'tblRequestflow', '', '2021-10-14 10:17:58', 'Added TO Request', 'TO;ALLEMP;PILOILO;INFOSA2-98-2014;RECOMMENDED;;CADOF-96-2014;APPROVED;;OSEC-DENRB-CENRO-149;APPROVED;;PENRO-33-1998;CERTIFIED;;PENRO-32-1998', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('415', 'INFOSA2-98-2014', 'HR Module', 'tblEmpRequest', '', '2021-10-14 10:22:17', 'Added CENRO Sara Travel Order', 'CENRO Sara;2021-10-18;2021-10-22;To fixed computer;;2021-10-14;Filed Request;TO;INFOSA2-98-2014;[]', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('416', '1111', 'HR Module', 'tblposition', '', '2021-10-14 10:34:45', 'Added Information System Analyst II Position', 'INFOSA2-2014-48;Information System Analyst II;ISA II', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('417', '1111', 'HR Module', 'tblposition', '', '2021-10-14 10:35:44', 'Edited Information System Analyst II Position', 'ISA II;Information System Analyst II;ISA II', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('418', '1111', 'HR Module', 'tblplantillagroup', '', '2021-10-14 10:38:15', 'Added PENRO ILOILO - MSD Plantilla Group', '418.2402;PENRO ILOILO - MSD;6', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('419', '1111', 'HR Module', 'tblplantilla', '', '2021-10-14 10:39:12', 'Added OSEC-DENRB-INFOSA2-98-2014 Plantilla', 'OSEC-DENRB-INFOSA2-98-2014;34;16;060;R;;;;;', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('420', '1111', 'HR Module', 'tblplantilla', '', '2021-10-14 10:40:46', 'Edited OSEC-DENRB-INFOSA2-98-2014 Plantilla', 'OSEC-DENRB-INFOSA2-98-2014;ISA II;16;060;R;;418.2402;;;', '', '122.54.50.10');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('421', '1111', 'HR Module', 'tblposition', '', '2024-08-30 12:05:06', 'Deleted Information System Analyst II Position', '34;ISA II;ISA II;Information System Analyst II;;;;;', '', '172.71.87.167');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('422', '1111', 'HR Module', 'tblplantilla', '', '2024-08-30 12:05:32', 'Deleted OSEC-DENRB-INFOSA2-98-2014 Plantilla', '1;OSEC-DENRB-INFOSA2-98-2014;ISA II;0.00;0.00;16;0;418.2402;;0;;0;0;0;;060;R;;;;;;;PENRO ILOILO - MSD', '', '172.71.87.167');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('423', '1111', 'HR Module', 'tblempaccount', '', '2024-08-30 12:06:57', 'Deleted smanglinong User_account', 'OSEC-DENRB-CENRO-149;smanglinong;21232f297a57a5a743894a0e4a801fc3;4;executive;;;;;0', '', '172.71.87.166');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('424', '1111', 'HR Module', 'tblempaccount', '', '2024-08-30 12:07:02', 'Deleted RCablas User_account', 'ADAS1-173-2014;RCablas;21232f297a57a5a743894a0e4a801fc3;5;employee;;;;;0', '', '172.71.87.166');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('425', '1111', 'HR Module', 'tblempaccount', '', '2024-08-30 12:07:07', 'Deleted empleon User_account', 'ATY5-8-1998;empleon;21232f297a57a5a743894a0e4a801fc3;3;officer;;;;;0', '', '172.71.87.166');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('426', '1111', 'HR Module', 'tblempaccount', '', '2024-08-30 12:07:11', 'Deleted duranl User_account', 'PENRO-32-1998;duranl;21232f297a57a5a743894a0e4a801fc3;4;executive;;;;;0', '', '172.71.87.166');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('427', '1111', 'HR Module', 'tblempaccount', '', '2024-08-30 12:07:15', 'Deleted federisoe User_account', 'CADOF-31-2004;federisoe;21232f297a57a5a743894a0e4a801fc3;3;officer;;;;;0', '', '172.71.87.166');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('428', '1111', 'HR Module', 'tblempaccount', '', '2024-08-30 12:07:19', 'Deleted kblogronio User_account', 'INFOSA2-98-2014;kblogronio;21232f297a57a5a743894a0e4a801fc3;5;employee;;;;;0', '', '172.71.87.166');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('429', '1111', 'HR Module', 'tblempaccount', '', '2024-08-30 12:07:24', 'Deleted phoeber User_account', 'ADOF1-234-2004;phoeber;21232f297a57a5a743894a0e4a801fc3;1;hr;123456;;;;0', '', '172.71.87.166');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('430', '1111', 'HR Module', 'tblempaccount', '', '2024-08-30 12:07:28', 'Deleted rjmiravalles User_account', 'ADOF4-158-2004;rjmiravalles;7ebe635f8b9dfc5760d15f97e3af130c;2;finance;01234;;;;0', '', '172.71.87.166');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('431', '1111', 'HR Module', 'tblgroup1', '', '2024-08-30 12:09:14', 'Deleted  Org_structure', '', '', '172.71.87.167');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('432', '1111', 'HR Module', 'tblgroup3', '', '2024-08-30 12:09:31', 'Deleted ED Org_structure', '', '', '172.71.87.167');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('433', '1111', 'HR Module', 'tblgroup3', '', '2024-08-30 12:09:36', 'Deleted LPDD Org_structure', '', '', '172.71.87.167');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('434', '1111', 'HR Module', 'tblgroup3', '', '2024-08-30 12:09:43', 'Deleted SMD Org_structure', '', '', '172.71.87.166');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('435', '1111', 'HR Module', 'tblgroup3', '', '2024-08-30 12:09:48', 'Deleted CDD Org_structure', '', '', '172.71.87.166');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('436', '1111', 'HR Module', 'tblgroup3', '', '2024-08-30 12:09:52', 'Deleted LD Org_structure', '', '', '172.71.87.166');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('437', '1111', 'HR Module', 'tblgroup3', '', '2024-08-30 12:09:57', 'Deleted AD Org_structure', '', '', '172.71.87.166');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('438', '1111', 'HR Module', 'tblgroup3', '', '2024-08-30 12:10:01', 'Deleted FD Org_structure', '', '', '172.71.87.166');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('439', '1111', 'HR Module', 'tblgroup3', '', '2024-08-30 12:10:05', 'Deleted PMD Org_structure', '', '', '172.71.87.166');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('440', '1111', 'HR Module', 'tblgroup2', '', '2024-08-30 12:10:10', 'Deleted  Org_structure', '', '', '172.71.87.166');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('441', '1111', 'HR Module', 'tblgroup2', '', '2024-08-30 12:10:13', 'Deleted  Org_structure', '', '', '172.71.87.166');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('442', '1111', 'HR Module', 'tblgroup1', '', '2024-08-30 12:10:38', 'Deleted  Org_structure', 'ORD;Office of the Regional Executive Director;;Regional Executive D;INFO2-21-2014;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '172.71.87.167');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('443', '1111', 'HR Module', 'tblagency', '', '2024-08-30 12:11:06', 'Edited MUNICIPAL GOVERNMENT OF PAETE | MISO Version 1.0 Agency_profile', 'MUNICIPAL GOVERNMENT OF PAETE | MISO Version 1.0;DENR-VI;VI;000535643036;Pepita Aquino Street, Port Area, Iloilo City;5000;(033) 329-4724;0;  r6@denr.gov.ph;www.denr.gov.ph;Bi-Monthly;00:00:00;00:00:00;0;0;00:00:00;0;1000021657;9;12;2-0496976000-2;100;100;2;5;50;50;0.00;142230100010;To mobilize our citizenry in protecting, conserving, and managing the environment and natural resources for the present and future generations.;A nation enjoying and sustaining its natural resources and a clean and healthy environment.;The Department is the primary agency responsible for the conservation, management, development, and proper use of the country’s environment and natural resources, specifically forest and grazing lands, mineral resources, including those in reservation and watershed areas, and lands of the public domain, as well as the licensing and regulation of all natural resources as may be provided for by law in order to ensure equitable sharing of the benefits derived therefrom for the welfare of the present and future generations of Filipinos.;LBP 3302 1038 51', '', '172.71.87.166');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('444', '1111', 'HR Module', 'tblEmpPersonal', '', '2024-08-30 14:26:50', 'Added PE-MGR020106 Personal Information', 'PE-MGR020106;;REYES;MARITESS;GUERRERO;;;Filipino;1985-09-10;Libmanan;Female;Single;2003954245;80;5.5;289990974;0;O+;0;121012199542;08-000090120-6;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0', '', '172.71.87.166');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('445', '1111', 'HR Module', 'tblgroup1', '', '2024-08-30 14:27:50', 'Added EXEC Org_structure', 'EXEC;Office of the Municipal Mayor;1111;Municipal Mayor;', '', '172.71.87.166');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('446', '1111', 'HR Module', 'tblgroup2', '', '2024-08-30 14:29:24', 'Added ADMIN Org_structure', 'EXEC;ADMIN;Administrative Services;1111;Administrative Services;', '', '172.71.87.166');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('447', '1111', 'HR Module', 'tblposition', '', '2024-08-30 14:30:13', 'Added Administrative Service Position', 'ADMIN;Administrative Service;AS', '', '172.71.87.167');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('448', '1111', 'HR Module', 'tblplantilla', '', '2024-08-30 14:30:57', 'Added PAE-HR-0061 Plantilla', 'PAE-HR-0061;ADMIN;11;060;R;;;;;', '', '172.71.87.147');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('449', '1111', 'HR Module', 'tblempaccount', '', '2024-08-30 14:32:30', 'Added maritess.reyes@paete.gov.ph User_account', 'PE-MGR020106;maritess.reyes@paete.gov.ph;2746572eeba12ed6d28751f24e6047cd;1;0;;hr;123456', '', '172.71.87.167');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('450', '1111', 'HR Module', 'tblempaccount', '', '2024-08-30 14:32:43', 'Edited maritess.reyes User_account', 'PE-MGR020106;maritess.reyes;1;0;;hr;123456', '', '172.71.87.166');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('451', '1111', 'HR Module', 'tblSalarySchedVersion', '', '2024-08-30 15:48:47', 'Added LBC 149-24 Annex A-6 Salary Schedule', 'LBC 149-24 Annex A-6;LBC 149-24 Annex A-6;2023-01-01', '', '172.71.87.197');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('452', '1111', 'HR Module', 'tblsalarysched', '', '2024-08-30 15:49:21', 'Edited  Salary Schedule', '9750', '', '172.71.87.197');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('453', '1111', 'HR Module', 'tblsalarysched', '', '2024-08-30 15:51:03', 'Added 7 Salary Schedule', '7;1;1;9750', '', '172.71.87.183');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('454', '1111', 'HR Module', 'tblCountrY', '', '2024-08-30 16:10:42', 'Added Philippines Country', 'Philippines;PH', '', '172.71.87.166');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('455', '1111', 'HR Module', 'tblEmpPersonal', '', '2024-08-31 02:34:23', 'Added EO-RQB0000 Personal Information', 'EO-RQB0000;;Cosico;Ronald;Bague;;;Filipino;;;Male;Married;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '172.71.87.146');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('456', '1111', 'HR Module', 'tblgroup1', '', '2024-08-31 02:34:42', 'Edited EXEC Org_structure', 'EXEC;Office of the Municipal Mayor;EO-RQB0000;Municipal Mayor;', '', '172.71.87.197');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('457', '1111', 'HR Module', 'tblEmpPersonal', '', '2024-08-31 02:35:13', 'Edited Cosico Personal', 'Hon.;Cosico;Ronald;Bague;;;Filipino;0000-00-00;;M;Married;;;0.00;0.00;;;;;;;;;;;;;;;;;;;0;0;;;;', '', '172.71.87.197');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('458', '1111', 'HR Module', 'tblempaccount', '', '2024-09-04 00:58:40', 'Added ronald.cosico@paete.gov.ph User_account', 'EO-RQB0000;ronald.cosico@paete.gov.ph;90ca772b7343dc2c37e76f217cc7608a;4;0;;executive;', '', '203.160.163.101');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('459', '1111', 'HR Module', 'tblEmpPersonal', '', '2024-09-04 03:27:50', 'Added PE-FND070117 Personal Information', 'PE-FND070117;;DELA ROSA;FRANK ALBERT;NAVARRO;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;', '', '203.160.163.101');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('460', '1111', 'HR Module', 'tblplantillagroup', '', '2024-09-04 03:36:44', 'Edited Legal Division Plantilla Group', '418.0000;Legal Division;', '', '203.160.163.101');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('461', '1111', 'HR Module', 'tblplantillagroup', '', '2024-09-04 03:37:27', 'Edited Legal Division Plantilla Group', '418.0000;Legal Division;12', '', '203.160.163.101');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('462', '1111', 'HR Module', 'tblposition', '', '2024-09-04 03:40:31', 'Added GENERAL ADMINISTRATIVE SERVICE Position', 'Administrative Aide I;GENERAL ADMINISTRATIVE SERVICE;AA-I', '', '203.160.163.101');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('463', '1111', 'HR Module', 'tblposition', '', '2024-09-04 03:42:37', 'Edited Administrative Officer II Position', 'AO-II;Administrative Officer II;AO-II', '', '203.160.163.101');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('464', '1111', 'HR Module', 'tblposition', '', '2024-09-04 03:43:15', 'Edited Administrative Aide I Position', 'AA-I;Administrative Aide I;AA-I', '', '203.160.163.101');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('465', '1111', 'HR Module', 'tblplantillagroup', '', '2024-09-04 04:31:00', 'Edited Legal Division Plantilla Group', '418.0000;Legal Division;', '', '203.160.163.101');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('466', '1111', 'HR Module', 'tblplantillagroup', '', '2024-09-04 04:31:04', 'Edited Legal Division Plantilla Group', '418.0000;Legal Division;', '', '203.160.163.101');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('467', '1111', 'HR Module', 'tblagency', '', '2024-09-04 20:27:57', 'Edited MUNICIPAL GOVERNMENT OF PAETE | MISO Version 1.0 Agency_profile', 'MUNICIPAL GOVERNMENT OF PAETE | MISO Version 1.0;LGU-PAETE;Calabarzon;000631660000;JV Quesada St. Municipal Building Paete, Laguna;4016;(049) 501-6475;0;info@paete.gov.ph;www.paete.gov.ph;Bi-Monthly;00:00:00;00:00:00;0;0;00:08:00;0;1000021657;9;12;2-0496976000-2;100;100;2;5;50;50;0.00;142230100010;To mobilize our citizenry in protecting, conserving, and managing the environment and natural resources for the present and future generations.;A nation enjoying and sustaining its natural resources and a clean and healthy environment.;The Department is the primary agency responsible for the conservation, management, development, and proper use of the country’s environment and natural resources, specifically forest and grazing lands, mineral resources, including those in reservation and watershed areas, and lands of the public domain, as well as the licensing and regulation of all natural resources as may be provided for by law in order to ensure equitable sharing of the benefits derived therefrom for the welfare of the present and future generations of Filipinos.;LBP 3302 1038 51', '', '162.158.179.119');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('468', '1111', 'HR Module', 'tblgroup1', '', '2024-09-04 20:30:48', 'Deleted  Org_structure', 'EXEC;Office of the Municipal Mayor;EO-RQB0000;Municipal Mayor;;;201;Cosico;Ronald;Bague;;;Hon.;M;Married;;;;;;;;;;;Filipino;;0;0000-00-00;;;0.00;0.00;;;;;;;;0;;;;;;;;;0;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;0000-00-00;;;0000-00-00;;;;;;', '', '172.68.225.237');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('469', '1111', 'HR Module', 'tblgroup1', '', '2024-09-04 20:31:36', 'Added LCEO Org_structure', 'LCEO;Office of the Municipal Mayor;EO-RQB0000;Municipal Mayor;', '', '172.71.210.88');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('470', '1111', 'HR Module', 'tblgroup2', '', '2024-09-04 20:32:05', 'Deleted  Org_structure', '', '', '172.71.210.88');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('471', '1111', 'HR Module', 'tblgroup2', '', '2024-09-04 20:33:01', 'Added GSO Org_structure', 'LCEO;GSO;General Services;EO-RQB0000;GSO Head;', '', '172.71.219.74');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('472', '1111', 'HR Module', 'tblEmpPersonal', '', '2024-09-04 21:59:51', 'Edited COSICO Personal', 'Hon.;COSICO;RONALD;BAGUE;;;Filipino;0000-00-00;;M;Married;;;0.00;0.00;;;;;;;;;;;;;;;;;;;0;0;;;;', '', '172.71.81.124');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('473', '1111', 'HR Module', 'tblempaccount', '', '2024-09-08 04:32:23', 'Edited admin@paete.gov.ph User_account', '1111;admin@paete.gov.ph;1;0;;hr;123456', '', '172.71.219.43');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('474', '1111', 'HR Module', 'tblsalarysched', '', '2024-09-08 04:45:32', 'Added 7 Salary Schedule', '7;1;2;9832', '', '172.70.207.133');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('475', '1111', 'HR Module', 'tblsalarysched', '', '2024-09-08 04:54:00', 'Edited 1 Salary Schedule', '9750', '', '162.158.114.23');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('476', '1111', 'HR Module', 'tblplantillagroup', '', '2024-09-08 05:22:25', 'Added GENERAL ADMINISTRATIVE SERVICE Plantilla Group', 'GAS;GENERAL ADMINISTRATIVE SERVICE;1', '', '172.71.210.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('477', '1111', 'HR Module', 'tblplantillagroup', '', '2024-09-08 05:22:47', 'Edited GENERAL ADMINISTRATIVE SERVICE Plantilla Group', 'GAS;GENERAL ADMINISTRATIVE SERVICE;0', '', '172.71.210.219');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('478', '1111', 'HR Module', 'tblplantillagroup', '', '2024-09-08 05:24:06', 'Added FINANCIAL SERVICE Plantilla Group', 'FS;FINANCIAL SERVICE;2', '', '172.71.210.218');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('479', '1111', 'HR Module', 'tblplantillagroup', '', '2024-09-08 05:26:31', 'Added GENERAL ADMINISTRATIVE SERVICE Plantilla Group', 'GAS;GENERAL ADMINISTRATIVE SERVICE;0', '', '162.158.114.97');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('480', '1111', 'HR Module', 'tblplantillagroup', '', '2024-09-08 05:28:49', 'Added GENERAL ADMINISTRATIVE SERVICE Plantilla Group', 'GAS;GENERAL ADMINISTRATIVE SERVICE;0', '', '162.158.114.97');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('481', '1111', 'HR Module', 'tblplantillagroup', '', '2024-09-08 05:29:05', 'Edited GENERAL ADMINISTRATIVE SERVICE Plantilla Group', 'GAS;GENERAL ADMINISTRATIVE SERVICE;1', '', '162.158.114.96');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('482', '1111', 'HR Module', 'tblplantillagroup', '', '2024-09-08 05:29:41', 'Added FINANCIAL SERVICE Plantilla Group', 'FS;FINANCIAL SERVICE;2', '', '162.158.114.96');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('483', '1111', 'HR Module', 'tblplantillagroup', '', '2024-09-08 05:30:17', 'Added PLANNING SERVICE Plantilla Group', 'PS;PLANNING SERVICE;3', '', '162.158.114.97');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('484', '1111', 'HR Module', 'tblplantillagroup', '', '2024-09-08 05:30:45', 'Added TRANSPORTATION, COMMUNICATION AND PUBLIC UTILITIES SERVICE Plantilla Group', 'TCPUS;TRANSPORTATION, COMMUNICATION AND PUBLIC UTILITIES SERVICE;4', '', '162.158.114.97');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('485', '1111', 'HR Module', 'tblplantilla', '', '2024-09-08 05:32:07', 'Edited PAE-HR-0061 Plantilla', 'PAE-HR-0061;AO-II;11;060;R;CSP;GAS;;;', '', '162.158.187.55');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('486', '1111', 'HR Module', 'tblposition', '', '2024-09-08 05:32:32', 'Edited Administrative Officer II Position', 'AO-II;Administrative Officer II;AO-II', '', '162.158.187.55');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('487', '1111', 'HR Module', 'tblplantillagroup', '', '2024-09-08 06:02:18', 'Added GENERAL ADMINISTRATIVE SERVICE Plantilla Group', 'GAS;GENERAL ADMINISTRATIVE SERVICE;', '', '172.71.211.24');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('488', '1111', 'HR Module', 'tblplantillagroup', '', '2024-09-08 06:05:46', 'Edited GENERAL ADMINISTRATIVE SERVICE Plantilla Group', 'GAS;GENERAL ADMINISTRATIVE SERVICE;1', '', '172.71.215.70');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('489', '1111', 'HR Module', 'tblplantillagroup', '', '2024-09-08 06:06:07', 'Added FINANCIAL SERVICE Plantilla Group', 'FS;FINANCIAL SERVICE;2', '', '172.71.215.70');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('490', '1111', 'HR Module', 'tblplantilla', '', '2024-09-08 06:06:43', 'Edited PAE-HR-0061 Plantilla', 'PAE-HR-0061;AO-II;11;;;CSP;GAS;;;', '', '172.71.215.70');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('491', '1111', 'HR Module', 'tblplantilla', '', '2024-09-08 06:08:30', 'Edited PAE-HR-0061 Plantilla', 'PAE-HR-0061;AO-II;14;060;R;CSP;GAS;;;', '', '172.70.207.175');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('492', '1111', 'HR Module', 'tblplantilla', '', '2024-09-08 06:08:39', 'Edited PAE-HR-0061 Plantilla', 'PAE-HR-0061;AO-II;11;060;R;CSP;GAS;;;', '', '172.70.207.175');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('493', '1111', 'HR Module', 'tblplantilla', '', '2024-09-08 06:11:14', 'Edited PAE-HR-0061 Plantilla', 'PAE-HR-0061;AO-II;11;060;R;CSP;GAS;;;', '', '172.71.214.22');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('494', '1111', 'HR Module', 'tblplantilla', '', '2024-09-08 06:11:21', 'Deleted PAE-HR-0061 Plantilla', '2;PAE-HR-0061;AO-II;0.00;0.00;11;0;GAS;;0;;0;0;0;;060;R;CSP;;;;;Administrative Officer II;GENERAL ADMINISTRATIVE SERVICE', '', '172.71.214.22');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('495', '1111', 'HR Module', 'tblplantilla', '', '2024-09-08 06:12:05', 'Added PAE-HR-062 Plantilla', 'PAE-HR-062;AO-II;11;060;R;;1;;;', '', '172.70.207.175');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('496', '1111', 'HR Module', 'tblgroup1', '', '2024-09-08 08:26:58', 'Added HRMO Org_structure', 'HRMO;Human Resources Management Office;PE-MGR020106;HRMO;', '', '172.71.218.68');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('497', '1111', 'HR Module', 'tblempaccount', '', '2024-09-08 10:40:03', 'Added frank.delarosa@paete.gov.ph User_account', 'PE-FND070117;frank.delarosa@paete.gov.ph;a7070cd4e44379cb4f5d2ee11b00f225;1;0;;hr;123456', '', '172.71.210.158');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('498', '1111', 'HR Module', 'tblempaccount', '', '2024-09-08 10:40:14', 'Edited ronald.cosico@paete. User_account', 'EO-RQB0000;ronald.cosico@paete.;3;0;;officer;', '', '172.71.210.158');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('499', '1111', 'HR Module', 'tblempaccount', '', '2024-09-08 10:43:36', 'Edited frank.delarosa User_account', 'PE-FND070117;frank.delarosa;1;0;;hr;123456', '', '172.71.218.174');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('500', 'PE-FND070117', 'HR Module', 'tblposition', '', '2024-09-08 10:44:49', 'Added Administrative Assistant I Position', 'ADA-1;Administrative Assistant I;ADA-1', '', '172.71.218.175');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('501', 'PE-FND070117', 'HR Module', 'tblplantilla', '', '2024-09-08 10:45:20', 'Added PAE-MO-007 Plantilla', 'PAE-MO-007;ADA-1;7;060;R;;1;;;', '', '172.71.218.175');
INSERT INTO `tblChangeLog` (`changeLogId`, `empNumber`, `module`, `tablename`, `databaseevent`, `date_time`, `description`, `data`, `data2`, `ip`) VALUES ('502', 'PE-FND070117', 'HR Module', 'tblplantilla', '', '2024-09-08 10:49:25', 'Edited PAE-HR-062 Plantilla', 'PAE-HR-062;AO-II;11;060;R;CSE-2;GAS;;;', '', '172.69.33.222');


#
# TABLE STRUCTURE FOR: tblComputation
#

DROP TABLE IF EXISTS `tblComputation`;

CREATE TABLE `tblComputation` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `fk_id` int(5) NOT NULL DEFAULT 0,
  `empNumber` varchar(30) NOT NULL DEFAULT '',
  `code` varchar(20) NOT NULL DEFAULT '0',
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblComputationDetails
#

DROP TABLE IF EXISTS `tblComputationDetails`;

CREATE TABLE `tblComputationDetails` (
  `fk_id` int(5) NOT NULL DEFAULT 0,
  `empNumber` varchar(20) NOT NULL DEFAULT '',
  `periodMonth` int(2) NOT NULL DEFAULT 0,
  `periodYear` year(4) NOT NULL DEFAULT 0000,
  `workingDays` int(2) NOT NULL DEFAULT 0,
  `nodaysPresent` int(2) NOT NULL DEFAULT 0,
  `nodaysAbsent` int(2) NOT NULL DEFAULT 0,
  `hazardCode` varchar(20) NOT NULL DEFAULT '',
  `hazard` decimal(10,2) NOT NULL DEFAULT 0.00,
  `laundryCode` varchar(20) NOT NULL DEFAULT '',
  `laundry` decimal(10,2) NOT NULL DEFAULT 0.00,
  `subsisCode` varchar(20) NOT NULL DEFAULT '',
  `subsistence` decimal(10,2) NOT NULL DEFAULT 0.00,
  `salaryCode` varchar(20) NOT NULL DEFAULT '',
  `salary` decimal(10,2) NOT NULL DEFAULT 0.00,
  `longi` decimal(10,2) NOT NULL DEFAULT 0.00,
  `ra` decimal(10,2) NOT NULL DEFAULT 0.00,
  `ta` decimal(10,2) NOT NULL DEFAULT 0.00,
  `hpFactor` int(2) NOT NULL DEFAULT 0,
  `ctr_8h` int(11) NOT NULL DEFAULT 0,
  `ctr_6h` int(11) NOT NULL DEFAULT 0,
  `ctr_5h` int(11) NOT NULL DEFAULT 0,
  `ctr_4h` int(11) NOT NULL DEFAULT 0,
  `ctr_wmeal` int(11) NOT NULL DEFAULT 0,
  `ctr_diem` decimal(10,2) NOT NULL DEFAULT 0.00,
  `ctr_laundry` int(11) NOT NULL DEFAULT 0,
  `rataAmount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `rataVehicle` char(1) NOT NULL DEFAULT '',
  `rataCode` varchar(10) NOT NULL DEFAULT '',
  `daysWithVehicle` int(2) NOT NULL DEFAULT 0,
  `raPercent` int(2) NOT NULL DEFAULT 0,
  `taPercent` int(2) NOT NULL DEFAULT 0,
  `latest` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblComputationDetails_03012017
#

DROP TABLE IF EXISTS `tblComputationDetails_03012017`;

CREATE TABLE `tblComputationDetails_03012017` (
  `fk_id` int(5) NOT NULL DEFAULT 0,
  `empNumber` varchar(20) NOT NULL DEFAULT '',
  `periodMonth` int(2) NOT NULL DEFAULT 0,
  `periodYear` year(4) NOT NULL DEFAULT 0000,
  `workingDays` int(2) NOT NULL DEFAULT 0,
  `nodaysPresent` int(2) NOT NULL DEFAULT 0,
  `nodaysAbsent` int(2) NOT NULL DEFAULT 0,
  `hazardCode` varchar(20) NOT NULL DEFAULT '',
  `hazard` decimal(10,2) NOT NULL DEFAULT 0.00,
  `laundryCode` varchar(20) NOT NULL DEFAULT '',
  `laundry` decimal(10,2) NOT NULL DEFAULT 0.00,
  `subsisCode` varchar(20) NOT NULL DEFAULT '',
  `subsistence` decimal(10,2) NOT NULL DEFAULT 0.00,
  `salaryCode` varchar(20) NOT NULL DEFAULT '',
  `salary` decimal(10,2) NOT NULL DEFAULT 0.00,
  `longi` decimal(10,2) NOT NULL DEFAULT 0.00,
  `ra` decimal(10,2) NOT NULL DEFAULT 0.00,
  `ta` decimal(10,2) NOT NULL DEFAULT 0.00,
  `hpFactor` int(2) NOT NULL DEFAULT 0,
  `ctr_8h` int(11) NOT NULL DEFAULT 0,
  `ctr_6h` int(11) NOT NULL DEFAULT 0,
  `ctr_5h` int(11) NOT NULL DEFAULT 0,
  `ctr_4h` int(11) NOT NULL DEFAULT 0,
  `ctr_wmeal` int(11) NOT NULL DEFAULT 0,
  `ctr_diem` decimal(10,2) NOT NULL DEFAULT 0.00,
  `ctr_laundry` int(11) NOT NULL DEFAULT 0,
  `rataAmount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `rataVehicle` char(1) NOT NULL DEFAULT '',
  `rataCode` varchar(10) NOT NULL DEFAULT '',
  `daysWithVehicle` int(2) NOT NULL DEFAULT 0,
  `raPercent` int(2) NOT NULL DEFAULT 0,
  `taPercent` int(2) NOT NULL DEFAULT 0,
  `latest` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblComputationInstance
#

DROP TABLE IF EXISTS `tblComputationInstance`;

CREATE TABLE `tblComputationInstance` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `month` int(2) NOT NULL DEFAULT 0,
  `year` int(4) NOT NULL DEFAULT 0,
  `appointmentCode` varchar(20) NOT NULL DEFAULT '',
  `pmonth` int(2) NOT NULL DEFAULT 0,
  `pyear` int(4) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 0,
  `totalNumDays` int(11) NOT NULL DEFAULT 0,
  `processed` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblContact
#

DROP TABLE IF EXISTS `tblContact`;

CREATE TABLE `tblContact` (
  `agencyCode` varchar(10) NOT NULL DEFAULT '',
  `agency` varchar(255) NOT NULL DEFAULT '',
  `firstname` varchar(50) NOT NULL DEFAULT '',
  `middleInitial` char(1) NOT NULL DEFAULT '',
  `surname` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(5) NOT NULL DEFAULT '',
  `position` varchar(255) NOT NULL DEFAULT '',
  `address` text NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`agencyCode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblCountry
#

DROP TABLE IF EXISTS `tblCountry`;

CREATE TABLE `tblCountry` (
  `countryId` int(11) NOT NULL AUTO_INCREMENT,
  `countryName` varchar(100) NOT NULL,
  `countryCode` varchar(80) NOT NULL,
  PRIMARY KEY (`countryId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblCountry` (`countryId`, `countryName`, `countryCode`) VALUES ('1', 'Philippines', 'PH');


#
# TABLE STRUCTURE FOR: tblCourse
#

DROP TABLE IF EXISTS `tblCourse`;

CREATE TABLE `tblCourse` (
  `courseId` int(11) NOT NULL AUTO_INCREMENT,
  `courseCode` varchar(10) NOT NULL DEFAULT '',
  `courseDesc` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`courseId`)
) ENGINE=MyISAM AUTO_INCREMENT=262 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('1', 'BS ChE', 'BS Chemical Engineering');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('2', 'MS ChE', 'Master of Science in Chemical Engineering');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('3', 'PhD ChE', 'Doctor of Philosophy in Chemical Engineering');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('4', 'MIM', 'Master in Information Management');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('5', 'BLAW', 'Bachelor of Laws');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('6', 'MLAW', 'Master of Laws');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('7', 'BBUSAD', 'BS Business Administration');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('8', 'PRIM', 'Elementary');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('9', 'SEC', 'Secretarial');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('10', 'BS BIOCHEM', 'BS Bio-chemistry');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('11', 'MSH', 'Master of Science in Horticulture');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('12', 'PhD BM', 'Doctor of Business Management');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('13', 'AB Eco.', 'Liberal of Arts Major in Economics');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('14', 'MA Eco.', 'Master of Arts in Ecomics');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('15', 'MNSA', 'Master of National Security Administration');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('16', 'MBM', 'Master in  Business Management');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('17', 'BS Geo', 'BS Geology');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('18', 'MS Geo', 'Master of Science in Geology');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('19', 'PhD Geo', ' Doctor of Geometry');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('20', 'PhDG', 'Doctor of Science in Geology');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('21', 'BS IT', 'BS Information Technology');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('22', 'BS ComSci', 'BS Computer Science');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('23', 'BBM', 'Bachelor of Business Management');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('24', 'MPA', 'Master in Public Administration');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('25', 'MBA', 'Master in  Business Administration');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('26', 'ComP', 'Computer Programming');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('27', 'BS Bio', 'BS Biology');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('28', 'MS Bio', 'Master of Science in Biology');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('29', 'BSS', 'BS Statistics');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('30', 'BSC', 'BS Commerce');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('31', 'BS Eco', 'BS Economics');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('32', 'BS CE', 'BS Civil Engineering');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('33', 'BS DC', 'BS Development Communication');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('34', 'Comm', 'Commerce');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('35', 'BBA', 'Bachelor of Business Administration major in Acctg');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('36', 'BOA', 'Bachelor in Office Administration');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('37', 'BSC Acc', 'BSC Accounting');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('38', 'BS CBM', 'BS Commerce - Business Management');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('39', 'BSCoE', 'BS Computer Engineering');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('40', 'MCS', 'Master in Computer Science');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('41', 'PhD Tech', 'Doctor of Technology');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('42', 'BSFN', 'BS Food and Nutrition');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('43', 'MBE', 'Master in Business Education');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('44', 'BSEED', 'BS Elementary Education');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('45', '', '');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('46', 'Pub Admin', 'Public Administration');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('47', 'BS Agr', 'BS Agriculture');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('48', 'Edu', 'Education');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('49', 'MPS', 'M.A. Political Science');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('50', 'ABE', 'AB Economics');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('51', 'BSie', 'BS Industrial Education');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('52', 'CSPE', 'Civil Service Prof. Exam');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('53', 'MSM', 'Master of Science in Marketing');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('54', 'ME', 'Masters in Engineering');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('55', 'MCE', 'Major in Chemical Engineering');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('56', 'IS', 'International Studies');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('57', 'LA', 'Liberal Arts');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('58', 'BTTEMFSM', 'Bachelor of Technical Teacher Educ. Major in FSM');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('59', 'MMPA', 'Master in management(Public Administration)');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('60', 'BBAMA', 'BS Business Administration Major in Accounting');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('61', 'CST', 'Computer Science Technology');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('62', 'GradCertBI', 'Graduate Cert. Course in Business Intelligence');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('63', 'GradCertKM', 'Graduate Cert. Course in Knowledge Management');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('64', 'DipSIM', 'Diploma Course in Strategic Information Management');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('65', 'MEC', 'Master of Engineering Major in Chem. Engineering');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('66', 'MProfS', 'Master of Professional Studies');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('67', 'MIS', 'Master in Information Systems');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('68', 'CETech', 'Computer Engineering Technology');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('69', 'BEng', 'Bachelor of Engineering');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('70', 'BSEnviSci', 'BS Environmental Science');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('71', 'MC', 'Masters in Community');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('72', 'ABComArts', 'AB Communication Arts Major in Advertising & PR');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('73', 'MA GovM', 'Master in Government Management');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('74', 'BSNutD', 'BS Nutrition and Dietetics');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('75', 'MSSci', 'MS Computer Science');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('76', 'BSCAd', 'BSC Advertising');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('77', 'MPS Food', 'MPS in Food and Nutrition Planning');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('78', 'BSBA AC', 'BS Business Administration - Accounting');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('79', 'BS ME', 'BS Mechanical Engineering');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('80', 'Math', 'BS Math');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('81', 'AB Hum', 'AB Humanities w/ Prof. Cert. in Pol. Econ.');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('82', 'PG DipMan', 'Post Graduate Diploma in Management');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('83', 'BAc', 'BS Accountancy');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('84', 'MABA', 'Master of Arts in Business Administration');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('85', 'PhD Co', 'PhD Commerce');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('86', 'IndusElec', 'Industrial Electricity');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('87', 'MPM', 'Master in Public Management');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('88', 'MSBio', 'MS Biology');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('89', 'MTechMan', 'Masters in Technology Management');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('90', 'ComCourse', 'Computer Courses from Basic to Programming');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('91', 'BS AeEng', 'BS Aerospace Engineering');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('92', 'PSTUD', 'AB Phil Studies');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('93', 'STENO', 'STENO-TYPING COURSE');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('94', 'BSC-M', 'BS Commerce Major in Management');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('95', 'GRCC', 'Government Radio Communications Certificate');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('96', 'MGA-PA', 'Master in Govt Admin Major in Public Admin');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('97', 'DPA', 'Doctor of Public Administration');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('98', 'BSElec', 'BS Electrical Engineering');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('99', 'MSElec', 'Master of Science in Electrical Engineering');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('100', 'MPM-TED', 'Masters in Public Management Tech. Enterprise Devt');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('101', 'PhDTM', 'PH.D. in Technology Management');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('102', 'DPM', 'Doctor of Public Management');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('103', 'Vocational', 'Basic Scriptwriting Course');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('104', 'ACS', 'Associate in Computer Science');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('105', '4thYRBSCS', '4th Year BS Computer Science');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('106', 'BBM-MBA', 'BBM-MBA');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('107', 'SAD', 'Systems Analysis and Design');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('108', 'BProg', 'Basic Programming');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('109', 'COBOL', 'COBOL Programming');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('110', 'FlowPro', 'Flowcharting Proficiency');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('111', 'EDP', 'Basic EDP Concepts');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('112', 'MCD', 'Masters in Community Development');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('113', '2nd', 'Secondary');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('114', 'BArt', 'Bachelor of Arts');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('115', 'BSCBF', 'BSC Major in Banking and Finance');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('116', 'D.P.A.', 'Doctor in Public Administration');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('117', 'Primary', 'Primary');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('118', 'BSFS', 'BS Foreign Service');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('119', 'MSSD', 'M.S. Social Development');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('120', 'BType', 'Basic Typing');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('121', 'MAMSMAM', 'Master of Management in Agribusiness Management');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('122', 'BSIndTech', 'BS Industrial Technology');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('123', 'BSBA-Mgmt', 'BSBA Management');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('124', 'ABPolScie', 'AB Political Science');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('125', 'LIACOM', 'Liberal Arts and Commerce-Mgmt. and Economics');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('126', 'LI.B', 'LI.B');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('127', 'AB-G', 'AB-General');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('128', 'BSN', 'BS Nursing');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('129', 'ZMZ', 'BS Zoology Major in Marine Zoology');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('130', 'FA', 'MS Fisheries Major Aquaculture');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('131', 'PhFS', 'Ph.D. Fisheries Science');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('132', 'MSME', 'Master of Science in Mechanical Engineering');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('133', 'HDIT', 'Honors Diploma in Information Technology');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('134', 'BSEE', 'BS Electronics Engineering');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('135', 'MSMGE', 'Master of Science in Management Engineering');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('136', 'BSECE', 'BS Electronics and Communications Engineering');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('137', 'BSCH', 'BS Chemistry');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('138', 'MSCH', 'Master of Science in Chemistry');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('139', 'PhDCH', 'Doctor of Philosophy in Chemistry');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('140', 'CTech', 'Computer Technician');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('141', 'ABBA', 'Bachelor of Arts in Communication Arts');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('142', 'MAS', 'Master of Arts in Sociology');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('143', 'BSFT', 'BS Food Technology');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('144', 'BSAP', 'BS Applied Physics');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('145', 'JD', 'Juris Doctor');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('146', 'LLMIELPO', 'LL.M. IELPO Course');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('147', 'GIP', 'General Intellectual Property Couse');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('148', 'BSP', 'BS Physics');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('149', 'BSA', 'BS Agriculture');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('150', 'MSA', 'Master of Science in Agriculture');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('151', 'BSICS', 'BS Information and Computer Science');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('152', 'BSOM', 'BS Office Management');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('153', 'BSPSY', 'BS Psychology');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('154', 'BAOABA', 'B.S. in Office Admin. Major in Busines Admin.');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('155', 'ABDC', 'Bachelor of Arts in Development Communication');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('156', 'CG', 'Caregiver');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('157', 'BBF', 'Bachelor in Banking and Finance');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('158', 'CET', 'Computer Electronic Technician');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('159', 'MIT', 'Master in Information Technology');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('160', 'BSCCS', 'BS Computing Major in Computer Science');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('161', 'COMPST', 'Computer Software Technology');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('162', 'ABENTRE', 'Bachelor of Arts in Entrepreneurship');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('163', 'ABL', 'Bachelor of Arts in Literature');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('164', 'BSBAM', 'BS Business Management Major in Management');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('165', 'MMGT', 'Master in Management');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('166', 'CTP', 'Certificate in Teaching Program');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('167', 'CSA', 'Computer Secretarial Administration');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('168', 'COMPSEC', 'Computer Secretarial');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('169', 'ELEC', 'Electronics');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('170', 'TM', 'Television Mechanics');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('171', 'JAP', 'Japanese Language');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('172', 'BSBAA', 'BS Business Administration and Accounting');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('173', 'MSIM', 'Master of Science in Information Management');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('174', 'BSED', 'Bachelor of Secondary Education');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('175', 'BSCBA', 'BS Commerce Major in Business Administration');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('176', 'BA', 'Journalism');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('177', 'BS PT', 'BS Physical Therapy');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('178', 'OM', 'Office Management');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('179', 'BOIS', 'Diploma in Business Office Information System');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('180', 'BS CBF', 'BS Commerce - Banking and Finance');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('181', 'BS BCA', 'BS Brodcast Arts');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('182', 'ICT', 'Information Communication Technology');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('183', 'ABComm', 'AB Communication');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('184', 'BS Crim', 'BS Criminology');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('185', 'MSAc', 'Master of Science in Accountancy');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('186', 'BSBMGMT', 'BS Business Management Major in Marketing');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('187', 'BSBAMM', 'BS Business Management Major in Marketing Mgmt');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('188', 'BSBE', 'BS Business Economics');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('189', 'BSAM', 'BS Applied Math');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('190', 'ABSComm', 'Bachelor of Arts in Speech Communication');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('191', 'MASPED', 'Master of Arts in Special Education');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('192', 'BJourn', 'Bachelor in Journalism');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('193', 'DRSM', 'Dressmaking');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('194', 'BSBAMgmt', 'BS Business Administration Major in Management');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('195', 'BSF', 'BS Forestry');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('196', 'MMDM', 'Master in Management in Development Management');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('197', 'BSG', 'BS Geography');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('198', 'BASocSci', 'BA Social Sciences');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('199', 'BASocio', 'BA Sociology');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('200', 'BSME', 'BS Mechanical Engineering');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('201', 'BAcctg', 'Bachelor in Accounting');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('202', 'BSBAMktg', 'BS Business Administration Major in Marketing');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('203', 'MTM', 'Masters in Technology Management');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('204', 'BSMSE', 'BS Materials Science and Engineering');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('205', 'HGM', 'Housekeeping and Guestroom Maintenance');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('206', 'BAIS', 'Bachelor of Arts in International Studies');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('207', 'DHRM', 'Diploma of Science in Hotel and Restaurant Mgmt');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('208', 'MT', 'Mechanical Technology');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('209', 'RAT', 'Refrigeration and Aircon Technician');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('210', 'BSMM', 'BS Marketing Management');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('211', 'JL', 'Japanese Language');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('212', 'BSHRM', 'BS Hotel and Restaurant Management');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('213', 'BSHRS', 'BS Hotel and Restaurant Services');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('214', 'BSBAMMgt', 'BS Business Administration Major in Marketing Mgmt');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('215', 'BC', 'Basic Computer');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('216', 'BSAdmin', 'BS Administration');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('217', 'BSEduc', 'BS Education');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('218', 'TD', 'Technical Drawing');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('219', 'ECT', 'Electronics Communication Technician');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('220', 'MStat', 'Master of Statistics');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('221', 'BSMedTech', 'BS Medical Technology');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('222', 'MPH', 'Master in Public Health');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('223', 'MSNut', 'MS Nutrition');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('224', 'DAppNut', 'Diploma in Applied Nutrition');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('225', 'PhDN', 'Ph.D. Nutrition');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('226', 'AAS', 'Associate in Arts - Secretarial Course');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('227', 'BSCA', 'BS Commerce - Accounting');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('228', 'CompTech', 'Computer Technology');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('229', 'BSM', 'BS Management');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('230', 'ABP', 'AB Psychology');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('231', 'BS EM', 'BS Entrepreneural Management');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('232', 'DIT', 'Diploma in Information Technology');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('233', 'BSAT', 'BS Accounting Technology');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('234', 'BS IS', 'BS Information System');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('235', 'ADC', 'Advanced Diploma in Computing');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('236', 'BSAE', 'Bachelor of Science in Agricultural Engineering');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('237', 'MSCE', 'Master in Civil Engineer');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('238', 'Phd', 'Phd');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('239', 'MS', 'MS');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('240', 'PhDEnvEng', 'PhD Environmental Engineering');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('241', 'BSIEn', 'BS Industrial Engineering');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('242', 'AT', 'Automotive Technology');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('243', 'ASNCII', 'Automotive Servicing NC II');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('244', 'MScEE', 'MSc Environmental Engineering');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('245', 'BSSC', 'BS Sociology ');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('246', 'MSMF', 'MS Marine Fisheries');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('247', 'BSAEc', 'Bachelor of Science in Agricultural Economics');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('248', 'MAP', 'MA Philosophy');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('249', 'AB PHI', 'AB Philosophy');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('250', 'CETech.', 'Civil Engineering Technology');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('251', 'BSTTM', 'Bachelor of Science Travel and Tourism Management');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('252', 'PM', 'Public Management');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('253', 'MATV', 'Master of Art in Teaching Vocational');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('254', 'BSIM', ' BS Information Management');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('255', 'BIM', 'Business Information Management');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('256', 'BSAgr', 'BS Agronomy');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('257', 'MSIFS', 'Master of Science in food Science');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('258', 'B PE Maj', 'B in P.E. Major in Sports and Wellness Mgt.');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('259', 'MaTechMgt', 'Masters in Technology Management');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('260', 'EIM', 'Electrical Installation and Maintenance NCII');
INSERT INTO `tblCourse` (`courseId`, `courseCode`, `courseDesc`) VALUES ('261', 'BSFAgro', 'Bachelor of Science in Forestry Major in Agrofores');


#
# TABLE STRUCTURE FOR: tblCustodian
#

DROP TABLE IF EXISTS `tblCustodian`;

CREATE TABLE `tblCustodian` (
  `custodianId` int(5) NOT NULL AUTO_INCREMENT,
  `officeCode` varchar(20) NOT NULL DEFAULT '',
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`custodianId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblDailyQuote
#

DROP TABLE IF EXISTS `tblDailyQuote`;

CREATE TABLE `tblDailyQuote` (
  `day` int(2) NOT NULL DEFAULT 0,
  `quote` text NOT NULL,
  PRIMARY KEY (`day`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblDeduction
#

DROP TABLE IF EXISTS `tblDeduction`;

CREATE TABLE `tblDeduction` (
  `deductionCode` varchar(20) NOT NULL DEFAULT '',
  `deductionDesc` varchar(50) NOT NULL DEFAULT '',
  `deductionType` varchar(20) NOT NULL DEFAULT '',
  `deductionGroupCode` varchar(20) DEFAULT NULL,
  `deductionAccountCode` varchar(50) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`deductionCode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('UNDABS', 'UndertimeAbs', 'Regular', 'DOST', '0', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('GUNLLIFE', 'UNL Life', 'Loan', 'GSIS', '0', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('SLOAN', 'Sikat Loan', 'Loan', 'SIKAT', '0', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('GSALLOAN', 'GSIS Salary Loan', 'Loan', 'GSIS', '0', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('GPREMDIFF', 'Ret. Prem Diff.', 'Regular', 'GSIS', '0', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('DOREFUND', 'Refund RA', 'Others', 'DOST', '0', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('PLOAN', 'Pag-ibig Loan', 'Loan', 'PAGIBIG', '0', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('GPOLLOAN', 'POL Loan', 'Loan', 'GSIS', '0', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('MEDOCARE', 'STAR CARE', 'Regular', 'MEDOCARE', '0', '1');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('HPTAX', 'Hazard Tax', 'Regular', 'BIR', '0', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('LPTAX', 'LP Tax', 'Regular', 'BIR', '0', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('GCONSO', 'Conso Loan', 'Loan', 'GSIS', '0', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('DCONTRI', 'DOST-MPC', 'Contribution', 'DMPC', '0', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('LWOP', 'Leave Without Pay', 'Regular', 'DOST', '0', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('DEACONTRI', 'DOSTEA', 'Others', 'DMPC', '0', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('GECASH', 'E-Cash', 'Loan', 'GSIS', '0', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('GELA', 'ELA', 'Loan', 'GSIS', '0', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('GGENESIS', 'Genesis Plus', 'Loan', 'GSIS', '0', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('GEMERGENCY', 'GSIS Emergency ', 'Loan', 'GSIS', '0', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('GUMID', 'GSIS UMIDA-CA', 'Loan', 'GSIS', '0', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('GHOSPINS', 'Hosp Ins', 'Loan', 'GSIS', '0', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('PHOUSE', 'PAGIBIG Housing', 'Loan', 'PAGIBIG', '0', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('LLOAN', 'Landbank', 'Loan', 'LBP', '0', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('MUNIFORM01', 'Male Uniform 01', 'Loan', 'MUNIF1', '0', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('GOPTLOAN', 'Opt Loan', 'Loan', 'GSIS', '0', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('ITW', 'WHTax', 'Regular', 'BIR', '0', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('LIFE', 'Ret. Prem', 'Regular', 'GSIS', '0', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('PHILHEALTH', 'PhilHealth Premium', 'Regular', 'PHILHEALTH', '0', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('PAGIBIG', 'Pag-ibig', 'Regular', 'PAGIBIG', '0', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('', '', 'Regular', 'GSIS', '', '1');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('MEDEXT', 'MEDI CARE PLUS ', 'Contribution', 'MEDOCARE', '', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('Coco life', 'Coco life', 'Regular', 'COCO LIFE', '0', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('Housing', 'Housing', 'Loan', 'Housing', '0', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('SIKAT HMO', 'SIKAT', 'Others', 'SIKAT', '0', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('GEducational', 'GSIS Educational', 'Loan', 'GSIS', '0', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('UNIFORM', 'Uniform', 'Loan', 'DOST', '', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('PCALAM', 'Pagibig Calamity Loan', 'Loan', 'PAGIBIG', '', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('GSISINSUR', 'GSIS Group Insurance', 'Contribution', 'GSIS', '0', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('REF', 'Refund', 'Others', 'GSIS', '0', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('HMO', 'StarCare', 'Regular', 'SIKAT', '0', '1');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('PB', 'Phil British', 'Others', 'HMO', '0', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('SC', 'StarCare', 'Others', 'OTHERS', '0', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('PBBTAX', 'PBB Tax', 'Others', 'DOST', '0', '1');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('PAGIBIG2', 'Pag-ibig 2', 'Contribution', 'DOST', '0', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('PEI', 'PEI Tax', 'Others', 'DOST', '0', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('DOREFUNDMC', 'Refund of MC ', 'Others', 'DOST', '', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('REFSUBS', 'Refund of Subs', 'Regular', 'DOST', '', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('Subrefund052017', 'Refund of Subsistence for Oct. 2017', 'Others', 'DOST', '', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('DOMAYREFUNDLAUNDRY', 'Refund of laundry', 'Others', 'DOST', '', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('DOMAYREFUNDHAZARD', 'Refund of Hazard', 'Others', 'DOST', '', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('RATA Refund', 'Refund for Rata', 'Others', 'DOST', '', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('Refund of Subsistenc', 'Refund for Subsistence', 'Others', 'DOST', '', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('Refund', 'Refund of consoloan', 'Others', 'DOST', '', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('UnionDues', 'Union Dues Sikat', 'Others', 'DOST', '', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('ThursdayUniform', 'Thursday Uniform', 'Others', 'DOST', '', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('TaxPayable2017', 'Tax Payable 2017', 'Regular', 'DOST', '', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('SIKATUNIFORM', 'Sikat Uniform', 'Others', 'DOST', '', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('TA Refund', 'Refund for TA', 'Others', 'DOST', '', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('subsistencerefund', 'Refund for Subsistence', 'Others', 'DOST', '', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('COAOrderOf Execution', 'setlement of coa order of execution dated january ', 'Others', 'DOST', '', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('SUBS-LAUNDRYREFUND', 'SUBS-LAUNDRYREFUND', 'Others', 'DOST', '', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('ARRLIP', 'ARRLIP', 'Contribution', 'GSIS', '0', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('WHTPV', 'Withholding Tax Previous Months', 'Regular', 'BIR', '', '0');
INSERT INTO `tblDeduction` (`deductionCode`, `deductionDesc`, `deductionType`, `deductionGroupCode`, `deductionAccountCode`, `hidden`) VALUES ('LATESABS', 'Lates-Abs-Undertimes Previous cutoff', 'Regular', 'DOST', '0', '0');


#
# TABLE STRUCTURE FOR: tblDeductionGroup
#

DROP TABLE IF EXISTS `tblDeductionGroup`;

CREATE TABLE `tblDeductionGroup` (
  `deductionGroupCode` varchar(20) DEFAULT NULL,
  `deductionGroupDesc` varchar(50) DEFAULT NULL,
  `deductionGroupAccountCode` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblDuties
#

DROP TABLE IF EXISTS `tblDuties`;

CREATE TABLE `tblDuties` (
  `duties_index` int(11) NOT NULL AUTO_INCREMENT,
  `positionCode` varchar(20) NOT NULL,
  `duties` text NOT NULL,
  `percentWork` int(5) NOT NULL,
  `dutyNumber` int(11) NOT NULL,
  PRIMARY KEY (`duties_index`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblDuties` (`duties_index`, `positionCode`, `duties`, `percentWork`, `dutyNumber`) VALUES ('1', 'COMP3', 'Designs software/hardware-related training module for computer literacy', '5', '1');
INSERT INTO `tblDuties` (`duties_index`, `positionCode`, `duties`, `percentWork`, `dutyNumber`) VALUES ('3', '', 'Analyzes and designs computer system application towards the efficient utilization of the computer for efficient attainment of system requirements', '25', '1');
INSERT INTO `tblDuties` (`duties_index`, `positionCode`, `duties`, `percentWork`, `dutyNumber`) VALUES ('4', '', 'Supervises system development and continuously evaluates system designs to ensure its effectiveness', '25', '2');
INSERT INTO `tblDuties` (`duties_index`, `positionCode`, `duties`, `percentWork`, `dutyNumber`) VALUES ('5', '', 'Establishes program specifications and assigns programming jobs to subordinates', '20', '3');
INSERT INTO `tblDuties` (`duties_index`, `positionCode`, `duties`, `percentWork`, `dutyNumber`) VALUES ('6', '', 'Monitors the provision of IT services and conduct of computer-related research', '15', '4');
INSERT INTO `tblDuties` (`duties_index`, `positionCode`, `duties`, `percentWork`, `dutyNumber`) VALUES ('7', '', 'Designs software/hardware-related training module for computer literacy', '5', '5');
INSERT INTO `tblDuties` (`duties_index`, `positionCode`, `duties`, `percentWork`, `dutyNumber`) VALUES ('8', '', 'Establishes work schedules and bases for job-cost accounting', '5', '6');
INSERT INTO `tblDuties` (`duties_index`, `positionCode`, `duties`, `percentWork`, `dutyNumber`) VALUES ('9', '', 'Performs other related tasks as maybe assigned from time to time', '5', '7');


#
# TABLE STRUCTURE FOR: tblEducationalLevel
#

DROP TABLE IF EXISTS `tblEducationalLevel`;

CREATE TABLE `tblEducationalLevel` (
  `level` int(11) NOT NULL DEFAULT 0,
  `levelCode` varchar(30) NOT NULL DEFAULT '',
  `levelDesc` varchar(50) NOT NULL DEFAULT '',
  `system` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`levelCode`),
  KEY `levelDesc` (`levelDesc`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblEducationalLevel` (`level`, `levelCode`, `levelDesc`, `system`) VALUES ('7', 'ELM', 'Elementary', '1');
INSERT INTO `tblEducationalLevel` (`level`, `levelCode`, `levelDesc`, `system`) VALUES ('5', 'VCL', 'Vocational', '1');
INSERT INTO `tblEducationalLevel` (`level`, `levelCode`, `levelDesc`, `system`) VALUES ('0', 'MAS', 'Masteral', '1');
INSERT INTO `tblEducationalLevel` (`level`, `levelCode`, `levelDesc`, `system`) VALUES ('3', 'CLG', 'College', '1');
INSERT INTO `tblEducationalLevel` (`level`, `levelCode`, `levelDesc`, `system`) VALUES ('2', 'MAMS', 'Master\'s Degree', '1');
INSERT INTO `tblEducationalLevel` (`level`, `levelCode`, `levelDesc`, `system`) VALUES ('1', 'Ph.D.', 'Doctorate', '1');
INSERT INTO `tblEducationalLevel` (`level`, `levelCode`, `levelDesc`, `system`) VALUES ('6', 'HSL', 'High School', '1');
INSERT INTO `tblEducationalLevel` (`level`, `levelCode`, `levelDesc`, `system`) VALUES ('0', 'GDS', 'Graduate Studies', '0');


#
# TABLE STRUCTURE FOR: tblEmpAccount
#

DROP TABLE IF EXISTS `tblEmpAccount`;

CREATE TABLE `tblEmpAccount` (
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `userName` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `userPassword` varchar(50) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `userLevel` int(2) NOT NULL DEFAULT 5,
  `userPermission` varchar(20) NOT NULL DEFAULT 'Employee',
  `accessPermission` varchar(15) NOT NULL DEFAULT '1234',
  `assignedGroup` varchar(20) NOT NULL DEFAULT '',
  `signatory` text NOT NULL,
  `signatoryPosition` text NOT NULL,
  `is_assistant` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`empNumber`),
  KEY `Emp_No` (`empNumber`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblEmpAccount` (`empNumber`, `userName`, `userPassword`, `userLevel`, `userPermission`, `accessPermission`, `assignedGroup`, `signatory`, `signatoryPosition`, `is_assistant`) VALUES ('1111', 'admin@paete.gov.ph', 'a7070cd4e44379cb4f5d2ee11b00f225', '1', 'hr', '123456', '', '', '', '0');
INSERT INTO `tblEmpAccount` (`empNumber`, `userName`, `userPassword`, `userLevel`, `userPermission`, `accessPermission`, `assignedGroup`, `signatory`, `signatoryPosition`, `is_assistant`) VALUES ('PE-MGR020106', 'maritess.reyes', '2746572eeba12ed6d28751f24e6047cd', '1', 'hr', '123456', '', '', '', '0');
INSERT INTO `tblEmpAccount` (`empNumber`, `userName`, `userPassword`, `userLevel`, `userPermission`, `accessPermission`, `assignedGroup`, `signatory`, `signatoryPosition`, `is_assistant`) VALUES ('EO-RQB0000', 'ronald.cosico@paete.', '90ca772b7343dc2c37e76f217cc7608a', '3', 'officer', '', '', '', '', '0');
INSERT INTO `tblEmpAccount` (`empNumber`, `userName`, `userPassword`, `userLevel`, `userPermission`, `accessPermission`, `assignedGroup`, `signatory`, `signatoryPosition`, `is_assistant`) VALUES ('PE-FND070117', 'frank.delarosa', 'a7070cd4e44379cb4f5d2ee11b00f225', '1', 'hr', '123456', '', '', '', '0');


#
# TABLE STRUCTURE FOR: tblEmpAddIncome
#

DROP TABLE IF EXISTS `tblEmpAddIncome`;

CREATE TABLE `tblEmpAddIncome` (
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `incomeCode` varchar(20) NOT NULL DEFAULT '',
  `incomeYear` year(4) NOT NULL DEFAULT 0000,
  `incomeMonth` int(2) NOT NULL DEFAULT 0,
  `incomeAmount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `incomeTaxAmount` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblEmpAppointment
#

DROP TABLE IF EXISTS `tblEmpAppointment`;

CREATE TABLE `tblEmpAppointment` (
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `positionCode` varchar(20) NOT NULL DEFAULT '',
  `dateIssued` date NOT NULL DEFAULT '0000-00-00',
  `datePublished` date NOT NULL DEFAULT '0000-00-00',
  `placePublished` varchar(100) NOT NULL DEFAULT '',
  `relevantExperience` text NOT NULL,
  `relevantTraining` text NOT NULL,
  `appointmentissuedcode` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`appointmentissuedcode`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblEmpAppointment` (`empNumber`, `positionCode`, `dateIssued`, `datePublished`, `placePublished`, `relevantExperience`, `relevantTraining`, `appointmentissuedcode`) VALUES ('ADAS3-85-2004', 'ADAS3-85-2004', '1995-12-01', '0000-00-00', 'Iloilo City', '', '', '1');
INSERT INTO `tblEmpAppointment` (`empNumber`, `positionCode`, `dateIssued`, `datePublished`, `placePublished`, `relevantExperience`, `relevantTraining`, `appointmentissuedcode`) VALUES ('POS4-5-2014', 'OSEC-DENRB-POS4-5-20', '2015-09-08', '0000-00-00', 'Iloilo City', '', '', '2');
INSERT INTO `tblEmpAppointment` (`empNumber`, `positionCode`, `dateIssued`, `datePublished`, `placePublished`, `relevantExperience`, `relevantTraining`, `appointmentissuedcode`) VALUES ('INFOSA2-98-2014', 'ISA II', '2016-02-09', '2016-02-09', 'Iloilo City', '', '', '3');


#
# TABLE STRUCTURE FOR: tblEmpBenefits
#

DROP TABLE IF EXISTS `tblEmpBenefits`;

CREATE TABLE `tblEmpBenefits` (
  `benefitCode` int(10) NOT NULL AUTO_INCREMENT,
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `incomeCode` varchar(20) NOT NULL DEFAULT '',
  `incomeMonth` int(2) NOT NULL DEFAULT 0,
  `incomeAmount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `ITW` decimal(10,2) NOT NULL DEFAULT 0.00,
  `period1` decimal(10,2) NOT NULL DEFAULT 0.00,
  `period2` decimal(10,2) NOT NULL DEFAULT 0.00,
  `period3` decimal(10,2) NOT NULL DEFAULT 0.00,
  `period4` decimal(10,2) NOT NULL DEFAULT 0.00,
  `status` char(1) NOT NULL DEFAULT '',
  PRIMARY KEY (`benefitCode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblEmpChild
#

DROP TABLE IF EXISTS `tblEmpChild`;

CREATE TABLE `tblEmpChild` (
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `childCode` mediumint(9) NOT NULL AUTO_INCREMENT,
  `childName` varchar(80) NOT NULL DEFAULT '',
  `childBirthDate` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`childCode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblEmpDTR
#

DROP TABLE IF EXISTS `tblEmpDTR`;

CREATE TABLE `tblEmpDTR` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empNumber` varchar(50) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `dtrDate` date NOT NULL DEFAULT '0000-00-00',
  `inAM` time NOT NULL DEFAULT '00:00:00',
  `outAM` time NOT NULL DEFAULT '00:00:00',
  `inPM` time NOT NULL DEFAULT '00:00:00',
  `outPM` time NOT NULL DEFAULT '00:00:00',
  `inOT` time NOT NULL DEFAULT '00:00:00',
  `outOT` time NOT NULL DEFAULT '00:00:00',
  `DTRreason` varchar(100) NOT NULL,
  `remarks` varchar(255) NOT NULL DEFAULT '',
  `otherInfo` varchar(255) NOT NULL DEFAULT '',
  `OT` int(1) NOT NULL DEFAULT 0,
  `name` text NOT NULL,
  `ip` text NOT NULL,
  `editdate` text NOT NULL,
  `perdiem` char(1) NOT NULL DEFAULT '',
  `oldValue` text DEFAULT NULL,
  `wfh` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_dtrDate` (`dtrDate`),
  KEY `idx_empNumber` (`empNumber`)
) ENGINE=MyISAM AUTO_INCREMENT=504795 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblEmpDTR` (`id`, `empNumber`, `dtrDate`, `inAM`, `outAM`, `inPM`, `outPM`, `inOT`, `outOT`, `DTRreason`, `remarks`, `otherInfo`, `OT`, `name`, `ip`, `editdate`, `perdiem`, `oldValue`, `wfh`) VALUES ('504779', 'PE-FND070117', '2024-08-05', '08:39:00', '00:00:00', '00:00:00', '08:00:00', '00:00:00', '00:00:00', '', '', '', '0', ';ADMIN HRMIS', ';203.160.163.101', ';2024-09-04 10:27:19 AM', '', ';inAM=08:39:00, outAM=00:00:00, inPM=00:00:00, outPM=08:00:00, inOT=00:00:00, outOT=00:00:00', '0');
INSERT INTO `tblEmpDTR` (`id`, `empNumber`, `dtrDate`, `inAM`, `outAM`, `inPM`, `outPM`, `inOT`, `outOT`, `DTRreason`, `remarks`, `otherInfo`, `OT`, `name`, `ip`, `editdate`, `perdiem`, `oldValue`, `wfh`) VALUES ('504780', 'PE-FND070117', '2024-08-07', '09:49:00', '00:00:00', '00:00:00', '08:00:00', '00:00:00', '00:00:00', '', '', '', '0', ';ADMIN HRMIS', ';203.160.163.101', ';2024-09-04 10:27:19 AM', '', ';inAM=09:49:00, outAM=00:00:00, inPM=00:00:00, outPM=08:00:00, inOT=00:00:00, outOT=00:00:00', '0');
INSERT INTO `tblEmpDTR` (`id`, `empNumber`, `dtrDate`, `inAM`, `outAM`, `inPM`, `outPM`, `inOT`, `outOT`, `DTRreason`, `remarks`, `otherInfo`, `OT`, `name`, `ip`, `editdate`, `perdiem`, `oldValue`, `wfh`) VALUES ('504781', 'PE-FND070117', '2024-08-08', '09:34:00', '00:00:00', '00:00:00', '08:00:00', '00:00:00', '00:00:00', '', '', '', '0', ';ADMIN HRMIS', ';203.160.163.101', ';2024-09-04 10:27:19 AM', '', ';inAM=09:34:00, outAM=00:00:00, inPM=00:00:00, outPM=08:00:00, inOT=00:00:00, outOT=00:00:00', '0');
INSERT INTO `tblEmpDTR` (`id`, `empNumber`, `dtrDate`, `inAM`, `outAM`, `inPM`, `outPM`, `inOT`, `outOT`, `DTRreason`, `remarks`, `otherInfo`, `OT`, `name`, `ip`, `editdate`, `perdiem`, `oldValue`, `wfh`) VALUES ('504782', 'PE-FND070117', '2024-08-12', '09:22:00', '00:00:00', '00:00:00', '08:00:00', '00:00:00', '00:00:00', '', '', '', '0', ';ADMIN HRMIS', ';203.160.163.101', ';2024-09-04 10:27:19 AM', '', ';inAM=09:22:00, outAM=00:00:00, inPM=00:00:00, outPM=08:00:00, inOT=00:00:00, outOT=00:00:00', '0');
INSERT INTO `tblEmpDTR` (`id`, `empNumber`, `dtrDate`, `inAM`, `outAM`, `inPM`, `outPM`, `inOT`, `outOT`, `DTRreason`, `remarks`, `otherInfo`, `OT`, `name`, `ip`, `editdate`, `perdiem`, `oldValue`, `wfh`) VALUES ('504783', 'PE-FND070117', '2024-08-13', '09:13:00', '00:00:00', '00:00:00', '08:00:00', '00:00:00', '00:00:00', '', '', '', '0', ';ADMIN HRMIS', ';203.160.163.101', ';2024-09-04 10:27:19 AM', '', ';inAM=09:13:00, outAM=00:00:00, inPM=00:00:00, outPM=08:00:00, inOT=00:00:00, outOT=00:00:00', '0');
INSERT INTO `tblEmpDTR` (`id`, `empNumber`, `dtrDate`, `inAM`, `outAM`, `inPM`, `outPM`, `inOT`, `outOT`, `DTRreason`, `remarks`, `otherInfo`, `OT`, `name`, `ip`, `editdate`, `perdiem`, `oldValue`, `wfh`) VALUES ('504784', 'PE-FND070117', '2024-08-14', '09:03:00', '00:00:00', '00:00:00', '08:00:00', '00:00:00', '00:00:00', '', '', '', '0', ';ADMIN HRMIS', ';203.160.163.101', ';2024-09-04 10:27:19 AM', '', ';inAM=09:03:00, outAM=00:00:00, inPM=00:00:00, outPM=08:00:00, inOT=00:00:00, outOT=00:00:00', '0');
INSERT INTO `tblEmpDTR` (`id`, `empNumber`, `dtrDate`, `inAM`, `outAM`, `inPM`, `outPM`, `inOT`, `outOT`, `DTRreason`, `remarks`, `otherInfo`, `OT`, `name`, `ip`, `editdate`, `perdiem`, `oldValue`, `wfh`) VALUES ('504785', 'PE-FND070117', '2024-08-15', '09:27:00', '00:00:00', '00:00:00', '08:00:00', '00:00:00', '00:00:00', '', '', '', '0', ';ADMIN HRMIS', ';203.160.163.101', ';2024-09-04 10:27:19 AM', '', ';inAM=09:27:00, outAM=00:00:00, inPM=00:00:00, outPM=08:00:00, inOT=00:00:00, outOT=00:00:00', '0');
INSERT INTO `tblEmpDTR` (`id`, `empNumber`, `dtrDate`, `inAM`, `outAM`, `inPM`, `outPM`, `inOT`, `outOT`, `DTRreason`, `remarks`, `otherInfo`, `OT`, `name`, `ip`, `editdate`, `perdiem`, `oldValue`, `wfh`) VALUES ('504786', 'PE-FND070117', '2024-08-16', '09:02:00', '00:00:00', '00:00:00', '08:00:00', '00:00:00', '00:00:00', '', '', '', '0', ';ADMIN HRMIS', ';203.160.163.101', ';2024-09-04 10:27:19 AM', '', ';inAM=09:02:00, outAM=00:00:00, inPM=00:00:00, outPM=08:00:00, inOT=00:00:00, outOT=00:00:00', '0');
INSERT INTO `tblEmpDTR` (`id`, `empNumber`, `dtrDate`, `inAM`, `outAM`, `inPM`, `outPM`, `inOT`, `outOT`, `DTRreason`, `remarks`, `otherInfo`, `OT`, `name`, `ip`, `editdate`, `perdiem`, `oldValue`, `wfh`) VALUES ('504787', 'PE-FND070117', '2024-08-19', '10:03:00', '00:00:00', '00:00:00', '08:00:00', '00:00:00', '00:00:00', '', '', '', '0', ';ADMIN HRMIS', ';203.160.163.101', ';2024-09-04 10:27:19 AM', '', ';inAM=10:03:00, outAM=00:00:00, inPM=00:00:00, outPM=08:00:00, inOT=00:00:00, outOT=00:00:00', '0');
INSERT INTO `tblEmpDTR` (`id`, `empNumber`, `dtrDate`, `inAM`, `outAM`, `inPM`, `outPM`, `inOT`, `outOT`, `DTRreason`, `remarks`, `otherInfo`, `OT`, `name`, `ip`, `editdate`, `perdiem`, `oldValue`, `wfh`) VALUES ('504788', 'PE-FND070117', '2024-08-20', '08:31:00', '00:00:00', '00:00:00', '08:00:00', '00:00:00', '00:00:00', '', '', '', '0', ';ADMIN HRMIS', ';203.160.163.101', ';2024-09-04 10:27:19 AM', '', ';inAM=08:31:00, outAM=00:00:00, inPM=00:00:00, outPM=08:00:00, inOT=00:00:00, outOT=00:00:00', '0');
INSERT INTO `tblEmpDTR` (`id`, `empNumber`, `dtrDate`, `inAM`, `outAM`, `inPM`, `outPM`, `inOT`, `outOT`, `DTRreason`, `remarks`, `otherInfo`, `OT`, `name`, `ip`, `editdate`, `perdiem`, `oldValue`, `wfh`) VALUES ('504789', 'PE-FND070117', '2024-08-21', '00:00:00', '00:00:00', '08:00:00', '08:00:00', '00:00:00', '00:00:00', '', '', '', '0', ';ADMIN HRMIS', ';203.160.163.101', ';2024-09-04 10:27:19 AM', '', ';inAM=00:00:00, outAM=00:00:00, inPM=08:00:00, outPM=08:00:00, inOT=00:00:00, outOT=00:00:00', '0');
INSERT INTO `tblEmpDTR` (`id`, `empNumber`, `dtrDate`, `inAM`, `outAM`, `inPM`, `outPM`, `inOT`, `outOT`, `DTRreason`, `remarks`, `otherInfo`, `OT`, `name`, `ip`, `editdate`, `perdiem`, `oldValue`, `wfh`) VALUES ('504790', 'PE-FND070117', '2024-08-22', '00:00:00', '00:00:00', '08:00:00', '08:00:00', '00:00:00', '00:00:00', '', '', '', '0', ';ADMIN HRMIS', ';203.160.163.101', ';2024-09-04 10:27:19 AM', '', ';inAM=00:00:00, outAM=00:00:00, inPM=08:00:00, outPM=08:00:00, inOT=00:00:00, outOT=00:00:00', '0');
INSERT INTO `tblEmpDTR` (`id`, `empNumber`, `dtrDate`, `inAM`, `outAM`, `inPM`, `outPM`, `inOT`, `outOT`, `DTRreason`, `remarks`, `otherInfo`, `OT`, `name`, `ip`, `editdate`, `perdiem`, `oldValue`, `wfh`) VALUES ('504791', 'PE-FND070117', '2024-08-27', '00:00:00', '00:00:00', '08:00:00', '08:00:00', '00:00:00', '00:00:00', '', '', '', '0', ';ADMIN HRMIS', ';203.160.163.101', ';2024-09-04 10:27:19 AM', '', ';inAM=00:00:00, outAM=00:00:00, inPM=08:00:00, outPM=08:00:00, inOT=00:00:00, outOT=00:00:00', '0');
INSERT INTO `tblEmpDTR` (`id`, `empNumber`, `dtrDate`, `inAM`, `outAM`, `inPM`, `outPM`, `inOT`, `outOT`, `DTRreason`, `remarks`, `otherInfo`, `OT`, `name`, `ip`, `editdate`, `perdiem`, `oldValue`, `wfh`) VALUES ('504792', 'PE-FND070117', '2024-08-28', '00:00:00', '00:00:00', '08:00:00', '08:00:00', '00:00:00', '00:00:00', '', '', '', '0', ';ADMIN HRMIS', ';203.160.163.101', ';2024-09-04 10:27:19 AM', '', ';inAM=00:00:00, outAM=00:00:00, inPM=08:00:00, outPM=08:00:00, inOT=00:00:00, outOT=00:00:00', '0');
INSERT INTO `tblEmpDTR` (`id`, `empNumber`, `dtrDate`, `inAM`, `outAM`, `inPM`, `outPM`, `inOT`, `outOT`, `DTRreason`, `remarks`, `otherInfo`, `OT`, `name`, `ip`, `editdate`, `perdiem`, `oldValue`, `wfh`) VALUES ('504793', 'PE-FND070117', '2024-08-29', '07:09:00', '00:00:00', '00:00:00', '08:00:00', '00:00:00', '00:00:00', '', '', '', '0', ';ADMIN HRMIS', ';203.160.163.101', ';2024-09-04 10:27:19 AM', '', ';inAM=07:09:00, outAM=00:00:00, inPM=00:00:00, outPM=08:00:00, inOT=00:00:00, outOT=00:00:00', '0');
INSERT INTO `tblEmpDTR` (`id`, `empNumber`, `dtrDate`, `inAM`, `outAM`, `inPM`, `outPM`, `inOT`, `outOT`, `DTRreason`, `remarks`, `otherInfo`, `OT`, `name`, `ip`, `editdate`, `perdiem`, `oldValue`, `wfh`) VALUES ('504794', 'PE-FND070117', '2024-08-30', '08:56:00', '00:00:00', '00:00:00', '08:00:00', '00:00:00', '00:00:00', '', '', '', '0', ';ADMIN HRMIS', ';203.160.163.101', ';2024-09-04 10:27:19 AM', '', ';inAM=08:56:00, outAM=00:00:00, inPM=00:00:00, outPM=08:00:00, inOT=00:00:00, outOT=00:00:00', '0');


#
# TABLE STRUCTURE FOR: tblEmpDTR_log
#

DROP TABLE IF EXISTS `tblEmpDTR_log`;

CREATE TABLE `tblEmpDTR_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empNumber` varchar(20) NOT NULL,
  `log_date` datetime NOT NULL,
  `log_sql` text NOT NULL,
  `log_notify` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblEmpDeductLoan
#

DROP TABLE IF EXISTS `tblEmpDeductLoan`;

CREATE TABLE `tblEmpDeductLoan` (
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `deductionCode` varchar(20) NOT NULL DEFAULT '',
  `loanCode` int(100) NOT NULL AUTO_INCREMENT,
  `amountGranted` decimal(10,2) NOT NULL DEFAULT 0.00,
  `dateGranted` date DEFAULT NULL,
  `deductAmount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `actualStartYear` year(4) NOT NULL DEFAULT 0000,
  `actualStartMonth` int(2) NOT NULL DEFAULT 0,
  `actualEndYear` year(4) NOT NULL DEFAULT 0000,
  `actualEndMonth` int(2) NOT NULL DEFAULT 0,
  `status` char(1) NOT NULL DEFAULT '',
  PRIMARY KEY (`loanCode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblEmpDeductLoanConAdjust
#

DROP TABLE IF EXISTS `tblEmpDeductLoanConAdjust`;

CREATE TABLE `tblEmpDeductLoanConAdjust` (
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `code` int(100) NOT NULL DEFAULT 0,
  `deductionCode` varchar(20) NOT NULL DEFAULT '',
  `deductMonth` varchar(10) NOT NULL DEFAULT '',
  `deductYear` year(4) NOT NULL DEFAULT 0000,
  `deductAmount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `type` varchar(20) NOT NULL DEFAULT '',
  `adjustSwitch` char(1) NOT NULL DEFAULT '',
  `adjustMonth` varchar(10) NOT NULL DEFAULT '0',
  `adjustYear` year(4) NOT NULL DEFAULT 0000,
  `adjustPeriod` int(4) NOT NULL DEFAULT 0,
  `xappointmentCode` varchar(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblEmpDeductionRemit
#

DROP TABLE IF EXISTS `tblEmpDeductionRemit`;

CREATE TABLE `tblEmpDeductionRemit` (
  `processID` int(11) NOT NULL DEFAULT 0,
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `code` int(100) NOT NULL DEFAULT 0,
  `deductionCode` varchar(20) NOT NULL DEFAULT '',
  `deductMonth` int(11) NOT NULL DEFAULT 0,
  `deductYear` year(4) NOT NULL DEFAULT 0000,
  `deductAmount` decimal(10,2) DEFAULT NULL,
  `period1` decimal(10,2) NOT NULL DEFAULT 0.00,
  `period2` decimal(10,2) NOT NULL DEFAULT 0.00,
  `period3` decimal(10,2) NOT NULL DEFAULT 0.00,
  `period4` decimal(10,2) NOT NULL DEFAULT 0.00,
  `orNumber` varchar(20) DEFAULT NULL,
  `orDate` date DEFAULT NULL,
  `TYPE` varchar(20) NOT NULL DEFAULT '',
  `appointmentCode` varchar(20) NOT NULL DEFAULT '',
  `employerAmount` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblEmpDeductions
#

DROP TABLE IF EXISTS `tblEmpDeductions`;

CREATE TABLE `tblEmpDeductions` (
  `deductCode` int(10) NOT NULL AUTO_INCREMENT,
  `empNumber` varchar(20) DEFAULT NULL,
  `deductionCode` varchar(20) NOT NULL DEFAULT '',
  `amountGranted` decimal(10,2) NOT NULL DEFAULT 0.00,
  `dateGranted` date NOT NULL DEFAULT '0000-00-00',
  `actualStartYear` year(4) NOT NULL DEFAULT 0000,
  `actualStartMonth` int(2) NOT NULL DEFAULT 0,
  `actualEndYear` year(4) NOT NULL DEFAULT 0000,
  `actualEndMonth` int(2) NOT NULL DEFAULT 0,
  `annual` decimal(10,2) NOT NULL DEFAULT 0.00,
  `monthly` decimal(10,2) NOT NULL DEFAULT 0.00,
  `period1` decimal(10,2) NOT NULL DEFAULT 0.00,
  `period2` decimal(10,2) NOT NULL DEFAULT 0.00,
  `period3` decimal(10,2) NOT NULL DEFAULT 0.00,
  `period4` decimal(10,2) NOT NULL DEFAULT 0.00,
  `status` char(1) NOT NULL DEFAULT '',
  PRIMARY KEY (`deductCode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblEmpDuties
#

DROP TABLE IF EXISTS `tblEmpDuties`;

CREATE TABLE `tblEmpDuties` (
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `percentWork` decimal(5,2) NOT NULL DEFAULT 0.00,
  `duties` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblEmpExam
#

DROP TABLE IF EXISTS `tblEmpExam`;

CREATE TABLE `tblEmpExam` (
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `examCode` varchar(20) NOT NULL DEFAULT '',
  `examDate` date NOT NULL DEFAULT '0000-00-00',
  `examRating` decimal(4,2) NOT NULL DEFAULT 0.00,
  `examPlace` varchar(100) NOT NULL DEFAULT '',
  `licenseNumber` varchar(15) DEFAULT NULL,
  `dateRelease` date NOT NULL DEFAULT '0000-00-00',
  `ExamIndex` int(10) NOT NULL AUTO_INCREMENT,
  `verifier` varchar(50) NOT NULL,
  `reviewer` varchar(50) NOT NULL,
  PRIMARY KEY (`ExamIndex`),
  KEY `Emp_No` (`empNumber`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblEmpExam` (`empNumber`, `examCode`, `examDate`, `examRating`, `examPlace`, `licenseNumber`, `dateRelease`, `ExamIndex`, `verifier`, `reviewer`) VALUES ('ADOF1-234-2004', 'CSP', '0000-00-00', '0.00', '', '', '0000-00-00', '1', '', '');


#
# TABLE STRUCTURE FOR: tblEmpIncome
#

DROP TABLE IF EXISTS `tblEmpIncome`;

CREATE TABLE `tblEmpIncome` (
  `processID` int(11) NOT NULL DEFAULT 0,
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `incomeCode` varchar(20) NOT NULL DEFAULT '',
  `incomeYear` year(4) NOT NULL DEFAULT 0000,
  `incomeMonth` int(2) NOT NULL DEFAULT 0,
  `actualSalary` decimal(10,2) NOT NULL DEFAULT 0.00,
  `positionCode` varchar(20) NOT NULL DEFAULT '',
  `officeCode` varchar(20) NOT NULL DEFAULT '',
  `incomeAmount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `ITW` decimal(10,2) NOT NULL DEFAULT 0.00,
  `appointmentCode` varchar(20) NOT NULL DEFAULT '',
  `zonecode` varchar(20) NOT NULL DEFAULT '',
  `netPay` decimal(10,2) NOT NULL DEFAULT 0.00,
  `period1` decimal(10,2) NOT NULL DEFAULT 0.00,
  `period2` decimal(10,2) NOT NULL DEFAULT 0.00,
  `period3` decimal(10,2) NOT NULL DEFAULT 0.00,
  `period4` decimal(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblEmpIncomeAdjust
#

DROP TABLE IF EXISTS `tblEmpIncomeAdjust`;

CREATE TABLE `tblEmpIncomeAdjust` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `incomeCode` varchar(20) NOT NULL DEFAULT '',
  `incomeMonth` varchar(10) NOT NULL DEFAULT '',
  `incomeYear` year(4) NOT NULL DEFAULT 0000,
  `incomeAmount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `type` varchar(20) NOT NULL DEFAULT '',
  `adjustSwitch` char(1) NOT NULL DEFAULT '',
  `adjustMonth` varchar(10) NOT NULL DEFAULT '0',
  `adjustYear` year(4) NOT NULL DEFAULT 0000,
  `adjustPeriod` int(4) NOT NULL DEFAULT 0,
  `appointmentCode` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblEmpIncomeRATA
#

DROP TABLE IF EXISTS `tblEmpIncomeRATA`;

CREATE TABLE `tblEmpIncomeRATA` (
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `incRAAmount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `incTAAmount` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblEmpLeave
#

DROP TABLE IF EXISTS `tblEmpLeave`;

CREATE TABLE `tblEmpLeave` (
  `leaveID` int(11) NOT NULL AUTO_INCREMENT,
  `dateFiled` date NOT NULL DEFAULT '0000-00-00',
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `requestID` varchar(10) NOT NULL DEFAULT '',
  `leaveCode` char(3) NOT NULL DEFAULT '',
  `specificLeave` varchar(20) NOT NULL DEFAULT '',
  `reason` varchar(50) DEFAULT NULL,
  `leaveFrom` date NOT NULL DEFAULT '0000-00-00',
  `leaveTo` date NOT NULL DEFAULT '0000-00-00',
  `certifyHR` char(1) NOT NULL DEFAULT 'N',
  `approveChief` char(1) NOT NULL DEFAULT 'N',
  `approveRequest` char(1) NOT NULL DEFAULT 'N',
  `remarks` varchar(50) DEFAULT NULL,
  `inoutpatient` varchar(20) NOT NULL DEFAULT '',
  `vllocation` varchar(20) NOT NULL DEFAULT '',
  `commutation` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`leaveID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblEmpLeaveBalance
#

DROP TABLE IF EXISTS `tblEmpLeaveBalance`;

CREATE TABLE `tblEmpLeaveBalance` (
  `lb_id` int(11) NOT NULL AUTO_INCREMENT,
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '0',
  `periodMonth` int(2) NOT NULL DEFAULT 0,
  `periodYear` year(4) NOT NULL DEFAULT 0000,
  `vlEarned` decimal(6,3) NOT NULL DEFAULT 0.000,
  `trut_notimes` int(10) NOT NULL DEFAULT 0,
  `trut_totalminutes` varchar(20) NOT NULL DEFAULT '',
  `vltrut_wpay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vl_wpay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vlAbsUndWPay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vlPreBalance` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vlBalance` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vltrut_wopay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vl_wopay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vlAbsUndWoPay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `slEarned` decimal(6,3) NOT NULL DEFAULT 0.000,
  `slAbsUndWPay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `slPreBalance` decimal(6,3) NOT NULL DEFAULT 0.000,
  `slBalance` decimal(6,3) NOT NULL DEFAULT 0.000,
  `slAbsUndWoPay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vlWoPayAmount` decimal(10,0) NOT NULL DEFAULT 0,
  `slWoPayAmount` decimal(10,0) NOT NULL DEFAULT 0,
  `nodays_awol` int(11) NOT NULL DEFAULT 0,
  `nodays_absent` int(11) NOT NULL DEFAULT 0,
  `nodays_present` int(11) DEFAULT 0,
  `nodays_actualpresent` int(11) NOT NULL DEFAULT 0,
  `nodays_vl` int(11) DEFAULT 0,
  `nodays_sl` int(11) DEFAULT 0,
  `nodays_undertime` int(2) NOT NULL DEFAULT 0,
  `totalTardyHour` int(3) NOT NULL DEFAULT 0,
  `totalTardyMinute` int(3) NOT NULL DEFAULT 0,
  `setAsDeduction` char(1) NOT NULL DEFAULT '0',
  `excess` varchar(20) NOT NULL DEFAULT '0.000000',
  `off_bal` int(10) NOT NULL DEFAULT 0,
  `off_gain` int(10) NOT NULL DEFAULT 0,
  `off_used` int(10) NOT NULL DEFAULT 0,
  `flBalance` int(2) NOT NULL DEFAULT 0,
  `flPreBalance` int(2) NOT NULL DEFAULT 0,
  `plBalance` int(2) NOT NULL DEFAULT 0,
  `plPreBalance` int(2) NOT NULL DEFAULT 0,
  `mtlBalance` int(2) NOT NULL DEFAULT 0,
  `mtlPreBalance` int(2) NOT NULL DEFAULT 0,
  `ptlBalance` int(2) NOT NULL DEFAULT 0,
  `ptlPreBalance` int(2) NOT NULL DEFAULT 0,
  `stlBalance` int(2) NOT NULL DEFAULT 0,
  `stlPreBalance` int(2) NOT NULL DEFAULT 0,
  `numOfPerdiem` int(11) NOT NULL DEFAULT 0,
  `ctr_8h` int(11) NOT NULL DEFAULT 0,
  `ctr_6h` int(11) NOT NULL DEFAULT 0,
  `ctr_5h` int(11) NOT NULL DEFAULT 0,
  `ctr_4h` int(11) NOT NULL DEFAULT 0,
  `ctr_wmeal` int(11) NOT NULL DEFAULT 0,
  `ctr_diem` decimal(10,2) NOT NULL DEFAULT 0.00,
  `ctr_laundry` int(11) NOT NULL,
  `processBy` varchar(20) NOT NULL DEFAULT '',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `processDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`lb_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblEmpLeaveBalance_040716
#

DROP TABLE IF EXISTS `tblEmpLeaveBalance_040716`;

CREATE TABLE `tblEmpLeaveBalance_040716` (
  `lb_id` int(11) NOT NULL AUTO_INCREMENT,
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '0',
  `periodMonth` int(2) NOT NULL DEFAULT 0,
  `periodYear` year(4) NOT NULL DEFAULT 0000,
  `vlEarned` decimal(6,3) NOT NULL DEFAULT 0.000,
  `trut_notimes` int(10) NOT NULL DEFAULT 0,
  `trut_totalminutes` varchar(20) NOT NULL DEFAULT '',
  `vltrut_wpay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vl_wpay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vlAbsUndWPay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vlPreBalance` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vlBalance` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vltrut_wopay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vl_wopay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vlAbsUndWoPay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `slEarned` decimal(6,3) NOT NULL DEFAULT 0.000,
  `slAbsUndWPay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `slPreBalance` decimal(6,3) NOT NULL DEFAULT 0.000,
  `slBalance` decimal(6,3) NOT NULL DEFAULT 0.000,
  `slAbsUndWoPay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vlWoPayAmount` decimal(10,0) NOT NULL DEFAULT 0,
  `slWoPayAmount` decimal(10,0) NOT NULL DEFAULT 0,
  `nodays_awol` int(11) NOT NULL DEFAULT 0,
  `nodays_absent` int(11) NOT NULL DEFAULT 0,
  `nodays_present` int(11) DEFAULT 0,
  `nodays_actualpresent` int(11) NOT NULL DEFAULT 0,
  `nodays_vl` int(11) DEFAULT 0,
  `nodays_sl` int(11) DEFAULT 0,
  `nodays_undertime` int(2) NOT NULL DEFAULT 0,
  `totalTardyHour` int(3) NOT NULL DEFAULT 0,
  `totalTardyMinute` int(3) NOT NULL DEFAULT 0,
  `setAsDeduction` char(1) NOT NULL DEFAULT '0',
  `excess` varchar(20) NOT NULL DEFAULT '0.000000',
  `off_bal` int(10) NOT NULL DEFAULT 0,
  `off_gain` int(10) NOT NULL DEFAULT 0,
  `off_used` int(10) NOT NULL DEFAULT 0,
  `flBalance` int(2) NOT NULL DEFAULT 0,
  `flPreBalance` int(2) NOT NULL DEFAULT 0,
  `plBalance` int(2) NOT NULL DEFAULT 0,
  `plPreBalance` int(2) NOT NULL DEFAULT 0,
  `mtlBalance` int(2) NOT NULL DEFAULT 0,
  `mtlPreBalance` int(2) NOT NULL DEFAULT 0,
  `ptlBalance` int(2) NOT NULL DEFAULT 0,
  `ptlPreBalance` int(2) NOT NULL DEFAULT 0,
  `stlBalance` int(2) NOT NULL DEFAULT 0,
  `stlPreBalance` int(2) NOT NULL DEFAULT 0,
  `numOfPerdiem` int(11) NOT NULL DEFAULT 0,
  `ctr_8h` int(11) NOT NULL DEFAULT 0,
  `ctr_4h` int(11) NOT NULL DEFAULT 0,
  `ctr_wmeal` int(11) NOT NULL DEFAULT 0,
  `ctr_laundry` int(11) NOT NULL,
  `processBy` varchar(20) NOT NULL DEFAULT '',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `processDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`lb_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblEmpLeaveBalance_11242016
#

DROP TABLE IF EXISTS `tblEmpLeaveBalance_11242016`;

CREATE TABLE `tblEmpLeaveBalance_11242016` (
  `lb_id` int(11) NOT NULL AUTO_INCREMENT,
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '0',
  `periodMonth` int(2) NOT NULL DEFAULT 0,
  `periodYear` year(4) NOT NULL DEFAULT 0000,
  `vlEarned` decimal(6,3) NOT NULL DEFAULT 0.000,
  `trut_notimes` int(10) NOT NULL DEFAULT 0,
  `trut_totalminutes` varchar(20) NOT NULL DEFAULT '',
  `vltrut_wpay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vl_wpay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vlAbsUndWPay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vlPreBalance` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vlBalance` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vltrut_wopay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vl_wopay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vlAbsUndWoPay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `slEarned` decimal(6,3) NOT NULL DEFAULT 0.000,
  `slAbsUndWPay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `slPreBalance` decimal(6,3) NOT NULL DEFAULT 0.000,
  `slBalance` decimal(6,3) NOT NULL DEFAULT 0.000,
  `slAbsUndWoPay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vlWoPayAmount` decimal(10,0) NOT NULL DEFAULT 0,
  `slWoPayAmount` decimal(10,0) NOT NULL DEFAULT 0,
  `nodays_awol` int(11) NOT NULL DEFAULT 0,
  `nodays_absent` int(11) NOT NULL DEFAULT 0,
  `nodays_present` int(11) DEFAULT 0,
  `nodays_actualpresent` int(11) NOT NULL DEFAULT 0,
  `nodays_vl` int(11) DEFAULT 0,
  `nodays_sl` int(11) DEFAULT 0,
  `nodays_undertime` int(2) NOT NULL DEFAULT 0,
  `totalTardyHour` int(3) NOT NULL DEFAULT 0,
  `totalTardyMinute` int(3) NOT NULL DEFAULT 0,
  `setAsDeduction` char(1) NOT NULL DEFAULT '0',
  `excess` varchar(20) NOT NULL DEFAULT '0.000000',
  `off_bal` int(10) NOT NULL DEFAULT 0,
  `off_gain` int(10) NOT NULL DEFAULT 0,
  `off_used` int(10) NOT NULL DEFAULT 0,
  `flBalance` int(2) NOT NULL DEFAULT 0,
  `flPreBalance` int(2) NOT NULL DEFAULT 0,
  `plBalance` int(2) NOT NULL DEFAULT 0,
  `plPreBalance` int(2) NOT NULL DEFAULT 0,
  `mtlBalance` int(2) NOT NULL DEFAULT 0,
  `mtlPreBalance` int(2) NOT NULL DEFAULT 0,
  `ptlBalance` int(2) NOT NULL DEFAULT 0,
  `ptlPreBalance` int(2) NOT NULL DEFAULT 0,
  `stlBalance` int(2) NOT NULL DEFAULT 0,
  `stlPreBalance` int(2) NOT NULL DEFAULT 0,
  `numOfPerdiem` int(11) NOT NULL DEFAULT 0,
  `ctr_8h` int(11) NOT NULL DEFAULT 0,
  `ctr_6h` int(11) NOT NULL DEFAULT 0,
  `ctr_5h` int(11) NOT NULL DEFAULT 0,
  `ctr_4h` int(11) NOT NULL DEFAULT 0,
  `ctr_wmeal` int(11) NOT NULL DEFAULT 0,
  `ctr_laundry` int(11) NOT NULL,
  `processBy` varchar(20) NOT NULL DEFAULT '',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `processDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`lb_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblEmpLeaveBalance_Aug16
#

DROP TABLE IF EXISTS `tblEmpLeaveBalance_Aug16`;

CREATE TABLE `tblEmpLeaveBalance_Aug16` (
  `lb_id` int(11) NOT NULL AUTO_INCREMENT,
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '0',
  `periodMonth` int(2) NOT NULL DEFAULT 0,
  `periodYear` year(4) NOT NULL DEFAULT 0000,
  `vlEarned` decimal(6,3) NOT NULL DEFAULT 0.000,
  `trut_notimes` int(10) NOT NULL DEFAULT 0,
  `trut_totalminutes` varchar(20) NOT NULL DEFAULT '',
  `vltrut_wpay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vl_wpay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vlAbsUndWPay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vlPreBalance` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vlBalance` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vltrut_wopay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vl_wopay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vlAbsUndWoPay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `slEarned` decimal(6,3) NOT NULL DEFAULT 0.000,
  `slAbsUndWPay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `slPreBalance` decimal(6,3) NOT NULL DEFAULT 0.000,
  `slBalance` decimal(6,3) NOT NULL DEFAULT 0.000,
  `slAbsUndWoPay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vlWoPayAmount` decimal(10,0) NOT NULL DEFAULT 0,
  `slWoPayAmount` decimal(10,0) NOT NULL DEFAULT 0,
  `nodays_awol` int(11) NOT NULL DEFAULT 0,
  `nodays_absent` int(11) NOT NULL DEFAULT 0,
  `nodays_present` int(11) DEFAULT 0,
  `nodays_actualpresent` int(11) NOT NULL DEFAULT 0,
  `nodays_vl` int(11) DEFAULT 0,
  `nodays_sl` int(11) DEFAULT 0,
  `nodays_undertime` int(2) NOT NULL DEFAULT 0,
  `totalTardyHour` int(3) NOT NULL DEFAULT 0,
  `totalTardyMinute` int(3) NOT NULL DEFAULT 0,
  `setAsDeduction` char(1) NOT NULL DEFAULT '0',
  `excess` varchar(20) NOT NULL DEFAULT '0.000000',
  `off_bal` int(10) NOT NULL DEFAULT 0,
  `off_gain` int(10) NOT NULL DEFAULT 0,
  `off_used` int(10) NOT NULL DEFAULT 0,
  `flBalance` int(2) NOT NULL DEFAULT 0,
  `flPreBalance` int(2) NOT NULL DEFAULT 0,
  `plBalance` int(2) NOT NULL DEFAULT 0,
  `plPreBalance` int(2) NOT NULL DEFAULT 0,
  `mtlBalance` int(2) NOT NULL DEFAULT 0,
  `mtlPreBalance` int(2) NOT NULL DEFAULT 0,
  `ptlBalance` int(2) NOT NULL DEFAULT 0,
  `ptlPreBalance` int(2) NOT NULL DEFAULT 0,
  `stlBalance` int(2) NOT NULL DEFAULT 0,
  `stlPreBalance` int(2) NOT NULL DEFAULT 0,
  `numOfPerdiem` int(11) NOT NULL DEFAULT 0,
  `ctr_8h` int(11) NOT NULL DEFAULT 0,
  `ctr_6h` int(11) NOT NULL DEFAULT 0,
  `ctr_5h` int(11) NOT NULL DEFAULT 0,
  `ctr_4h` int(11) NOT NULL DEFAULT 0,
  `ctr_wmeal` int(11) NOT NULL DEFAULT 0,
  `ctr_laundry` int(11) NOT NULL,
  `processBy` varchar(20) NOT NULL DEFAULT '',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `processDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`lb_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblEmpLeaveBalance_Jan2017
#

DROP TABLE IF EXISTS `tblEmpLeaveBalance_Jan2017`;

CREATE TABLE `tblEmpLeaveBalance_Jan2017` (
  `lb_id` int(11) NOT NULL AUTO_INCREMENT,
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '0',
  `periodMonth` int(2) NOT NULL DEFAULT 0,
  `periodYear` year(4) NOT NULL DEFAULT 0000,
  `vlEarned` decimal(6,3) NOT NULL DEFAULT 0.000,
  `trut_notimes` int(10) NOT NULL DEFAULT 0,
  `trut_totalminutes` varchar(20) NOT NULL DEFAULT '',
  `vltrut_wpay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vl_wpay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vlAbsUndWPay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vlPreBalance` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vlBalance` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vltrut_wopay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vl_wopay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vlAbsUndWoPay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `slEarned` decimal(6,3) NOT NULL DEFAULT 0.000,
  `slAbsUndWPay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `slPreBalance` decimal(6,3) NOT NULL DEFAULT 0.000,
  `slBalance` decimal(6,3) NOT NULL DEFAULT 0.000,
  `slAbsUndWoPay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vlWoPayAmount` decimal(10,0) NOT NULL DEFAULT 0,
  `slWoPayAmount` decimal(10,0) NOT NULL DEFAULT 0,
  `nodays_awol` int(11) NOT NULL DEFAULT 0,
  `nodays_absent` int(11) NOT NULL DEFAULT 0,
  `nodays_present` int(11) DEFAULT 0,
  `nodays_actualpresent` int(11) NOT NULL DEFAULT 0,
  `nodays_vl` int(11) DEFAULT 0,
  `nodays_sl` int(11) DEFAULT 0,
  `nodays_undertime` int(2) NOT NULL DEFAULT 0,
  `totalTardyHour` int(3) NOT NULL DEFAULT 0,
  `totalTardyMinute` int(3) NOT NULL DEFAULT 0,
  `setAsDeduction` char(1) NOT NULL DEFAULT '0',
  `excess` varchar(20) NOT NULL DEFAULT '0.000000',
  `off_bal` int(10) NOT NULL DEFAULT 0,
  `off_gain` int(10) NOT NULL DEFAULT 0,
  `off_used` int(10) NOT NULL DEFAULT 0,
  `flBalance` int(2) NOT NULL DEFAULT 0,
  `flPreBalance` int(2) NOT NULL DEFAULT 0,
  `plBalance` int(2) NOT NULL DEFAULT 0,
  `plPreBalance` int(2) NOT NULL DEFAULT 0,
  `mtlBalance` int(2) NOT NULL DEFAULT 0,
  `mtlPreBalance` int(2) NOT NULL DEFAULT 0,
  `ptlBalance` int(2) NOT NULL DEFAULT 0,
  `ptlPreBalance` int(2) NOT NULL DEFAULT 0,
  `stlBalance` int(2) NOT NULL DEFAULT 0,
  `stlPreBalance` int(2) NOT NULL DEFAULT 0,
  `numOfPerdiem` int(11) NOT NULL DEFAULT 0,
  `ctr_8h` int(11) NOT NULL DEFAULT 0,
  `ctr_6h` int(11) NOT NULL DEFAULT 0,
  `ctr_5h` int(11) NOT NULL DEFAULT 0,
  `ctr_4h` int(11) NOT NULL DEFAULT 0,
  `ctr_wmeal` int(11) NOT NULL DEFAULT 0,
  `ctr_diem` decimal(10,2) NOT NULL DEFAULT 0.00,
  `ctr_laundry` int(11) NOT NULL,
  `processBy` varchar(20) NOT NULL DEFAULT '',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `processDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`lb_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblEmpLeaveBalance_w/Dec2016
#

DROP TABLE IF EXISTS `tblEmpLeaveBalance_w/Dec2016`;

CREATE TABLE `tblEmpLeaveBalance_w/Dec2016` (
  `lb_id` int(11) NOT NULL AUTO_INCREMENT,
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '0',
  `periodMonth` int(2) NOT NULL DEFAULT 0,
  `periodYear` year(4) NOT NULL DEFAULT 0000,
  `vlEarned` decimal(6,3) NOT NULL DEFAULT 0.000,
  `trut_notimes` int(10) NOT NULL DEFAULT 0,
  `trut_totalminutes` varchar(20) NOT NULL DEFAULT '',
  `vltrut_wpay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vl_wpay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vlAbsUndWPay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vlPreBalance` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vlBalance` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vltrut_wopay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vl_wopay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vlAbsUndWoPay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `slEarned` decimal(6,3) NOT NULL DEFAULT 0.000,
  `slAbsUndWPay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `slPreBalance` decimal(6,3) NOT NULL DEFAULT 0.000,
  `slBalance` decimal(6,3) NOT NULL DEFAULT 0.000,
  `slAbsUndWoPay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vlWoPayAmount` decimal(10,0) NOT NULL DEFAULT 0,
  `slWoPayAmount` decimal(10,0) NOT NULL DEFAULT 0,
  `nodays_awol` int(11) NOT NULL DEFAULT 0,
  `nodays_absent` int(11) NOT NULL DEFAULT 0,
  `nodays_present` int(11) DEFAULT 0,
  `nodays_actualpresent` int(11) NOT NULL DEFAULT 0,
  `nodays_vl` int(11) DEFAULT 0,
  `nodays_sl` int(11) DEFAULT 0,
  `nodays_undertime` int(2) NOT NULL DEFAULT 0,
  `totalTardyHour` int(3) NOT NULL DEFAULT 0,
  `totalTardyMinute` int(3) NOT NULL DEFAULT 0,
  `setAsDeduction` char(1) NOT NULL DEFAULT '0',
  `excess` varchar(20) NOT NULL DEFAULT '0.000000',
  `off_bal` int(10) NOT NULL DEFAULT 0,
  `off_gain` int(10) NOT NULL DEFAULT 0,
  `off_used` int(10) NOT NULL DEFAULT 0,
  `flBalance` int(2) NOT NULL DEFAULT 0,
  `flPreBalance` int(2) NOT NULL DEFAULT 0,
  `plBalance` int(2) NOT NULL DEFAULT 0,
  `plPreBalance` int(2) NOT NULL DEFAULT 0,
  `mtlBalance` int(2) NOT NULL DEFAULT 0,
  `mtlPreBalance` int(2) NOT NULL DEFAULT 0,
  `ptlBalance` int(2) NOT NULL DEFAULT 0,
  `ptlPreBalance` int(2) NOT NULL DEFAULT 0,
  `stlBalance` int(2) NOT NULL DEFAULT 0,
  `stlPreBalance` int(2) NOT NULL DEFAULT 0,
  `numOfPerdiem` int(11) NOT NULL DEFAULT 0,
  `ctr_8h` int(11) NOT NULL DEFAULT 0,
  `ctr_6h` int(11) NOT NULL DEFAULT 0,
  `ctr_5h` int(11) NOT NULL DEFAULT 0,
  `ctr_4h` int(11) NOT NULL DEFAULT 0,
  `ctr_wmeal` int(11) NOT NULL DEFAULT 0,
  `ctr_diem` decimal(10,2) NOT NULL DEFAULT 0.00,
  `ctr_laundry` int(11) NOT NULL,
  `processBy` varchar(20) NOT NULL DEFAULT '',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `processDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`lb_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblEmpLeaveBalance_w/o_Nov2016
#

DROP TABLE IF EXISTS `tblEmpLeaveBalance_w/o_Nov2016`;

CREATE TABLE `tblEmpLeaveBalance_w/o_Nov2016` (
  `lb_id` int(11) NOT NULL AUTO_INCREMENT,
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '0',
  `periodMonth` int(2) NOT NULL DEFAULT 0,
  `periodYear` year(4) NOT NULL DEFAULT 0000,
  `vlEarned` decimal(6,3) NOT NULL DEFAULT 0.000,
  `trut_notimes` int(10) NOT NULL DEFAULT 0,
  `trut_totalminutes` varchar(20) NOT NULL DEFAULT '',
  `vltrut_wpay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vl_wpay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vlAbsUndWPay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vlPreBalance` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vlBalance` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vltrut_wopay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vl_wopay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vlAbsUndWoPay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `slEarned` decimal(6,3) NOT NULL DEFAULT 0.000,
  `slAbsUndWPay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `slPreBalance` decimal(6,3) NOT NULL DEFAULT 0.000,
  `slBalance` decimal(6,3) NOT NULL DEFAULT 0.000,
  `slAbsUndWoPay` decimal(6,3) NOT NULL DEFAULT 0.000,
  `vlWoPayAmount` decimal(10,0) NOT NULL DEFAULT 0,
  `slWoPayAmount` decimal(10,0) NOT NULL DEFAULT 0,
  `nodays_awol` int(11) NOT NULL DEFAULT 0,
  `nodays_absent` int(11) NOT NULL DEFAULT 0,
  `nodays_present` int(11) DEFAULT 0,
  `nodays_actualpresent` int(11) NOT NULL DEFAULT 0,
  `nodays_vl` int(11) DEFAULT 0,
  `nodays_sl` int(11) DEFAULT 0,
  `nodays_undertime` int(2) NOT NULL DEFAULT 0,
  `totalTardyHour` int(3) NOT NULL DEFAULT 0,
  `totalTardyMinute` int(3) NOT NULL DEFAULT 0,
  `setAsDeduction` char(1) NOT NULL DEFAULT '0',
  `excess` varchar(20) NOT NULL DEFAULT '0.000000',
  `off_bal` int(10) NOT NULL DEFAULT 0,
  `off_gain` int(10) NOT NULL DEFAULT 0,
  `off_used` int(10) NOT NULL DEFAULT 0,
  `flBalance` int(2) NOT NULL DEFAULT 0,
  `flPreBalance` int(2) NOT NULL DEFAULT 0,
  `plBalance` int(2) NOT NULL DEFAULT 0,
  `plPreBalance` int(2) NOT NULL DEFAULT 0,
  `mtlBalance` int(2) NOT NULL DEFAULT 0,
  `mtlPreBalance` int(2) NOT NULL DEFAULT 0,
  `ptlBalance` int(2) NOT NULL DEFAULT 0,
  `ptlPreBalance` int(2) NOT NULL DEFAULT 0,
  `stlBalance` int(2) NOT NULL DEFAULT 0,
  `stlPreBalance` int(2) NOT NULL DEFAULT 0,
  `numOfPerdiem` int(11) NOT NULL DEFAULT 0,
  `ctr_8h` int(11) NOT NULL DEFAULT 0,
  `ctr_6h` int(11) NOT NULL DEFAULT 0,
  `ctr_5h` int(11) NOT NULL DEFAULT 0,
  `ctr_4h` int(11) NOT NULL DEFAULT 0,
  `ctr_wmeal` int(11) NOT NULL DEFAULT 0,
  `ctr_laundry` int(11) NOT NULL,
  `processBy` varchar(20) NOT NULL DEFAULT '',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `processDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`lb_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblEmpLocalHoliday
#

DROP TABLE IF EXISTS `tblEmpLocalHoliday`;

CREATE TABLE `tblEmpLocalHoliday` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `holidayCode` varchar(20) NOT NULL DEFAULT '',
  `empNumber` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblEmpLongevity
#

DROP TABLE IF EXISTS `tblEmpLongevity`;

CREATE TABLE `tblEmpLongevity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empNumber` varchar(20) NOT NULL DEFAULT '',
  `longiDate` date NOT NULL DEFAULT '0000-00-00',
  `longiAmount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `longiPercent` int(2) NOT NULL DEFAULT 0,
  `longiPay` decimal(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblEmpMealDetails
#

DROP TABLE IF EXISTS `tblEmpMealDetails`;

CREATE TABLE `tblEmpMealDetails` (
  `processID` int(11) NOT NULL DEFAULT 0,
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `incomeCode` varchar(12) NOT NULL DEFAULT '',
  `mealAmount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `incomeYear` year(4) NOT NULL DEFAULT 0000,
  `incomeMonth` int(2) NOT NULL DEFAULT 0,
  `noOfDays` int(11) NOT NULL DEFAULT 0,
  `datesCovered` text NOT NULL,
  `incomeAmount` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblEmpMeeting
#

DROP TABLE IF EXISTS `tblEmpMeeting`;

CREATE TABLE `tblEmpMeeting` (
  `meetingID` int(11) NOT NULL AUTO_INCREMENT,
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `dateFiled` date NOT NULL DEFAULT '0000-00-00',
  `meetingTitle` text NOT NULL,
  `meetingDate` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`meetingID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblEmpMonetization
#

DROP TABLE IF EXISTS `tblEmpMonetization`;

CREATE TABLE `tblEmpMonetization` (
  `mon_id` int(11) NOT NULL AUTO_INCREMENT,
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `vlMonetize` decimal(5,3) NOT NULL DEFAULT 0.000,
  `slMonetize` decimal(5,3) NOT NULL DEFAULT 0.000,
  `processMonth` int(2) NOT NULL DEFAULT 0,
  `processYear` int(4) NOT NULL DEFAULT 0,
  `monetizeMonth` int(2) NOT NULL DEFAULT 0,
  `monetizeYear` year(4) NOT NULL DEFAULT 0000,
  `monetizeAmount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `processBy` varchar(20) NOT NULL DEFAULT '',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `processDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`mon_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblEmpNetPay
#

DROP TABLE IF EXISTS `tblEmpNetPay`;

CREATE TABLE `tblEmpNetPay` (
  `periodMonth` int(11) NOT NULL DEFAULT 0,
  `periodYear` int(11) NOT NULL DEFAULT 0,
  `empNumber` varchar(20) NOT NULL DEFAULT '',
  `period1` decimal(10,2) NOT NULL DEFAULT 0.00,
  `period2` decimal(10,2) NOT NULL DEFAULT 0.00,
  `period3` decimal(10,2) NOT NULL DEFAULT 0.00,
  `period4` decimal(10,2) NOT NULL DEFAULT 0.00,
  UNIQUE KEY `uid` (`periodMonth`,`periodYear`,`empNumber`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblEmpOB
#

DROP TABLE IF EXISTS `tblEmpOB`;

CREATE TABLE `tblEmpOB` (
  `obID` int(11) NOT NULL AUTO_INCREMENT,
  `dateFiled` date NOT NULL DEFAULT '0000-00-00',
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `requestID` varchar(10) NOT NULL DEFAULT '',
  `obDateFrom` date NOT NULL DEFAULT '0000-00-00',
  `obDateTo` date NOT NULL DEFAULT '0000-00-00',
  `obTimeFrom` varchar(11) NOT NULL DEFAULT '00:00:00 AM',
  `obTimeTo` varchar(11) NOT NULL DEFAULT '00:00:00 AM',
  `obPlace` varchar(100) NOT NULL DEFAULT '',
  `obMeal` char(1) NOT NULL DEFAULT '',
  `purpose` text NOT NULL,
  `official` char(1) NOT NULL DEFAULT 'N',
  `approveRequest` char(1) NOT NULL DEFAULT 'N',
  `approveChief` char(1) NOT NULL DEFAULT 'N',
  `approveHR` char(1) NOT NULL DEFAULT 'N',
  `is_override` int(11) DEFAULT NULL,
  PRIMARY KEY (`obID`),
  KEY `obDateFrom` (`obDateFrom`),
  KEY `obDateTo` (`obDateTo`),
  KEY `empNumber` (`empNumber`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblEmpOTDetails
#

DROP TABLE IF EXISTS `tblEmpOTDetails`;

CREATE TABLE `tblEmpOTDetails` (
  `processID` int(11) NOT NULL DEFAULT 0,
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `incomeYear` year(4) NOT NULL DEFAULT 0000,
  `incomeMonth` int(2) NOT NULL DEFAULT 0,
  `actualSalary` decimal(10,2) NOT NULL DEFAULT 0.00,
  `wdNoHrs` int(11) NOT NULL DEFAULT 0,
  `wdNoMins` int(11) NOT NULL DEFAULT 0,
  `weNoHrs` int(11) NOT NULL DEFAULT 0,
  `weNoMins` int(11) NOT NULL DEFAULT 0,
  `ratePerHr` decimal(10,2) NOT NULL DEFAULT 0.00,
  `ratePerMin` decimal(10,2) NOT NULL DEFAULT 0.00,
  `wdGrossHr` decimal(10,2) NOT NULL DEFAULT 0.00,
  `wdGrossMin` decimal(10,2) NOT NULL DEFAULT 0.00,
  `weGrossHr` decimal(10,2) NOT NULL DEFAULT 0.00,
  `weGrossMin` decimal(10,2) NOT NULL DEFAULT 0.00,
  `earnedPeriod` decimal(10,2) NOT NULL DEFAULT 0.00,
  `percent` int(11) NOT NULL DEFAULT 0,
  `ITW` decimal(10,2) NOT NULL DEFAULT 0.00,
  `adjustment` decimal(10,2) NOT NULL DEFAULT 0.00,
  `incomeAmount` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblEmpOtherSched
#

DROP TABLE IF EXISTS `tblEmpOtherSched`;

CREATE TABLE `tblEmpOtherSched` (
  `rec_ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `empNumber` varchar(20) NOT NULL DEFAULT '0',
  `fromDate` date NOT NULL DEFAULT '0000-00-00',
  `toDate` date NOT NULL DEFAULT '0000-00-00',
  `schemeCode` varchar(5) NOT NULL DEFAULT '',
  PRIMARY KEY (`rec_ID`),
  KEY `idx_empNumber` (`empNumber`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblEmpOvertime
#

DROP TABLE IF EXISTS `tblEmpOvertime`;

CREATE TABLE `tblEmpOvertime` (
  `otID` int(11) NOT NULL AUTO_INCREMENT,
  `dateFiled` date NOT NULL DEFAULT '0000-00-00',
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `otPurpose` text NOT NULL,
  `otOutput` text NOT NULL,
  `docNumber` varchar(15) NOT NULL DEFAULT '',
  `otDateFrom` date NOT NULL DEFAULT '0000-00-00',
  `otDateTo` date NOT NULL DEFAULT '0000-00-00',
  `otTimeFrom` varchar(11) NOT NULL DEFAULT '00:00:00 AM',
  `otTimeTo` varchar(11) NOT NULL DEFAULT '00:00:00 AM',
  PRIMARY KEY (`otID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblEmpPersonal
#

DROP TABLE IF EXISTS `tblEmpPersonal`;

CREATE TABLE `tblEmpPersonal` (
  `empID` int(11) NOT NULL AUTO_INCREMENT,
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `surname` varchar(50) NOT NULL DEFAULT '',
  `firstname` varchar(50) NOT NULL DEFAULT '',
  `middlename` varchar(50) NOT NULL DEFAULT '',
  `middleInitial` varchar(10) DEFAULT NULL,
  `nameExtension` varchar(10) DEFAULT '',
  `salutation` varchar(15) NOT NULL,
  `sex` char(1) NOT NULL DEFAULT 'M',
  `civilStatus` varchar(20) NOT NULL DEFAULT 'Single',
  `spouse` varchar(80) NOT NULL DEFAULT '',
  `spouseSurname` varchar(80) NOT NULL,
  `spouseFirstname` varchar(80) NOT NULL,
  `spouseMiddlename` varchar(80) NOT NULL,
  `spousenameExtension` varchar(80) NOT NULL,
  `spouseWork` varchar(50) NOT NULL DEFAULT '',
  `spouseBusName` varchar(70) NOT NULL DEFAULT '',
  `spouseBusAddress` text DEFAULT NULL,
  `spouseTelephone` varchar(10) DEFAULT NULL,
  `tin` varchar(20) DEFAULT NULL,
  `citizenship` varchar(10) NOT NULL DEFAULT '',
  `dualCitizenshipType` varchar(20) NOT NULL,
  `dualCitizenshipCountryId` int(11) NOT NULL,
  `birthday` date NOT NULL DEFAULT '0000-00-00',
  `birthPlace` varchar(80) NOT NULL DEFAULT '',
  `bloodType` varchar(6) DEFAULT NULL,
  `height` decimal(5,2) NOT NULL DEFAULT 0.00,
  `weight` decimal(5,2) NOT NULL DEFAULT 0.00,
  `residentialAddress` text DEFAULT NULL,
  `lot1` varchar(10) NOT NULL,
  `street1` varchar(50) NOT NULL,
  `subdivision1` varchar(50) NOT NULL,
  `barangay1` varchar(50) NOT NULL,
  `city1` varchar(50) NOT NULL,
  `province1` varchar(50) NOT NULL,
  `zipCode1` int(4) DEFAULT NULL,
  `telephone1` varchar(20) DEFAULT NULL,
  `permanentAddress` text DEFAULT NULL,
  `lot2` varchar(10) NOT NULL,
  `street2` varchar(50) NOT NULL,
  `subdivision2` varchar(50) NOT NULL,
  `barangay2` varchar(50) NOT NULL,
  `city2` varchar(50) NOT NULL,
  `province2` varchar(50) NOT NULL,
  `zipCode2` int(4) DEFAULT NULL,
  `telephone2` varchar(20) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `fatherName` varchar(80) NOT NULL DEFAULT '',
  `fatherSurname` varchar(80) NOT NULL,
  `fatherFirstname` varchar(80) NOT NULL,
  `fatherMiddlename` varchar(80) NOT NULL,
  `fathernameExtension` varchar(80) NOT NULL,
  `motherName` varchar(80) NOT NULL DEFAULT '',
  `motherSurname` varchar(80) NOT NULL,
  `motherFirstname` varchar(80) NOT NULL,
  `motherMiddlename` varchar(80) NOT NULL,
  `parentAddress` text DEFAULT NULL,
  `skills` text NOT NULL,
  `nadr` text DEFAULT NULL,
  `miao` text DEFAULT NULL,
  `relatedThird` char(1) DEFAULT NULL,
  `relatedDegreeParticularsThird` text DEFAULT NULL,
  `relatedFourth` char(1) DEFAULT NULL,
  `relatedDegreeParticulars` text DEFAULT NULL,
  `violateLaw` char(1) DEFAULT NULL,
  `violateLawParticulars` text DEFAULT NULL,
  `formallyCharged` char(1) DEFAULT NULL,
  `formallyChargedParticulars` text DEFAULT NULL,
  `adminCase` char(1) DEFAULT NULL,
  `adminCaseParticulars` text DEFAULT NULL,
  `forcedResign` char(1) DEFAULT NULL,
  `forcedResignParticulars` text DEFAULT NULL,
  `candidate` char(1) DEFAULT NULL,
  `candidateParticulars` text DEFAULT NULL,
  `campaign` char(1) NOT NULL,
  `campaignParticulars` text NOT NULL,
  `immigrant` char(1) NOT NULL,
  `immigrantParticulars` text NOT NULL,
  `indigenous` char(1) DEFAULT NULL,
  `indigenousParticulars` text DEFAULT NULL,
  `disabled` char(1) DEFAULT NULL,
  `disabledParticulars` text DEFAULT NULL,
  `soloParent` char(1) DEFAULT NULL,
  `soloParentParticulars` text DEFAULT NULL,
  `signature` varchar(50) NOT NULL DEFAULT '',
  `dateAccomplished` date DEFAULT '0000-00-00',
  `comTaxNumber` varchar(10) NOT NULL DEFAULT '',
  `issuedAt` varchar(50) DEFAULT NULL,
  `issuedOn` date NOT NULL DEFAULT '0000-00-00',
  `gsisNumber` varchar(25) DEFAULT NULL,
  `businessPartnerNumber` varchar(25) NOT NULL,
  `philHealthNumber` varchar(14) DEFAULT NULL,
  `sssNumber` varchar(20) DEFAULT '',
  `pagibigNumber` varchar(14) DEFAULT NULL,
  `AccountNum` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`empNumber`),
  KEY `Emp_No` (`empNumber`),
  KEY `empID` (`empID`),
  FULLTEXT KEY `surname` (`surname`)
) ENGINE=MyISAM AUTO_INCREMENT=203 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblEmpPersonal` (`empID`, `empNumber`, `surname`, `firstname`, `middlename`, `middleInitial`, `nameExtension`, `salutation`, `sex`, `civilStatus`, `spouse`, `spouseSurname`, `spouseFirstname`, `spouseMiddlename`, `spousenameExtension`, `spouseWork`, `spouseBusName`, `spouseBusAddress`, `spouseTelephone`, `tin`, `citizenship`, `dualCitizenshipType`, `dualCitizenshipCountryId`, `birthday`, `birthPlace`, `bloodType`, `height`, `weight`, `residentialAddress`, `lot1`, `street1`, `subdivision1`, `barangay1`, `city1`, `province1`, `zipCode1`, `telephone1`, `permanentAddress`, `lot2`, `street2`, `subdivision2`, `barangay2`, `city2`, `province2`, `zipCode2`, `telephone2`, `mobile`, `email`, `fatherName`, `fatherSurname`, `fatherFirstname`, `fatherMiddlename`, `fathernameExtension`, `motherName`, `motherSurname`, `motherFirstname`, `motherMiddlename`, `parentAddress`, `skills`, `nadr`, `miao`, `relatedThird`, `relatedDegreeParticularsThird`, `relatedFourth`, `relatedDegreeParticulars`, `violateLaw`, `violateLawParticulars`, `formallyCharged`, `formallyChargedParticulars`, `adminCase`, `adminCaseParticulars`, `forcedResign`, `forcedResignParticulars`, `candidate`, `candidateParticulars`, `campaign`, `campaignParticulars`, `immigrant`, `immigrantParticulars`, `indigenous`, `indigenousParticulars`, `disabled`, `disabledParticulars`, `soloParent`, `soloParentParticulars`, `signature`, `dateAccomplished`, `comTaxNumber`, `issuedAt`, `issuedOn`, `gsisNumber`, `businessPartnerNumber`, `philHealthNumber`, `sssNumber`, `pagibigNumber`, `AccountNum`) VALUES ('1', '1111', 'HRMIS', 'ADMIN', '', NULL, '', '', 'M', 'Single', '', '', '', '', '', '', '', NULL, NULL, NULL, '', '', '0', '0000-00-00', '', NULL, '0.00', '0.00', NULL, '', '', '', '', '', '', NULL, NULL, NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '0000-00-00', '', NULL, '0000-00-00', NULL, '', NULL, '', NULL, NULL);
INSERT INTO `tblEmpPersonal` (`empID`, `empNumber`, `surname`, `firstname`, `middlename`, `middleInitial`, `nameExtension`, `salutation`, `sex`, `civilStatus`, `spouse`, `spouseSurname`, `spouseFirstname`, `spouseMiddlename`, `spousenameExtension`, `spouseWork`, `spouseBusName`, `spouseBusAddress`, `spouseTelephone`, `tin`, `citizenship`, `dualCitizenshipType`, `dualCitizenshipCountryId`, `birthday`, `birthPlace`, `bloodType`, `height`, `weight`, `residentialAddress`, `lot1`, `street1`, `subdivision1`, `barangay1`, `city1`, `province1`, `zipCode1`, `telephone1`, `permanentAddress`, `lot2`, `street2`, `subdivision2`, `barangay2`, `city2`, `province2`, `zipCode2`, `telephone2`, `mobile`, `email`, `fatherName`, `fatherSurname`, `fatherFirstname`, `fatherMiddlename`, `fathernameExtension`, `motherName`, `motherSurname`, `motherFirstname`, `motherMiddlename`, `parentAddress`, `skills`, `nadr`, `miao`, `relatedThird`, `relatedDegreeParticularsThird`, `relatedFourth`, `relatedDegreeParticulars`, `violateLaw`, `violateLawParticulars`, `formallyCharged`, `formallyChargedParticulars`, `adminCase`, `adminCaseParticulars`, `forcedResign`, `forcedResignParticulars`, `candidate`, `candidateParticulars`, `campaign`, `campaignParticulars`, `immigrant`, `immigrantParticulars`, `indigenous`, `indigenousParticulars`, `disabled`, `disabledParticulars`, `soloParent`, `soloParentParticulars`, `signature`, `dateAccomplished`, `comTaxNumber`, `issuedAt`, `issuedOn`, `gsisNumber`, `businessPartnerNumber`, `philHealthNumber`, `sssNumber`, `pagibigNumber`, `AccountNum`) VALUES ('202', 'PE-FND070117', 'DELA ROSA', 'FRANK ALBERT', 'NAVARRO', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, '', '', '', '0', '0000-00-00', '', '', '0.00', '0.00', NULL, '', '', '', '', '', '', '0', '', NULL, '', '', '', '', '', '', '0', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '0000-00-00', '', NULL, '0000-00-00', '', '', '', '', '', '');
INSERT INTO `tblEmpPersonal` (`empID`, `empNumber`, `surname`, `firstname`, `middlename`, `middleInitial`, `nameExtension`, `salutation`, `sex`, `civilStatus`, `spouse`, `spouseSurname`, `spouseFirstname`, `spouseMiddlename`, `spousenameExtension`, `spouseWork`, `spouseBusName`, `spouseBusAddress`, `spouseTelephone`, `tin`, `citizenship`, `dualCitizenshipType`, `dualCitizenshipCountryId`, `birthday`, `birthPlace`, `bloodType`, `height`, `weight`, `residentialAddress`, `lot1`, `street1`, `subdivision1`, `barangay1`, `city1`, `province1`, `zipCode1`, `telephone1`, `permanentAddress`, `lot2`, `street2`, `subdivision2`, `barangay2`, `city2`, `province2`, `zipCode2`, `telephone2`, `mobile`, `email`, `fatherName`, `fatherSurname`, `fatherFirstname`, `fatherMiddlename`, `fathernameExtension`, `motherName`, `motherSurname`, `motherFirstname`, `motherMiddlename`, `parentAddress`, `skills`, `nadr`, `miao`, `relatedThird`, `relatedDegreeParticularsThird`, `relatedFourth`, `relatedDegreeParticulars`, `violateLaw`, `violateLawParticulars`, `formallyCharged`, `formallyChargedParticulars`, `adminCase`, `adminCaseParticulars`, `forcedResign`, `forcedResignParticulars`, `candidate`, `candidateParticulars`, `campaign`, `campaignParticulars`, `immigrant`, `immigrantParticulars`, `indigenous`, `indigenousParticulars`, `disabled`, `disabledParticulars`, `soloParent`, `soloParentParticulars`, `signature`, `dateAccomplished`, `comTaxNumber`, `issuedAt`, `issuedOn`, `gsisNumber`, `businessPartnerNumber`, `philHealthNumber`, `sssNumber`, `pagibigNumber`, `AccountNum`) VALUES ('201', 'EO-RQB0000', 'COSICO', 'RONALD', 'BAGUE', '', '', 'Hon.', 'M', 'Married', '', '', '', '', '', '', '', NULL, NULL, '', 'Filipino', '', '0', '0000-00-00', '', '', '0.00', '0.00', NULL, '', '', '', '', '', '', '0', '', NULL, '', '', '', '', '', '', '0', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '0000-00-00', '', NULL, '0000-00-00', '', '', '', '', '', '');
INSERT INTO `tblEmpPersonal` (`empID`, `empNumber`, `surname`, `firstname`, `middlename`, `middleInitial`, `nameExtension`, `salutation`, `sex`, `civilStatus`, `spouse`, `spouseSurname`, `spouseFirstname`, `spouseMiddlename`, `spousenameExtension`, `spouseWork`, `spouseBusName`, `spouseBusAddress`, `spouseTelephone`, `tin`, `citizenship`, `dualCitizenshipType`, `dualCitizenshipCountryId`, `birthday`, `birthPlace`, `bloodType`, `height`, `weight`, `residentialAddress`, `lot1`, `street1`, `subdivision1`, `barangay1`, `city1`, `province1`, `zipCode1`, `telephone1`, `permanentAddress`, `lot2`, `street2`, `subdivision2`, `barangay2`, `city2`, `province2`, `zipCode2`, `telephone2`, `mobile`, `email`, `fatherName`, `fatherSurname`, `fatherFirstname`, `fatherMiddlename`, `fathernameExtension`, `motherName`, `motherSurname`, `motherFirstname`, `motherMiddlename`, `parentAddress`, `skills`, `nadr`, `miao`, `relatedThird`, `relatedDegreeParticularsThird`, `relatedFourth`, `relatedDegreeParticulars`, `violateLaw`, `violateLawParticulars`, `formallyCharged`, `formallyChargedParticulars`, `adminCase`, `adminCaseParticulars`, `forcedResign`, `forcedResignParticulars`, `candidate`, `candidateParticulars`, `campaign`, `campaignParticulars`, `immigrant`, `immigrantParticulars`, `indigenous`, `indigenousParticulars`, `disabled`, `disabledParticulars`, `soloParent`, `soloParentParticulars`, `signature`, `dateAccomplished`, `comTaxNumber`, `issuedAt`, `issuedOn`, `gsisNumber`, `businessPartnerNumber`, `philHealthNumber`, `sssNumber`, `pagibigNumber`, `AccountNum`) VALUES ('200', 'PE-MGR020106', 'REYES', 'MARITESS', 'GUERRERO', '', '', '', 'F', 'Single', '', '', '', '', '', '', '', NULL, NULL, '289990974', 'Filipino', '', '0', '1985-09-10', 'Libmanan', 'O+', '5.50', '80.00', NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '', '', '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '0000-00-00', '', NULL, '0000-00-00', '2003954245', '', '08-000090120-6', '0', '121012199542', '0');


#
# TABLE STRUCTURE FOR: tblEmpPersonalx
#

DROP TABLE IF EXISTS `tblEmpPersonalx`;

CREATE TABLE `tblEmpPersonalx` (
  `empID` int(11) NOT NULL AUTO_INCREMENT,
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `surname` varchar(50) NOT NULL DEFAULT '',
  `firstname` varchar(50) NOT NULL DEFAULT '',
  `middlename` varchar(50) NOT NULL DEFAULT '',
  `middleInitial` varchar(10) DEFAULT NULL,
  `nameExtension` varchar(10) DEFAULT '',
  `salutation` varchar(15) NOT NULL,
  `sex` char(1) NOT NULL DEFAULT 'M',
  `civilStatus` varchar(20) NOT NULL DEFAULT 'Single',
  `spouse` varchar(80) NOT NULL DEFAULT '',
  `spouseSurname` varchar(80) NOT NULL,
  `spouseFirstname` varchar(80) NOT NULL,
  `spouseMiddlename` varchar(80) NOT NULL,
  `spousenameExtension` varchar(80) NOT NULL,
  `spouseWork` varchar(50) NOT NULL DEFAULT '',
  `spouseBusName` varchar(70) NOT NULL DEFAULT '',
  `spouseBusAddress` text DEFAULT NULL,
  `spouseTelephone` varchar(10) DEFAULT NULL,
  `tin` varchar(20) DEFAULT NULL,
  `citizenship` varchar(10) NOT NULL DEFAULT '',
  `dualCitizenshipType` varchar(20) NOT NULL,
  `dualCitizenshipCountryId` int(11) NOT NULL,
  `birthday` date NOT NULL DEFAULT '0000-00-00',
  `birthPlace` varchar(80) NOT NULL DEFAULT '',
  `bloodType` varchar(6) DEFAULT NULL,
  `height` decimal(5,2) NOT NULL DEFAULT 0.00,
  `weight` decimal(5,2) NOT NULL DEFAULT 0.00,
  `residentialAddress` text DEFAULT NULL,
  `lot1` varchar(10) NOT NULL,
  `street1` varchar(50) NOT NULL,
  `subdivision1` varchar(50) NOT NULL,
  `barangay1` varchar(50) NOT NULL,
  `city1` varchar(50) NOT NULL,
  `province1` varchar(50) NOT NULL,
  `zipCode1` int(4) DEFAULT NULL,
  `telephone1` varchar(20) DEFAULT NULL,
  `permanentAddress` text DEFAULT NULL,
  `lot2` varchar(10) NOT NULL,
  `street2` varchar(50) NOT NULL,
  `subdivision2` varchar(50) NOT NULL,
  `barangay2` varchar(50) NOT NULL,
  `city2` varchar(50) NOT NULL,
  `province2` varchar(50) NOT NULL,
  `zipCode2` int(4) DEFAULT NULL,
  `telephone2` varchar(20) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `fatherName` varchar(80) NOT NULL DEFAULT '',
  `fatherSurname` varchar(80) NOT NULL,
  `fatherFirstname` varchar(80) NOT NULL,
  `fatherMiddlename` varchar(80) NOT NULL,
  `fathernameExtension` varchar(80) NOT NULL,
  `motherName` varchar(80) NOT NULL DEFAULT '',
  `motherSurname` varchar(80) NOT NULL,
  `motherFirstname` varchar(80) NOT NULL,
  `motherMiddlename` varchar(80) NOT NULL,
  `parentAddress` text DEFAULT NULL,
  `skills` text NOT NULL,
  `nadr` text DEFAULT NULL,
  `miao` text DEFAULT NULL,
  `relatedThird` char(1) DEFAULT NULL,
  `relatedDegreeParticularsThird` text DEFAULT NULL,
  `relatedFourth` char(1) DEFAULT NULL,
  `relatedDegreeParticulars` text DEFAULT NULL,
  `violateLaw` char(1) DEFAULT NULL,
  `violateLawParticulars` text DEFAULT NULL,
  `formallyCharged` char(1) DEFAULT NULL,
  `formallyChargedParticulars` text DEFAULT NULL,
  `adminCase` char(1) DEFAULT NULL,
  `adminCaseParticulars` text DEFAULT NULL,
  `forcedResign` char(1) DEFAULT NULL,
  `forcedResignParticulars` text DEFAULT NULL,
  `candidate` char(1) DEFAULT NULL,
  `candidateParticulars` text DEFAULT NULL,
  `campaign` char(1) NOT NULL,
  `campaignParticulars` text NOT NULL,
  `immigrant` char(1) NOT NULL,
  `immigrantParticulars` text NOT NULL,
  `indigenous` char(1) DEFAULT NULL,
  `indigenousParticulars` text DEFAULT NULL,
  `disabled` char(1) DEFAULT NULL,
  `disabledParticulars` text DEFAULT NULL,
  `soloParent` char(1) DEFAULT NULL,
  `soloParentParticulars` text DEFAULT NULL,
  `signature` varchar(50) NOT NULL DEFAULT '',
  `dateAccomplished` date DEFAULT '0000-00-00',
  `comTaxNumber` varchar(10) NOT NULL DEFAULT '',
  `issuedAt` varchar(50) DEFAULT NULL,
  `issuedOn` date NOT NULL DEFAULT '0000-00-00',
  `gsisNumber` varchar(25) DEFAULT NULL,
  `businessPartnerNumber` varchar(25) NOT NULL,
  `philHealthNumber` varchar(14) DEFAULT NULL,
  `sssNumber` varchar(20) DEFAULT '',
  `pagibigNumber` varchar(14) DEFAULT NULL,
  `AccountNum` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`empNumber`),
  KEY `Emp_No` (`empNumber`),
  KEY `empID` (`empID`),
  FULLTEXT KEY `surname` (`surname`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblEmpPosition
#

DROP TABLE IF EXISTS `tblEmpPosition`;

CREATE TABLE `tblEmpPosition` (
  `empNumber` varchar(30) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `appointmentCode` varchar(20) NOT NULL DEFAULT '',
  `statusOfAppointment` varchar(50) NOT NULL DEFAULT '',
  `positionCode` varchar(20) NOT NULL DEFAULT '',
  `serviceCode` varchar(20) NOT NULL DEFAULT '',
  `plantillaGroupCode` varchar(10) NOT NULL DEFAULT '',
  `divisionCode` varchar(20) NOT NULL DEFAULT '',
  `sectionCode` varchar(20) NOT NULL DEFAULT '',
  `taxStatCode` varchar(20) NOT NULL DEFAULT '',
  `itemNumber` varchar(50) NOT NULL DEFAULT '',
  `salaryGradeNumber` int(2) NOT NULL DEFAULT 0,
  `authorizeSalary` decimal(10,2) NOT NULL DEFAULT 0.00,
  `actualSalary` decimal(10,2) NOT NULL DEFAULT 0.00,
  `contractEndDate` date DEFAULT '0000-00-00',
  `effectiveDate` date NOT NULL DEFAULT '0000-00-00',
  `positionDate` date NOT NULL DEFAULT '0000-00-00',
  `longevityDate` date NOT NULL DEFAULT '0000-00-00',
  `longevityGap` decimal(4,2) DEFAULT 0.00,
  `firstDayAgency` date NOT NULL DEFAULT '0000-00-00',
  `firstDayGov` date NOT NULL DEFAULT '0000-00-00',
  `assignPlace` varchar(50) DEFAULT NULL,
  `stepNumber` int(2) NOT NULL DEFAULT 0,
  `dateIncremented` date NOT NULL DEFAULT '0000-00-00',
  `personnelAction` varchar(20) NOT NULL DEFAULT '',
  `employmentBasis` varchar(20) NOT NULL DEFAULT 'Fulltime',
  `categoryService` varchar(20) NOT NULL DEFAULT 'Career',
  `nature` varchar(20) NOT NULL DEFAULT 'Support',
  `hpFactor` decimal(2,0) NOT NULL DEFAULT 0,
  `longiFactor` decimal(2,0) DEFAULT 0,
  `payrollSwitch` char(1) NOT NULL DEFAULT 'N',
  `schemeCode` varchar(20) NOT NULL DEFAULT 'GEN',
  `itwSwitch` char(1) NOT NULL DEFAULT 'Y',
  `lifeRetSwitch` char(1) NOT NULL DEFAULT 'Y',
  `pagibigSwitch` char(1) NOT NULL DEFAULT 'Y',
  `philhealthSwitch` char(1) NOT NULL DEFAULT 'Y',
  `providentSwitch` char(1) NOT NULL DEFAULT '',
  `premiumAidSwitch` char(1) NOT NULL DEFAULT 'Y',
  `dtrSwitch` char(1) NOT NULL DEFAULT 'Y',
  `mcSwitch` char(1) NOT NULL DEFAULT 'Y',
  `hazardSwitch` char(1) NOT NULL DEFAULT 'Y',
  `longevitySwitch` char(1) NOT NULL DEFAULT 'Y',
  `PERASwitch` char(1) NOT NULL DEFAULT 'Y',
  `ADCOMSwitch` char(1) NOT NULL DEFAULT 'Y',
  `dependents` decimal(2,0) NOT NULL DEFAULT 0,
  `healthProvider` char(1) NOT NULL DEFAULT 'N',
  `tmpStepNumber` int(2) NOT NULL DEFAULT 0,
  `tmpActualSalary` decimal(10,2) NOT NULL DEFAULT 0.00,
  `tmpDateIncremented` date NOT NULL DEFAULT '0000-00-00',
  `tmpPositionDate` date NOT NULL DEFAULT '0000-00-00',
  `regularDedSwitch` char(1) NOT NULL DEFAULT '',
  `contriDedSwitch` char(1) NOT NULL DEFAULT '',
  `loanDedSwitch` char(1) NOT NULL DEFAULT '',
  `zonecode` varchar(20) NOT NULL DEFAULT '',
  `riceSwitch` char(1) NOT NULL DEFAULT '',
  `detailedfrom` char(1) NOT NULL DEFAULT '',
  `departmentcode` varchar(5) NOT NULL DEFAULT '',
  `groupCode` varchar(10) DEFAULT NULL,
  `firefighter` char(1) NOT NULL DEFAULT 'N',
  `security` char(1) NOT NULL DEFAULT 'N',
  `uniqueItemNumber` varchar(50) NOT NULL DEFAULT '',
  `physician` char(1) DEFAULT 'N',
  `officecode` varchar(20) NOT NULL DEFAULT '',
  `service` varchar(50) NOT NULL DEFAULT '',
  `payrollGroupCode` varchar(50) DEFAULT NULL,
  `taxAmount` decimal(10,2) DEFAULT 0.00,
  `hpTax` decimal(10,2) DEFAULT NULL,
  `lpTax` decimal(10,2) DEFAULT NULL,
  `laundrySwitch` char(1) NOT NULL DEFAULT 'Y',
  `addPAGIBIGContri` decimal(10,2) NOT NULL DEFAULT 0.00,
  `includeSecondment` int(1) NOT NULL DEFAULT 0,
  `group1` varchar(20) NOT NULL DEFAULT '',
  `group2` varchar(20) NOT NULL DEFAULT '',
  `group3` varchar(20) NOT NULL DEFAULT '',
  `group4` varchar(20) NOT NULL DEFAULT '',
  `group5` varchar(20) NOT NULL DEFAULT '',
  `RATACode` char(3) DEFAULT NULL,
  `RATAVehicle` char(1) DEFAULT NULL,
  `taxRate` int(2) DEFAULT NULL,
  `taxSwitch` char(1) NOT NULL,
  PRIMARY KEY (`empNumber`),
  KEY `AppointmentCode` (`appointmentCode`),
  KEY `DivisionCode` (`divisionCode`),
  KEY `Emp_No` (`empNumber`),
  KEY `PositionCode` (`positionCode`),
  KEY `SectionCode` (`sectionCode`),
  KEY `ServiceCode` (`serviceCode`),
  KEY `TaxStatusCode` (`taxStatCode`),
  KEY `idx_empNumber` (`empNumber`),
  FULLTEXT KEY `assignPlace` (`assignPlace`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblEmpPosition` (`empNumber`, `appointmentCode`, `statusOfAppointment`, `positionCode`, `serviceCode`, `plantillaGroupCode`, `divisionCode`, `sectionCode`, `taxStatCode`, `itemNumber`, `salaryGradeNumber`, `authorizeSalary`, `actualSalary`, `contractEndDate`, `effectiveDate`, `positionDate`, `longevityDate`, `longevityGap`, `firstDayAgency`, `firstDayGov`, `assignPlace`, `stepNumber`, `dateIncremented`, `personnelAction`, `employmentBasis`, `categoryService`, `nature`, `hpFactor`, `longiFactor`, `payrollSwitch`, `schemeCode`, `itwSwitch`, `lifeRetSwitch`, `pagibigSwitch`, `philhealthSwitch`, `providentSwitch`, `premiumAidSwitch`, `dtrSwitch`, `mcSwitch`, `hazardSwitch`, `longevitySwitch`, `PERASwitch`, `ADCOMSwitch`, `dependents`, `healthProvider`, `tmpStepNumber`, `tmpActualSalary`, `tmpDateIncremented`, `tmpPositionDate`, `regularDedSwitch`, `contriDedSwitch`, `loanDedSwitch`, `zonecode`, `riceSwitch`, `detailedfrom`, `departmentcode`, `groupCode`, `firefighter`, `security`, `uniqueItemNumber`, `physician`, `officecode`, `service`, `payrollGroupCode`, `taxAmount`, `hpTax`, `lpTax`, `laundrySwitch`, `addPAGIBIGContri`, `includeSecondment`, `group1`, `group2`, `group3`, `group4`, `group5`, `RATACode`, `RATAVehicle`, `taxRate`, `taxSwitch`) VALUES ('1111', '', 'In-Service', '', '', '', '', '', '', '', '0', '0.00', '0.00', NULL, '2021-07-13', '2021-07-13', '2021-07-13', '0.00', '2021-07-13', '2021-07-13', NULL, '0', '2021-07-13', '', 'Fulltime', 'Career', 'Support', '0', '0', 'N', 'GEN', 'Y', 'Y', 'Y', 'Y', '', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '0', 'N', '0', '0.00', '2021-07-13', '2021-07-13', '', '', '', '', '', '', '', NULL, 'N', 'N', '', 'N', '', '', NULL, '0.00', NULL, NULL, 'Y', '0.00', '0', '', '', '', '', '', NULL, NULL, NULL, '');
INSERT INTO `tblEmpPosition` (`empNumber`, `appointmentCode`, `statusOfAppointment`, `positionCode`, `serviceCode`, `plantillaGroupCode`, `divisionCode`, `sectionCode`, `taxStatCode`, `itemNumber`, `salaryGradeNumber`, `authorizeSalary`, `actualSalary`, `contractEndDate`, `effectiveDate`, `positionDate`, `longevityDate`, `longevityGap`, `firstDayAgency`, `firstDayGov`, `assignPlace`, `stepNumber`, `dateIncremented`, `personnelAction`, `employmentBasis`, `categoryService`, `nature`, `hpFactor`, `longiFactor`, `payrollSwitch`, `schemeCode`, `itwSwitch`, `lifeRetSwitch`, `pagibigSwitch`, `philhealthSwitch`, `providentSwitch`, `premiumAidSwitch`, `dtrSwitch`, `mcSwitch`, `hazardSwitch`, `longevitySwitch`, `PERASwitch`, `ADCOMSwitch`, `dependents`, `healthProvider`, `tmpStepNumber`, `tmpActualSalary`, `tmpDateIncremented`, `tmpPositionDate`, `regularDedSwitch`, `contriDedSwitch`, `loanDedSwitch`, `zonecode`, `riceSwitch`, `detailedfrom`, `departmentcode`, `groupCode`, `firefighter`, `security`, `uniqueItemNumber`, `physician`, `officecode`, `service`, `payrollGroupCode`, `taxAmount`, `hpTax`, `lpTax`, `laundrySwitch`, `addPAGIBIGContri`, `includeSecondment`, `group1`, `group2`, `group3`, `group4`, `group5`, `RATACode`, `RATAVehicle`, `taxRate`, `taxSwitch`) VALUES ('PE-FND070117', 'P', 'In-Service', '', '', '', '', '', '', '', '0', '0.00', '0.00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0.00', '0000-00-00', '0000-00-00', '', '0', '0000-00-00', '', '', 'Career', 'Support', '0', '0', 'N', 'GEN', 'Y', 'Y', 'Y', 'Y', '', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '0', 'N', '0', '0.00', '0000-00-00', '0000-00-00', '', '', '', '', '', '', '', NULL, 'N', 'N', '', 'N', 'EXEC', 'LGU', NULL, '0.00', NULL, NULL, 'Y', '0.00', '0', '', '', '', '', '', NULL, NULL, NULL, '');
INSERT INTO `tblEmpPosition` (`empNumber`, `appointmentCode`, `statusOfAppointment`, `positionCode`, `serviceCode`, `plantillaGroupCode`, `divisionCode`, `sectionCode`, `taxStatCode`, `itemNumber`, `salaryGradeNumber`, `authorizeSalary`, `actualSalary`, `contractEndDate`, `effectiveDate`, `positionDate`, `longevityDate`, `longevityGap`, `firstDayAgency`, `firstDayGov`, `assignPlace`, `stepNumber`, `dateIncremented`, `personnelAction`, `employmentBasis`, `categoryService`, `nature`, `hpFactor`, `longiFactor`, `payrollSwitch`, `schemeCode`, `itwSwitch`, `lifeRetSwitch`, `pagibigSwitch`, `philhealthSwitch`, `providentSwitch`, `premiumAidSwitch`, `dtrSwitch`, `mcSwitch`, `hazardSwitch`, `longevitySwitch`, `PERASwitch`, `ADCOMSwitch`, `dependents`, `healthProvider`, `tmpStepNumber`, `tmpActualSalary`, `tmpDateIncremented`, `tmpPositionDate`, `regularDedSwitch`, `contriDedSwitch`, `loanDedSwitch`, `zonecode`, `riceSwitch`, `detailedfrom`, `departmentcode`, `groupCode`, `firefighter`, `security`, `uniqueItemNumber`, `physician`, `officecode`, `service`, `payrollGroupCode`, `taxAmount`, `hpTax`, `lpTax`, `laundrySwitch`, `addPAGIBIGContri`, `includeSecondment`, `group1`, `group2`, `group3`, `group4`, `group5`, `RATACode`, `RATAVehicle`, `taxRate`, `taxSwitch`) VALUES ('EO-RQB0000', '', 'In-Service', '', '', '', '', '', '', '', '0', '0.00', '0.00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0.00', '0000-00-00', '0000-00-00', NULL, '0', '0000-00-00', '', 'Fulltime', 'Career', 'Support', '0', '0', 'N', 'GEN', 'Y', 'Y', 'Y', 'Y', '', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '0', 'N', '0', '0.00', '0000-00-00', '0000-00-00', '', '', '', '', '', '', '', NULL, 'N', 'N', '', 'N', '', '', NULL, '0.00', NULL, NULL, 'Y', '0.00', '0', '', '', '', '', '', NULL, NULL, NULL, '');
INSERT INTO `tblEmpPosition` (`empNumber`, `appointmentCode`, `statusOfAppointment`, `positionCode`, `serviceCode`, `plantillaGroupCode`, `divisionCode`, `sectionCode`, `taxStatCode`, `itemNumber`, `salaryGradeNumber`, `authorizeSalary`, `actualSalary`, `contractEndDate`, `effectiveDate`, `positionDate`, `longevityDate`, `longevityGap`, `firstDayAgency`, `firstDayGov`, `assignPlace`, `stepNumber`, `dateIncremented`, `personnelAction`, `employmentBasis`, `categoryService`, `nature`, `hpFactor`, `longiFactor`, `payrollSwitch`, `schemeCode`, `itwSwitch`, `lifeRetSwitch`, `pagibigSwitch`, `philhealthSwitch`, `providentSwitch`, `premiumAidSwitch`, `dtrSwitch`, `mcSwitch`, `hazardSwitch`, `longevitySwitch`, `PERASwitch`, `ADCOMSwitch`, `dependents`, `healthProvider`, `tmpStepNumber`, `tmpActualSalary`, `tmpDateIncremented`, `tmpPositionDate`, `regularDedSwitch`, `contriDedSwitch`, `loanDedSwitch`, `zonecode`, `riceSwitch`, `detailedfrom`, `departmentcode`, `groupCode`, `firefighter`, `security`, `uniqueItemNumber`, `physician`, `officecode`, `service`, `payrollGroupCode`, `taxAmount`, `hpTax`, `lpTax`, `laundrySwitch`, `addPAGIBIGContri`, `includeSecondment`, `group1`, `group2`, `group3`, `group4`, `group5`, `RATACode`, `RATAVehicle`, `taxRate`, `taxSwitch`) VALUES ('PE-MGR020106', 'P', 'In-Service', '', '', '', '', '', '', 'PAE-HR-062', '0', '0.00', '0.00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0.00', '0000-00-00', '0000-00-00', '', '0', '0000-00-00', '', 'FullTime', 'Career', 'Support', '0', '0', 'N', 'GEN', 'Y', 'Y', 'Y', 'Y', '', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '0', 'N', '0', '0.00', '0000-00-00', '0000-00-00', '', '', '', '', '', '', '', NULL, 'N', 'N', '', 'N', 'HRMO', 'LGU', NULL, '0.00', NULL, NULL, 'Y', '0.00', '0', '', '', '', '', '', NULL, NULL, NULL, '');


#
# TABLE STRUCTURE FOR: tblEmpReference
#

DROP TABLE IF EXISTS `tblEmpReference`;

CREATE TABLE `tblEmpReference` (
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `refName` varchar(80) NOT NULL DEFAULT '',
  `refAddress` varchar(255) NOT NULL DEFAULT '',
  `refTelephone` varchar(20) DEFAULT NULL,
  `ReferenceIndex` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ReferenceIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblEmpRequest
#

DROP TABLE IF EXISTS `tblEmpRequest`;

CREATE TABLE `tblEmpRequest` (
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `requestID` int(6) NOT NULL AUTO_INCREMENT,
  `requestCode` varchar(20) NOT NULL DEFAULT '',
  `requestDate` date NOT NULL DEFAULT '0000-00-00',
  `requestDetails` text DEFAULT NULL,
  `requestStatus` varchar(30) NOT NULL DEFAULT '',
  `statusDate` date DEFAULT '0000-00-00',
  `remarks` varchar(50) DEFAULT NULL,
  `signatory` varchar(50) NOT NULL DEFAULT '',
  `listDisplay` int(1) NOT NULL DEFAULT 1,
  `Signatory1` text NOT NULL,
  `Sig1DateTime` datetime NOT NULL,
  `Signatory2` text NOT NULL,
  `Sig2DateTime` datetime NOT NULL,
  `Signatory3` text NOT NULL,
  `Sig3DateTime` datetime NOT NULL,
  `SignatoryFin` text NOT NULL,
  `SigFinDateTime` datetime NOT NULL,
  `file_location` varchar(255) NOT NULL,
  PRIMARY KEY (`requestID`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblEmpRequest` (`empNumber`, `requestID`, `requestCode`, `requestDate`, `requestDetails`, `requestStatus`, `statusDate`, `remarks`, `signatory`, `listDisplay`, `Signatory1`, `Sig1DateTime`, `Signatory2`, `Sig2DateTime`, `Signatory3`, `Sig3DateTime`, `SignatoryFin`, `SigFinDateTime`, `file_location`) VALUES ('ADOF1-234-2004', '1', '201', '2021-07-23', 'Profile;Badoy;Phoebe;Robles;;1990-09-01;Cuartero, Capiz;Married;0.00;0.00;O;;BP NO. 2004839015;1210-3002-8198;11-050555726-3;441-777-577;B32 L61;Xiphias Street;DHPRR Village 1;Pandac;Pavia;Iloilo;5001;;B32 L61;Xiphias Street;DHPRR Village 1;Pandac;Pavia;Iloilo;5001;;phoeberish@gmail.com;09278674515;Filed Request;201 Profile', 'Filed Request', '0000-00-00', NULL, '', '1', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');
INSERT INTO `tblEmpRequest` (`empNumber`, `requestID`, `requestCode`, `requestDate`, `requestDetails`, `requestStatus`, `statusDate`, `remarks`, `signatory`, `listDisplay`, `Signatory1`, `Sig1DateTime`, `Signatory2`, `Sig2DateTime`, `Signatory3`, `Sig3DateTime`, `SignatoryFin`, `SigFinDateTime`, `file_location`) VALUES ('ADOF1-234-2004', '2', '201', '2021-07-23', 'Education;;Jaro I Elementary School;0;1997;2003;-;;;N;Y;2003;;201 Education', 'Filed Request', '0000-00-00', NULL, '', '1', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');
INSERT INTO `tblEmpRequest` (`empNumber`, `requestID`, `requestCode`, `requestDate`, `requestDetails`, `requestStatus`, `statusDate`, `remarks`, `signatory`, `listDisplay`, `Signatory1`, `Sig1DateTime`, `Signatory2`, `Sig2DateTime`, `Signatory3`, `Sig3DateTime`, `SignatoryFin`, `SigFinDateTime`, `file_location`) VALUES ('ADOF1-234-2004', '3', '201', '2021-07-23', 'Education;;Western Visayas College of Science and Technology;0;2003;2007;-;;;N;Y;2007;;201 Education', 'Filed Request', '0000-00-00', NULL, '', '1', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');
INSERT INTO `tblEmpRequest` (`empNumber`, `requestID`, `requestCode`, `requestDate`, `requestDetails`, `requestStatus`, `statusDate`, `remarks`, `signatory`, `listDisplay`, `Signatory1`, `Sig1DateTime`, `Signatory2`, `Sig2DateTime`, `Signatory3`, `Sig3DateTime`, `SignatoryFin`, `SigFinDateTime`, `file_location`) VALUES ('ADOF1-234-2004', '4', '201', '2021-07-23', 'Education;;West Visayas State University;0;2007;2011;-;10;;N;Y;2011;;201 Education', 'Filed Request', '0000-00-00', NULL, '', '1', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');
INSERT INTO `tblEmpRequest` (`empNumber`, `requestID`, `requestCode`, `requestDate`, `requestDetails`, `requestStatus`, `statusDate`, `remarks`, `signatory`, `listDisplay`, `Signatory1`, `Sig1DateTime`, `Signatory2`, `Sig2DateTime`, `Signatory3`, `Sig3DateTime`, `SignatoryFin`, `SigFinDateTime`, `file_location`) VALUES ('ADOF1-234-2004', '5', '201', '2021-07-23', 'Education;;University of Iloilo - PHINMA;0;2021;2021;36 units (CAR);;;N;Y;;;201 Education', 'Filed Request', '0000-00-00', NULL, '', '1', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');
INSERT INTO `tblEmpRequest` (`empNumber`, `requestID`, `requestCode`, `requestDate`, `requestDetails`, `requestStatus`, `statusDate`, `remarks`, `signatory`, `listDisplay`, `Signatory1`, `Sig1DateTime`, `Signatory2`, `Sig2DateTime`, `Signatory3`, `Sig3DateTime`, `SignatoryFin`, `SigFinDateTime`, `file_location`) VALUES ('INFOSA2-98-2014', '6', 'TO', '2021-09-16', 'Oton, Iloilo;2021-09-20;2021-09-24;To obligate;', 'Filed Request', '0000-00-00', NULL, '', '1', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '[]');
INSERT INTO `tblEmpRequest` (`empNumber`, `requestID`, `requestCode`, `requestDate`, `requestDetails`, `requestStatus`, `statusDate`, `remarks`, `signatory`, `listDisplay`, `Signatory1`, `Sig1DateTime`, `Signatory2`, `Sig2DateTime`, `Signatory3`, `Sig3DateTime`, `SignatoryFin`, `SigFinDateTime`, `file_location`) VALUES ('1111', '7', 'TO', '2021-09-16', 'iiuuj;2021-09-21;2021-09-25;lllll;', 'Cancelled', '2024-09-04', NULL, '', '1', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '[]');
INSERT INTO `tblEmpRequest` (`empNumber`, `requestID`, `requestCode`, `requestDate`, `requestDetails`, `requestStatus`, `statusDate`, `remarks`, `signatory`, `listDisplay`, `Signatory1`, `Sig1DateTime`, `Signatory2`, `Sig2DateTime`, `Signatory3`, `Sig3DateTime`, `SignatoryFin`, `SigFinDateTime`, `file_location`) VALUES ('INFOSA2-98-2014', '8', 'TO', '2021-10-14', 'CENRO Sara;2021-10-18;2021-10-22;To fixed computer;', 'Filed Request', '0000-00-00', NULL, '', '1', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '[]');


#
# TABLE STRUCTURE FOR: tblEmpScholarship
#

DROP TABLE IF EXISTS `tblEmpScholarship`;

CREATE TABLE `tblEmpScholarship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empSchoolCode` int(10) NOT NULL DEFAULT 0,
  `empNumber` varchar(20) NOT NULL DEFAULT '',
  `ScholarshipCode` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblEmpSchool
#

DROP TABLE IF EXISTS `tblEmpSchool`;

CREATE TABLE `tblEmpSchool` (
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `levelCode` varchar(20) NOT NULL DEFAULT '',
  `schoolName` varchar(80) NOT NULL DEFAULT '',
  `course` varchar(50) NOT NULL DEFAULT '',
  `yearGraduated` varchar(4) DEFAULT '',
  `units` varchar(15) DEFAULT NULL,
  `schoolFromDate` varchar(4) NOT NULL DEFAULT '0000',
  `schoolToDate` varchar(4) NOT NULL DEFAULT '0000',
  `ScholarshipCode` varchar(50) NOT NULL,
  `honors` text DEFAULT NULL,
  `courseCode` varchar(10) NOT NULL DEFAULT '',
  `SchoolIndex` int(11) NOT NULL AUTO_INCREMENT,
  `licensed` char(1) NOT NULL DEFAULT '',
  `graduated` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`SchoolIndex`),
  KEY `SchoolType` (`levelCode`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblEmpSchool` (`empNumber`, `levelCode`, `schoolName`, `course`, `yearGraduated`, `units`, `schoolFromDate`, `schoolToDate`, `ScholarshipCode`, `honors`, `courseCode`, `SchoolIndex`, `licensed`, `graduated`) VALUES ('POS4-5-2014', 'CLG', 'ISAT U', 'BS IS', '2012', '36', '2008', '2012', '', '', '', '1', '', 'Y');


#
# TABLE STRUCTURE FOR: tblEmpTraining
#

DROP TABLE IF EXISTS `tblEmpTraining`;

CREATE TABLE `tblEmpTraining` (
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `XtrainingCode` varchar(10) NOT NULL DEFAULT '',
  `trainingTitle` text NOT NULL,
  `trainingContractDate` date DEFAULT '0000-00-00',
  `trainingStartDate` date NOT NULL DEFAULT '0000-00-00',
  `trainingEndDate` date NOT NULL DEFAULT '0000-00-00',
  `trainingHours` decimal(5,2) NOT NULL DEFAULT 0.00,
  `trainingTypeofLD` varchar(100) NOT NULL,
  `trainingConductedBy` varchar(100) NOT NULL DEFAULT '',
  `trainingVenue` varchar(100) NOT NULL DEFAULT '',
  `trainingCost` decimal(10,2) NOT NULL DEFAULT 0.00,
  `trainingDesc` varchar(200) NOT NULL DEFAULT '',
  `TrainingIndex` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`TrainingIndex`),
  KEY `Emp_No` (`empNumber`),
  KEY `TrainingID` (`XtrainingCode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblEmpTravelOrder
#

DROP TABLE IF EXISTS `tblEmpTravelOrder`;

CREATE TABLE `tblEmpTravelOrder` (
  `toID` int(10) NOT NULL AUTO_INCREMENT,
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `dateFiled` date NOT NULL DEFAULT '0000-00-00',
  `toDateFrom` date NOT NULL DEFAULT '0000-00-00',
  `toDateTo` date NOT NULL DEFAULT '0000-00-00',
  `destination` text NOT NULL,
  `purpose` text NOT NULL,
  `fund` varchar(30) NOT NULL DEFAULT '',
  `transportation` varchar(30) NOT NULL DEFAULT '',
  `perdiem` char(1) NOT NULL DEFAULT '',
  `wmeal` char(1) NOT NULL,
  PRIMARY KEY (`toID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblEmpTripTicket
#

DROP TABLE IF EXISTS `tblEmpTripTicket`;

CREATE TABLE `tblEmpTripTicket` (
  `ttID` int(11) NOT NULL AUTO_INCREMENT,
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `dateFiled` date NOT NULL DEFAULT '0000-00-00',
  `destination` text NOT NULL,
  `purpose` text NOT NULL,
  `ttDateFrom` date NOT NULL DEFAULT '0000-00-00',
  `ttDateTo` date NOT NULL DEFAULT '0000-00-00',
  `perdiem` char(1) NOT NULL DEFAULT '',
  PRIMARY KEY (`ttID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblEmpVoluntaryWork
#

DROP TABLE IF EXISTS `tblEmpVoluntaryWork`;

CREATE TABLE `tblEmpVoluntaryWork` (
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `vwName` varchar(50) DEFAULT NULL,
  `vwAddress` text DEFAULT NULL,
  `vwDateFrom` date DEFAULT '0000-00-00',
  `vwDateTo` date DEFAULT '0000-00-00',
  `vwHours` decimal(4,2) DEFAULT 0.00,
  `vwPosition` varchar(50) DEFAULT NULL,
  `VoluntaryIndex` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`VoluntaryIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblExamType
#

DROP TABLE IF EXISTS `tblExamType`;

CREATE TABLE `tblExamType` (
  `examCode` varchar(20) NOT NULL DEFAULT '',
  `examDesc` varchar(50) NOT NULL DEFAULT '',
  `csElligible` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`examCode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('RA1080', 'Philippine Bar Examination', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('O', 'Others', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('CATIII', 'Performance based', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('TBE', 'Teachers Board Exam', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('CESO1', 'Career Executive Service Officer 1', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('PRC-ChE', 'PRC Chemical Engineering Board', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('CSC-DE', 'CSC Data Encoder', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('MCP', 'Microsoft Certified Professional', 'N');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('MCDST', 'Microsoft Certified Desktop Support Technician', 'N');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('CES', 'Career Executive Service Eligibility', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('PRC-Geo', 'Geologist Licensure Examination', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('CESO5', 'Career Executive Service Officer 5', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('CESO4', 'Career Executive Service Officer 4', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('SROC', 'Special Radiotelephone Operator Certificate', 'N');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('CPA-BE', 'CPA Board Exam', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('MTBE', 'Medical Technology Board Exams', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('GCE', 'General Clerical Examinatiion', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('NBE', 'Nutritionist Board Exam', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('AGSERP', 'Agri Office Exam', 'N');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('AMO', 'Accounting Machine Operator', 'N');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('BEN', 'Nursing Licensure Exam', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('CEBE', 'Chemical Engineering Board', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('CSP', 'Career Service Professional', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('FBS', 'Forester Board Exam', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('Cpa', 'Certified Public Accountant', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('SAP', 'Stenograph exam', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('CEB', 'Civil Engineering Board Examination', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('ACD', 'Chemist Board Examination', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('OCD', 'General Clerical Examination', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('DAE', 'Profesional Examinations', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('UOP', 'PD 997', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('ER', 'CESO 1', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('NLE', 'Nursing Licensure Examinations', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('NCIII', 'NCIII Bookkeping', 'N');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('OP', 'Nutritionists and Dietitians Licensure Examination', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('IO', 'Medical Technology Board Exams', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('ABE', 'Agriculture Board Examination', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('OS', 'Career Executive Service Officer 2', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('DA', 'Career Executive Service Eligable', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('CO', 'Management Analysis', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('CS', 'First Grade Civil Service Entrance', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('TTA', 'Testimonial test for Automotive', 'N');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('BOE', 'Barangay Official Eligibility', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('CSE-1', 'First Grade Civil Service Exam', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('CSE-2', 'Second Grade Civil Service Exam', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('CRE2', 'CESO Rank II', 'N');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('CA', 'Certified Public Accountant licensure exam', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('SE', 'Profesore', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('SW', 'Career Service Eligibility', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('DS', 'CPA Board Exam', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('CSEB', 'Career Executive Service Board', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('PD907', 'Presidential Decree 907 (Honor Graduate)', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('MEB', 'Mechanical Engineering Board Exam', '');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('CSC-S', 'CSC Local Scholarship Qualifying Exam', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('AElecEng', 'Assistant Electrical Engineering Licensure Exam', '');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('RANo1080', 'RA No 1080', '');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('CSCTTO', 'CSC Testimonial Telephone Operator', '');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('CSC-LOC', 'Career Service Professional Exam for Local Govt', '');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('CSSP', 'Career Service Subprofessional', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('AEEng', 'Associate Electrical Engineer', '');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('EEBE', 'Electronics Engineering Board Exam', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('EBE', 'Electrical Engineering Board Exam', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('CESO', 'Career Executive Service Officer', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('PBET', 'Professional Board Exam for Teachers', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('CATI', 'Skills based', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('CATII', 'License', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('GROC', 'Government Radio Operator Certificate', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('ME', 'Mechanical Engineering Licensure Exam', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('LET', 'Licensure Examination for Teachers (LET)', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('CSCProf', 'Career Service Professional', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('PAE', 'Professional Agricultural Engineer', '');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('MPLE', 'Master Plumbers Licensure Exam', '');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('MELE', 'Master Electrician Licensure Exam', '');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('HGE', 'Honor Graduate Eligibility', '');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('CESO3', 'Career Executive Service Officer 3', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('ALE', 'Agricultural Licensure Examination', '');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('SEBE', 'Sanitary Engineering Board Exam', 'Y');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('ChemLicExam', 'Chemistry Licensure Examination', '');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('ElecTechLic', 'Electronics Technician Licensure Examination', 'N');
INSERT INTO `tblExamType` (`examCode`, `examDesc`, `csElligible`) VALUES ('PRC', 'Professional Regulation Commission', '');


#
# TABLE STRUCTURE FOR: tblFlagCeremony
#

DROP TABLE IF EXISTS `tblFlagCeremony`;

CREATE TABLE `tblFlagCeremony` (
  `flag_id` int(11) NOT NULL AUTO_INCREMENT,
  `flag_empNumber` varchar(35) NOT NULL,
  `flag_datetime` datetime NOT NULL,
  `flag_added_by` varchar(35) NOT NULL,
  `flag_added_by_ip` varchar(35) NOT NULL,
  PRIMARY KEY (`flag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblGroup
#

DROP TABLE IF EXISTS `tblGroup`;

CREATE TABLE `tblGroup` (
  `groupcode` varchar(10) NOT NULL DEFAULT '',
  `officecode` varchar(10) NOT NULL DEFAULT '',
  `groupname` varchar(255) NOT NULL DEFAULT '',
  `grouphead` varchar(50) NOT NULL DEFAULT '',
  `groupheadtitle` varchar(50) NOT NULL DEFAULT '',
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`groupcode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblGroup1
#

DROP TABLE IF EXISTS `tblGroup1`;

CREATE TABLE `tblGroup1` (
  `group1Code` varchar(20) NOT NULL DEFAULT '',
  `group1Name` text NOT NULL,
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `group1HeadTitle` varchar(20) NOT NULL DEFAULT '',
  `group1Secretary` varchar(20) NOT NULL DEFAULT '',
  `group1Custodian` varchar(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblGroup1` (`group1Code`, `group1Name`, `empNumber`, `group1HeadTitle`, `group1Secretary`, `group1Custodian`) VALUES ('LCEO', 'Office of the Municipal Mayor', 'EO-RQB0000', 'Municipal Mayor', '', '');
INSERT INTO `tblGroup1` (`group1Code`, `group1Name`, `empNumber`, `group1HeadTitle`, `group1Secretary`, `group1Custodian`) VALUES ('HRMO', 'Human Resources Management Office', 'PE-MGR020106', 'HRMO', '', '');


#
# TABLE STRUCTURE FOR: tblGroup2
#

DROP TABLE IF EXISTS `tblGroup2`;

CREATE TABLE `tblGroup2` (
  `group1Code` varchar(20) NOT NULL DEFAULT '',
  `group2Code` varchar(20) NOT NULL DEFAULT '',
  `group2Name` text NOT NULL,
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `group2HeadTitle` varchar(10) NOT NULL DEFAULT '',
  `group2Secretary` varchar(20) NOT NULL DEFAULT '',
  `group2Custodian` varchar(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblGroup2` (`group1Code`, `group2Code`, `group2Name`, `empNumber`, `group2HeadTitle`, `group2Secretary`, `group2Custodian`) VALUES ('LCEO', 'GSO', 'General Services', 'EO-RQB0000', 'GSO Head', '', '');


#
# TABLE STRUCTURE FOR: tblGroup3
#

DROP TABLE IF EXISTS `tblGroup3`;

CREATE TABLE `tblGroup3` (
  `group1Code` varchar(20) NOT NULL DEFAULT '',
  `group2Code` varchar(20) NOT NULL DEFAULT '',
  `group3Code` varchar(20) NOT NULL DEFAULT '',
  `group3Name` text NOT NULL,
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `group3HeadTitle` varchar(10) NOT NULL DEFAULT '',
  `group3Secretary` varchar(20) NOT NULL DEFAULT '',
  `group3Custodian` varchar(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblGroup4
#

DROP TABLE IF EXISTS `tblGroup4`;

CREATE TABLE `tblGroup4` (
  `group1Code` varchar(20) NOT NULL DEFAULT '',
  `group2Code` varchar(20) NOT NULL DEFAULT '',
  `group3Code` varchar(20) NOT NULL DEFAULT '',
  `group4Code` varchar(20) NOT NULL DEFAULT '',
  `group4Name` text NOT NULL,
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `group4HeadTitle` varchar(10) NOT NULL DEFAULT '',
  `group4Secretary` varchar(20) NOT NULL DEFAULT '',
  `group4Custodian` varchar(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblGroup5
#

DROP TABLE IF EXISTS `tblGroup5`;

CREATE TABLE `tblGroup5` (
  `group1Code` varchar(20) NOT NULL DEFAULT '',
  `group2Code` varchar(20) NOT NULL DEFAULT '',
  `group3Code` varchar(20) NOT NULL DEFAULT '',
  `group4Code` varchar(20) NOT NULL DEFAULT '',
  `group5Code` varchar(20) NOT NULL DEFAULT '',
  `group5Name` text NOT NULL,
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `group5HeadTitle` varchar(10) NOT NULL DEFAULT '',
  `group5Secretary` varchar(20) NOT NULL DEFAULT '',
  `group5Custodian` varchar(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblHoliday
#

DROP TABLE IF EXISTS `tblHoliday`;

CREATE TABLE `tblHoliday` (
  `holidayCode` varchar(20) NOT NULL DEFAULT '',
  `holidayName` varchar(30) NOT NULL DEFAULT '',
  `holidayMonth` varchar(10) DEFAULT NULL,
  `holidayDay` char(2) DEFAULT NULL,
  `fixedHoliday` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`holidayCode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblHoliday` (`holidayCode`, `holidayName`, `holidayMonth`, `holidayDay`, `fixedHoliday`) VALUES ('LD01', 'Labor Day', '', '', '');
INSERT INTO `tblHoliday` (`holidayCode`, `holidayName`, `holidayMonth`, `holidayDay`, `fixedHoliday`) VALUES ('BONI', 'Bonifacio Day', '', '', '');
INSERT INTO `tblHoliday` (`holidayCode`, `holidayName`, `holidayMonth`, `holidayDay`, `fixedHoliday`) VALUES ('RD', 'Rizal Day', '', '', '');
INSERT INTO `tblHoliday` (`holidayCode`, `holidayName`, `holidayMonth`, `holidayDay`, `fixedHoliday`) VALUES ('BD09', 'Bataan Day', '4', '9', 'Y');
INSERT INTO `tblHoliday` (`holidayCode`, `holidayName`, `holidayMonth`, `holidayDay`, `fixedHoliday`) VALUES ('HD', 'Holiday', '', '', '');
INSERT INTO `tblHoliday` (`holidayCode`, `holidayName`, `holidayMonth`, `holidayDay`, `fixedHoliday`) VALUES ('ID12', 'Independence Day', '6', '12', 'Y');
INSERT INTO `tblHoliday` (`holidayCode`, `holidayName`, `holidayMonth`, `holidayDay`, `fixedHoliday`) VALUES ('KD06', 'Araw ng Kagitingan', '5', '29', 'Y');
INSERT INTO `tblHoliday` (`holidayCode`, `holidayName`, `holidayMonth`, `holidayDay`, `fixedHoliday`) VALUES ('PP25', 'Edsa People Power Anniversary', '', '', '');
INSERT INTO `tblHoliday` (`holidayCode`, `holidayName`, `holidayMonth`, `holidayDay`, `fixedHoliday`) VALUES ('SPH', 'Special Holiday', '7', '01', 'N');
INSERT INTO `tblHoliday` (`holidayCode`, `holidayName`, `holidayMonth`, `holidayDay`, `fixedHoliday`) VALUES ('ASD2', 'All Soul\'s Day', '11', '02', 'Y');
INSERT INTO `tblHoliday` (`holidayCode`, `holidayName`, `holidayMonth`, `holidayDay`, `fixedHoliday`) VALUES ('RD01', 'Ramadan', '11', '26', 'Y');
INSERT INTO `tblHoliday` (`holidayCode`, `holidayName`, `holidayMonth`, `holidayDay`, `fixedHoliday`) VALUES ('NYD', 'New Year Day', '1', '1', 'Y');
INSERT INTO `tblHoliday` (`holidayCode`, `holidayName`, `holidayMonth`, `holidayDay`, `fixedHoliday`) VALUES ('HDAM', 'Half Day AM', '', '', '');
INSERT INTO `tblHoliday` (`holidayCode`, `holidayName`, `holidayMonth`, `holidayDay`, `fixedHoliday`) VALUES ('TAGUIG', 'Taguig Day', '', '', '');
INSERT INTO `tblHoliday` (`holidayCode`, `holidayName`, `holidayMonth`, `holidayDay`, `fixedHoliday`) VALUES ('MT', 'Maundy Thursday', '', '', '');
INSERT INTO `tblHoliday` (`holidayCode`, `holidayName`, `holidayMonth`, `holidayDay`, `fixedHoliday`) VALUES ('HDPM', 'Half Day PM', '', '', '');
INSERT INTO `tblHoliday` (`holidayCode`, `holidayName`, `holidayMonth`, `holidayDay`, `fixedHoliday`) VALUES ('GF', 'Good Friday', '', '', '');
INSERT INTO `tblHoliday` (`holidayCode`, `holidayName`, `holidayMonth`, `holidayDay`, `fixedHoliday`) VALUES ('CD', 'Christmas Day', '', '', '');
INSERT INTO `tblHoliday` (`holidayCode`, `holidayName`, `holidayMonth`, `holidayDay`, `fixedHoliday`) VALUES ('NAD', 'Ninoy Aquino Day', '', '', '');
INSERT INTO `tblHoliday` (`holidayCode`, `holidayName`, `holidayMonth`, `holidayDay`, `fixedHoliday`) VALUES ('NYE', 'New Years Eve', '', '', '');
INSERT INTO `tblHoliday` (`holidayCode`, `holidayName`, `holidayMonth`, `holidayDay`, `fixedHoliday`) VALUES ('SNWD', 'Special Non-Working Day', '', '', '');
INSERT INTO `tblHoliday` (`holidayCode`, `holidayName`, `holidayMonth`, `holidayDay`, `fixedHoliday`) VALUES ('CN', 'Chinese New Year', '', '', '');
INSERT INTO `tblHoliday` (`holidayCode`, `holidayName`, `holidayMonth`, `holidayDay`, `fixedHoliday`) VALUES ('LELEC', 'Local Election', '', '', '');
INSERT INTO `tblHoliday` (`holidayCode`, `holidayName`, `holidayMonth`, `holidayDay`, `fixedHoliday`) VALUES ('EA', 'Eid l Adha', '', '', '');
INSERT INTO `tblHoliday` (`holidayCode`, `holidayName`, `holidayMonth`, `holidayDay`, `fixedHoliday`) VALUES ('TYP2014', 'Typhoon Mario', '', '', '');
INSERT INTO `tblHoliday` (`holidayCode`, `holidayName`, `holidayMonth`, `holidayDay`, `fixedHoliday`) VALUES ('WS', 'Work Suspended', '', '', '');
INSERT INTO `tblHoliday` (`holidayCode`, `holidayName`, `holidayMonth`, `holidayDay`, `fixedHoliday`) VALUES ('ASD1', 'All Saints Day', '', '', '');
INSERT INTO `tblHoliday` (`holidayCode`, `holidayName`, `holidayMonth`, `holidayDay`, `fixedHoliday`) VALUES ('EDF', 'Eidl Fitr', '', '', '');
INSERT INTO `tblHoliday` (`holidayCode`, `holidayName`, `holidayMonth`, `holidayDay`, `fixedHoliday`) VALUES ('Lastday', 'Last Day of the Year', '', '', '');
INSERT INTO `tblHoliday` (`holidayCode`, `holidayName`, `holidayMonth`, `holidayDay`, `fixedHoliday`) VALUES ('CNY', 'Chinese New Year', '', '', '');
INSERT INTO `tblHoliday` (`holidayCode`, `holidayName`, `holidayMonth`, `holidayDay`, `fixedHoliday`) VALUES ('TYP', 'Typhoon Glenda', '', '', '');
INSERT INTO `tblHoliday` (`holidayCode`, `holidayName`, `holidayMonth`, `holidayDay`, `fixedHoliday`) VALUES ('DH', 'Declared Holiday', '', '', '');
INSERT INTO `tblHoliday` (`holidayCode`, `holidayName`, `holidayMonth`, `holidayDay`, `fixedHoliday`) VALUES ('DAH', 'Declared Holiday', '', '', '');
INSERT INTO `tblHoliday` (`holidayCode`, `holidayName`, `holidayMonth`, `holidayDay`, `fixedHoliday`) VALUES ('SHB', 'SENT HOME', '', '', '');
INSERT INTO `tblHoliday` (`holidayCode`, `holidayName`, `holidayMonth`, `holidayDay`, `fixedHoliday`) VALUES ('NHD', 'National Heroes Day', '', '', '');
INSERT INTO `tblHoliday` (`holidayCode`, `holidayName`, `holidayMonth`, `holidayDay`, `fixedHoliday`) VALUES ('EDLA', 'Eidl Adha', '', '', '');
INSERT INTO `tblHoliday` (`holidayCode`, `holidayName`, `holidayMonth`, `holidayDay`, `fixedHoliday`) VALUES ('NLELEC', 'National and Local Elections', '', '', '');
INSERT INTO `tblHoliday` (`holidayCode`, `holidayName`, `holidayMonth`, `holidayDay`, `fixedHoliday`) VALUES ('MCNO37', 'Suspended OP', '', '', '');
INSERT INTO `tblHoliday` (`holidayCode`, `holidayName`, `holidayMonth`, `holidayDay`, `fixedHoliday`) VALUES ('', '', '', '', '');
INSERT INTO `tblHoliday` (`holidayCode`, `holidayName`, `holidayMonth`, `holidayDay`, `fixedHoliday`) VALUES ('ADH', 'Additional Holiday', '', '', '');


#
# TABLE STRUCTURE FOR: tblHolidayYear
#

DROP TABLE IF EXISTS `tblHolidayYear`;

CREATE TABLE `tblHolidayYear` (
  `holidayId` int(11) NOT NULL AUTO_INCREMENT,
  `holidayCode` varchar(20) NOT NULL DEFAULT '',
  `holidayDate` date NOT NULL DEFAULT '0000-00-00',
  `holidayTime` varchar(15) NOT NULL,
  PRIMARY KEY (`holidayId`),
  KEY `idx_holidayDate` (`holidayDate`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblID
#

DROP TABLE IF EXISTS `tblID`;

CREATE TABLE `tblID` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblIncome
#

DROP TABLE IF EXISTS `tblIncome`;

CREATE TABLE `tblIncome` (
  `incomeCode` varchar(15) NOT NULL DEFAULT '',
  `incomeDesc` varchar(50) NOT NULL DEFAULT '',
  `fixedSwitch` char(1) NOT NULL DEFAULT '',
  `incomeAmount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `incomeType` varchar(20) NOT NULL DEFAULT '0',
  `recipient` varchar(150) NOT NULL DEFAULT 'ALL',
  `hidden` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblIncome` (`incomeCode`, `incomeDesc`, `fixedSwitch`, `incomeAmount`, `incomeType`, `recipient`, `hidden`) VALUES ('SUBSIS', 'Subsistence', 'N', '3300.00', 'Benefit', 'Lump,Cas,Perm,', '0');
INSERT INTO `tblIncome` (`incomeCode`, `incomeDesc`, `fixedSwitch`, `incomeAmount`, `incomeType`, `recipient`, `hidden`) VALUES ('LONGI', 'Longevity', 'N', '0.00', 'Benefit', 'Lump,Cas,Perm,', '0');
INSERT INTO `tblIncome` (`incomeCode`, `incomeDesc`, `fixedSwitch`, `incomeAmount`, `incomeType`, `recipient`, `hidden`) VALUES ('HAZARD', 'Hazard Pay', 'N', '0.00', 'Benefit', 'Perm,', '0');
INSERT INTO `tblIncome` (`incomeCode`, `incomeDesc`, `fixedSwitch`, `incomeAmount`, `incomeType`, `recipient`, `hidden`) VALUES ('LAUNDRY', 'Laundry', 'N', '500.00', 'Benefit', 'Lump,Cas,Perm,', '0');
INSERT INTO `tblIncome` (`incomeCode`, `incomeDesc`, `fixedSwitch`, `incomeAmount`, `incomeType`, `recipient`, `hidden`) VALUES ('PENHBON', 'Productivity Enhancement Incentive', 'Y', '1000.00', 'Bonus', 'Lump,Cas,Perm,', '0');
INSERT INTO `tblIncome` (`incomeCode`, `incomeDesc`, `fixedSwitch`, `incomeAmount`, `incomeType`, `recipient`, `hidden`) VALUES ('PERFBON', 'Performance Bonus', 'Y', '5000.00', 'Bonus', 'Lump,Cas,Perm,', '0');
INSERT INTO `tblIncome` (`incomeCode`, `incomeDesc`, `fixedSwitch`, `incomeAmount`, `incomeType`, `recipient`, `hidden`) VALUES ('HEABON', 'Health Care Insurance Bonus', 'Y', '1000.00', 'Bonus', 'Lump,Cas,Perm,', '0');
INSERT INTO `tblIncome` (`incomeCode`, `incomeDesc`, `fixedSwitch`, `incomeAmount`, `incomeType`, `recipient`, `hidden`) VALUES ('ENRBON', 'Enrollment Assistance', 'Y', '2000.00', 'Bonus', 'Lump,Cas,Perm,', '0');
INSERT INTO `tblIncome` (`incomeCode`, `incomeDesc`, `fixedSwitch`, `incomeAmount`, `incomeType`, `recipient`, `hidden`) VALUES ('YECGF', 'Year-end Cash Gift', 'Y', '2500.00', 'Bonus', 'Lump,Cas,Perm,', '0');
INSERT INTO `tblIncome` (`incomeCode`, `incomeDesc`, `fixedSwitch`, `incomeAmount`, `incomeType`, `recipient`, `hidden`) VALUES ('MDCGF', 'Mid-year ', 'Y', '2500.00', 'Bonus', 'Lump,Cas,Perm,', '0');
INSERT INTO `tblIncome` (`incomeCode`, `incomeDesc`, `fixedSwitch`, `incomeAmount`, `incomeType`, `recipient`, `hidden`) VALUES ('MIBON', 'Miles Stone Bonus', 'Y', '3000.00', 'Bonus', 'Lump,Cas,Perm,', '0');
INSERT INTO `tblIncome` (`incomeCode`, `incomeDesc`, `fixedSwitch`, `incomeAmount`, `incomeType`, `recipient`, `hidden`) VALUES ('ANBON', 'Anniversary Bonus', 'N', '0.00', 'Bonus', 'Lump,Cas,Perm,', '0');
INSERT INTO `tblIncome` (`incomeCode`, `incomeDesc`, `fixedSwitch`, `incomeAmount`, `incomeType`, `recipient`, `hidden`) VALUES ('PRBON', 'Productivity Incentive Bonus', 'Y', '2000.00', 'Bonus', 'Lump,Cas,Perm,', '0');
INSERT INTO `tblIncome` (`incomeCode`, `incomeDesc`, `fixedSwitch`, `incomeAmount`, `incomeType`, `recipient`, `hidden`) VALUES ('CLOTH', 'Clothing Allowance', 'Y', '5000.00', 'Bonus', 'Lump,Cas,Perm,', '0');
INSERT INTO `tblIncome` (`incomeCode`, `incomeDesc`, `fixedSwitch`, `incomeAmount`, `incomeType`, `recipient`, `hidden`) VALUES ('CHBON', 'Christmas Bonus', 'Y', '50000.00', 'Bonus', 'Lump,Cas,Perm,', '0');
INSERT INTO `tblIncome` (`incomeCode`, `incomeDesc`, `fixedSwitch`, `incomeAmount`, `incomeType`, `recipient`, `hidden`) VALUES ('OT', 'Overtime', 'N', '0.00', 'Benefit', 'Lump,Cas,Perm,', '0');
INSERT INTO `tblIncome` (`incomeCode`, `incomeDesc`, `fixedSwitch`, `incomeAmount`, `incomeType`, `recipient`, `hidden`) VALUES ('HON', 'Honorarium', 'N', '0.00', 'Additional', 'Lump,Cas,Perm,', '0');
INSERT INTO `tblIncome` (`incomeCode`, `incomeDesc`, `fixedSwitch`, `incomeAmount`, `incomeType`, `recipient`, `hidden`) VALUES ('PERA', 'PERA', 'Y', '500.00', 'Benefit', 'Lump,Cas,Perm,', '0');
INSERT INTO `tblIncome` (`incomeCode`, `incomeDesc`, `fixedSwitch`, `incomeAmount`, `incomeType`, `recipient`, `hidden`) VALUES ('RATA', 'RATA', 'N', '0.00', 'Benefit', 'Lump,Cas,Perm,', '1');
INSERT INTO `tblIncome` (`incomeCode`, `incomeDesc`, `fixedSwitch`, `incomeAmount`, `incomeType`, `recipient`, `hidden`) VALUES ('RA', 'Representation Allowance', 'N', '0.00', 'Benefit', 'Lump,Cas,Perm,', '0');
INSERT INTO `tblIncome` (`incomeCode`, `incomeDesc`, `fixedSwitch`, `incomeAmount`, `incomeType`, `recipient`, `hidden`) VALUES ('MYBON13', 'Interest Free Loan', 'N', '0.00', 'Bonus', 'Lump,Cas,Perm,', '0');
INSERT INTO `tblIncome` (`incomeCode`, `incomeDesc`, `fixedSwitch`, `incomeAmount`, `incomeType`, `recipient`, `hidden`) VALUES ('YEBON13', '13th Month Pay', 'N', '0.00', 'Bonus', 'Lump,Cas,Perm,', '0');
INSERT INTO `tblIncome` (`incomeCode`, `incomeDesc`, `fixedSwitch`, `incomeAmount`, `incomeType`, `recipient`, `hidden`) VALUES ('CNA', 'CNA', 'Y', '32000.00', 'Bonus', 'Lump,Cas,Perm,', '0');
INSERT INTO `tblIncome` (`incomeCode`, `incomeDesc`, `fixedSwitch`, `incomeAmount`, `incomeType`, `recipient`, `hidden`) VALUES ('MEA', 'Medical Allowance', '', '0.00', 'Bonus', 'ALL', '0');
INSERT INTO `tblIncome` (`incomeCode`, `incomeDesc`, `fixedSwitch`, `incomeAmount`, `incomeType`, `recipient`, `hidden`) VALUES ('DIF', 'Differential', '', '0.00', 'Additional', 'ALL', '0');
INSERT INTO `tblIncome` (`incomeCode`, `incomeDesc`, `fixedSwitch`, `incomeAmount`, `incomeType`, `recipient`, `hidden`) VALUES ('TA', 'Transportation Allowance', '', '0.00', 'Benefit', 'ALL', '0');
INSERT INTO `tblIncome` (`incomeCode`, `incomeDesc`, `fixedSwitch`, `incomeAmount`, `incomeType`, `recipient`, `hidden`) VALUES ('COMMA', 'Communication Allowance', '', '0.00', 'Benefit', 'ALL', '0');
INSERT INTO `tblIncome` (`incomeCode`, `incomeDesc`, `fixedSwitch`, `incomeAmount`, `incomeType`, `recipient`, `hidden`) VALUES ('EME', 'EME (Extraordinary Misc. Exp.)', '', '0.00', 'Benefit', 'ALL', '0');
INSERT INTO `tblIncome` (`incomeCode`, `incomeDesc`, `fixedSwitch`, `incomeAmount`, `incomeType`, `recipient`, `hidden`) VALUES ('Underpay', 'Underpay', '', '0.00', 'Benefit', 'ALL', '0');
INSERT INTO `tblIncome` (`incomeCode`, `incomeDesc`, `fixedSwitch`, `incomeAmount`, `incomeType`, `recipient`, `hidden`) VALUES ('RefundSikat', 'Overpay Sikat', '', '0.00', 'Benefit', 'ALL', '0');
INSERT INTO `tblIncome` (`incomeCode`, `incomeDesc`, `fixedSwitch`, `incomeAmount`, `incomeType`, `recipient`, `hidden`) VALUES ('Reffund', 'overpay consoloan', '', '0.00', 'Benefit', 'ALL', '0');
INSERT INTO `tblIncome` (`incomeCode`, `incomeDesc`, `fixedSwitch`, `incomeAmount`, `incomeType`, `recipient`, `hidden`) VALUES ('PBB', 'PBB 2016', '', '0.00', 'Bonus', 'ALL', '0');
INSERT INTO `tblIncome` (`incomeCode`, `incomeDesc`, `fixedSwitch`, `incomeAmount`, `incomeType`, `recipient`, `hidden`) VALUES ('hazard2025', 'hazard2025', '', '0.00', 'Bonus', 'ALL', '0');


#
# TABLE STRUCTURE FOR: tblLeave
#

DROP TABLE IF EXISTS `tblLeave`;

CREATE TABLE `tblLeave` (
  `leaveCode` char(3) NOT NULL DEFAULT '',
  `leaveType` varchar(50) NOT NULL DEFAULT '',
  `numOfDays` int(2) NOT NULL DEFAULT 0,
  `system` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`leaveCode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblLeave` (`leaveCode`, `leaveType`, `numOfDays`, `system`) VALUES ('STL', 'Study Leave', '0', '1');
INSERT INTO `tblLeave` (`leaveCode`, `leaveType`, `numOfDays`, `system`) VALUES ('FL', 'Forced Leave', '5', '1');
INSERT INTO `tblLeave` (`leaveCode`, `leaveType`, `numOfDays`, `system`) VALUES ('SL', 'Sick Leave', '0', '1');
INSERT INTO `tblLeave` (`leaveCode`, `leaveType`, `numOfDays`, `system`) VALUES ('VL', 'Vacation Leave', '0', '1');
INSERT INTO `tblLeave` (`leaveCode`, `leaveType`, `numOfDays`, `system`) VALUES ('PL', 'Special Leave', '3', '1');
INSERT INTO `tblLeave` (`leaveCode`, `leaveType`, `numOfDays`, `system`) VALUES ('MTL', 'Maternity Leave', '60', '1');
INSERT INTO `tblLeave` (`leaveCode`, `leaveType`, `numOfDays`, `system`) VALUES ('PTL', 'Paternity Leave', '7', '1');


#
# TABLE STRUCTURE FOR: tblLocalHoliday
#

DROP TABLE IF EXISTS `tblLocalHoliday`;

CREATE TABLE `tblLocalHoliday` (
  `holidayCode` varchar(20) NOT NULL DEFAULT '',
  `holidayName` varchar(30) NOT NULL DEFAULT '',
  `holidayMonth` varchar(10) NOT NULL DEFAULT '',
  `holidayDay` char(2) NOT NULL DEFAULT '',
  `holidayYear` varchar(10) NOT NULL DEFAULT '',
  `holidayDate` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblManualDTR
#

DROP TABLE IF EXISTS `tblManualDTR`;

CREATE TABLE `tblManualDTR` (
  `dtr_id` int(11) NOT NULL AUTO_INCREMENT,
  `dtr_name` varchar(50) NOT NULL,
  `dtr_ip` varchar(30) NOT NULL,
  PRIMARY KEY (`dtr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblNonPermComputation
#

DROP TABLE IF EXISTS `tblNonPermComputation`;

CREATE TABLE `tblNonPermComputation` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `fk_id` int(5) NOT NULL DEFAULT 0,
  `empNumber` varchar(30) NOT NULL DEFAULT '',
  `salary` decimal(10,2) NOT NULL DEFAULT 0.00,
  `basicSalary` decimal(10,2) NOT NULL DEFAULT 0.00,
  `nodays_absent` int(11) NOT NULL DEFAULT 0,
  `nodays_present` int(11) NOT NULL DEFAULT 0,
  `totalOTHour` int(11) NOT NULL DEFAULT 0,
  `totalOTMinute` int(11) NOT NULL DEFAULT 0,
  `totalTardyHour` int(11) NOT NULL DEFAULT 0,
  `totalTardyMinute` int(11) NOT NULL DEFAULT 0,
  `no_workingdays` int(11) NOT NULL DEFAULT 0,
  `Remarks` text NOT NULL,
  `dayabsentamount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `hourOTamount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `minuteOTamount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `tardyhouramount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `tardyminuteamount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `lateamount` decimal(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblNonPermComputationInstance
#

DROP TABLE IF EXISTS `tblNonPermComputationInstance`;

CREATE TABLE `tblNonPermComputationInstance` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `startDate` date NOT NULL DEFAULT '0000-00-00',
  `endDate` date NOT NULL DEFAULT '0000-00-00',
  `appointmentCode` varchar(20) NOT NULL DEFAULT '',
  `pmonth` int(2) NOT NULL DEFAULT 0,
  `pyear` int(4) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 0,
  `period` int(2) NOT NULL DEFAULT 0,
  `payrollGroupCode` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblOTComputation
#

DROP TABLE IF EXISTS `tblOTComputation`;

CREATE TABLE `tblOTComputation` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `fk_id` int(5) NOT NULL DEFAULT 0,
  `empNumber` varchar(30) NOT NULL DEFAULT '',
  `salary` decimal(10,2) NOT NULL DEFAULT 0.00,
  `basicSalary` decimal(10,2) NOT NULL DEFAULT 0.00,
  `totalOTHour` int(11) NOT NULL DEFAULT 0,
  `totalOTMinute` int(11) NOT NULL DEFAULT 0,
  `hourOTamount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `minuteOTamount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `taxOTAmount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `creditableAmount` decimal(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblOTComputationInstance
#

DROP TABLE IF EXISTS `tblOTComputationInstance`;

CREATE TABLE `tblOTComputationInstance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `startDate` date NOT NULL DEFAULT '0000-00-00',
  `endDate` date NOT NULL DEFAULT '0000-00-00',
  `appointmentCode` varchar(20) NOT NULL DEFAULT '',
  `pmonth` int(2) NOT NULL DEFAULT 0,
  `pyear` int(4) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 0,
  `payrollGroupCode` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblOfficex
#

DROP TABLE IF EXISTS `tblOfficex`;

CREATE TABLE `tblOfficex` (
  `officecode` varchar(10) NOT NULL DEFAULT '',
  `officename` varchar(255) NOT NULL DEFAULT '',
  `officehead` varchar(50) NOT NULL DEFAULT '',
  `officeheadtitle` varchar(50) NOT NULL DEFAULT '',
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`officecode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblOnlineDTR_HCD
#

DROP TABLE IF EXISTS `tblOnlineDTR_HCD`;

CREATE TABLE `tblOnlineDTR_HCD` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empNumber` varchar(50) NOT NULL,
  `dtrDate` date NOT NULL DEFAULT '0000-00-00',
  `fullName` varchar(255) NOT NULL,
  `temperature` float NOT NULL,
  `sex` char(1) NOT NULL DEFAULT 'M',
  `age` int(11) NOT NULL,
  `residence_contact` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `natureVisit` varchar(50) NOT NULL,
  `natureOb` varchar(50) NOT NULL,
  `companyName` varchar(255) NOT NULL,
  `companyAddress` varchar(255) NOT NULL,
  `q1_1` tinyint(1) NOT NULL,
  `q1_1_txt` varchar(255) NOT NULL,
  `q1_2` tinyint(1) NOT NULL,
  `q1_3` tinyint(1) NOT NULL,
  `q1_4` tinyint(1) NOT NULL,
  `q1_5` tinyint(1) NOT NULL,
  `q1_6` tinyint(1) NOT NULL,
  `q1_7` tinyint(1) NOT NULL,
  `q1_8` tinyint(1) NOT NULL,
  `q1_9` tinyint(1) NOT NULL,
  `q1_10` tinyint(1) NOT NULL,
  `q1_11` tinyint(1) NOT NULL,
  `q1_12` tinyint(1) NOT NULL,
  `q1_13` tinyint(1) NOT NULL,
  `q1_14` tinyint(1) NOT NULL,
  `q2` tinyint(1) NOT NULL,
  `q3` tinyint(1) NOT NULL,
  `q4` tinyint(1) NOT NULL,
  `q5` tinyint(1) NOT NULL,
  `q5_txt` varchar(255) NOT NULL,
  `q6` tinyint(1) NOT NULL,
  `q6_txt` varchar(255) NOT NULL,
  `signature` varchar(50) NOT NULL,
  `signatureDate` date NOT NULL DEFAULT '0000-00-00',
  `wfh` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `tblOnlineDTR_HCD` (`id`, `empNumber`, `dtrDate`, `fullName`, `temperature`, `sex`, `age`, `residence_contact`, `email`, `natureVisit`, `natureOb`, `companyName`, `companyAddress`, `q1_1`, `q1_1_txt`, `q1_2`, `q1_3`, `q1_4`, `q1_5`, `q1_6`, `q1_7`, `q1_8`, `q1_9`, `q1_10`, `q1_11`, `q1_12`, `q1_13`, `q1_14`, `q2`, `q3`, `q4`, `q5`, `q5_txt`, `q6`, `q6_txt`, `signature`, `signatureDate`, `wfh`) VALUES ('1', '1111', '2021-09-29', 'HRMIS,  ADMIN  ', '36', 'M', '2021', '      - null', 'kimrheenlogronio@gmail.com', '', '', '', '', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '', '', '0000-00-00', '1');
INSERT INTO `tblOnlineDTR_HCD` (`id`, `empNumber`, `dtrDate`, `fullName`, `temperature`, `sex`, `age`, `residence_contact`, `email`, `natureVisit`, `natureOb`, `companyName`, `companyAddress`, `q1_1`, `q1_1_txt`, `q1_2`, `q1_3`, `q1_4`, `q1_5`, `q1_6`, `q1_7`, `q1_8`, `q1_9`, `q1_10`, `q1_11`, `q1_12`, `q1_13`, `q1_14`, `q2`, `q3`, `q4`, `q5`, `q5_txt`, `q6`, `q6_txt`, `signature`, `signatureDate`, `wfh`) VALUES ('2', 'OSEC-DENRB-CENRO-149', '2021-09-29', 'MANGLINONG,  SALVADOR C. JR. ', '36', 'M', '54', '     ', 'kimrheenlogronio@gmail.com', 'Official', 'Employee', '', '', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '', '', '0000-00-00', '0');
INSERT INTO `tblOnlineDTR_HCD` (`id`, `empNumber`, `dtrDate`, `fullName`, `temperature`, `sex`, `age`, `residence_contact`, `email`, `natureVisit`, `natureOb`, `companyName`, `companyAddress`, `q1_1`, `q1_1_txt`, `q1_2`, `q1_3`, `q1_4`, `q1_5`, `q1_6`, `q1_7`, `q1_8`, `q1_9`, `q1_10`, `q1_11`, `q1_12`, `q1_13`, `q1_14`, `q2`, `q3`, `q4`, `q5`, `q5_txt`, `q6`, `q6_txt`, `signature`, `signatureDate`, `wfh`) VALUES ('3', '1111', '2021-10-13', 'HRMIS,  ADMIN  ', '36.1', 'M', '2021', '      - null', 'asasd', '', '', '', '', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '', '', '0000-00-00', '1');
INSERT INTO `tblOnlineDTR_HCD` (`id`, `empNumber`, `dtrDate`, `fullName`, `temperature`, `sex`, `age`, `residence_contact`, `email`, `natureVisit`, `natureOb`, `companyName`, `companyAddress`, `q1_1`, `q1_1_txt`, `q1_2`, `q1_3`, `q1_4`, `q1_5`, `q1_6`, `q1_7`, `q1_8`, `q1_9`, `q1_10`, `q1_11`, `q1_12`, `q1_13`, `q1_14`, `q2`, `q3`, `q4`, `q5`, `q5_txt`, `q6`, `q6_txt`, `signature`, `signatureDate`, `wfh`) VALUES ('4', '1111', '2024-09-03', 'HRMIS,  ADMIN  ', '32', 'M', '2024', '      - null', 'admin@paete.gov.ph', 'Official', 'Employee', '', '', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '', '', '0000-00-00', '0');
INSERT INTO `tblOnlineDTR_HCD` (`id`, `empNumber`, `dtrDate`, `fullName`, `temperature`, `sex`, `age`, `residence_contact`, `email`, `natureVisit`, `natureOb`, `companyName`, `companyAddress`, `q1_1`, `q1_1_txt`, `q1_2`, `q1_3`, `q1_4`, `q1_5`, `q1_6`, `q1_7`, `q1_8`, `q1_9`, `q1_10`, `q1_11`, `q1_12`, `q1_13`, `q1_14`, `q2`, `q3`, `q4`, `q5`, `q5_txt`, `q6`, `q6_txt`, `signature`, `signatureDate`, `wfh`) VALUES ('5', '1111', '2024-09-08', 'HRMIS,  ADMIN  ', '32', 'M', '2024', '      - null', 'admin@paete.gov.ph', 'Official', 'Employee', '', '', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '', '', '0000-00-00', '0');


#
# TABLE STRUCTURE FOR: tblOverride
#

DROP TABLE IF EXISTS `tblOverride`;

CREATE TABLE `tblOverride` (
  `override_id` int(11) NOT NULL AUTO_INCREMENT,
  `override_type` int(11) NOT NULL,
  `office_type` varchar(20) NOT NULL,
  `office` varchar(20) NOT NULL,
  `appt_status` varchar(20) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` varchar(20) NOT NULL,
  `lastupdated_date` datetime DEFAULT NULL,
  `lastupdate_dby` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`override_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: tblPayrolRegister
#

DROP TABLE IF EXISTS `tblPayrolRegister`;

CREATE TABLE `tblPayrolRegister` (
  `period` int(1) NOT NULL DEFAULT 0,
  `employeeAppoint` varchar(20) NOT NULL DEFAULT '',
  `pageNo` int(5) NOT NULL DEFAULT 0,
  `BASIC` decimal(10,2) NOT NULL DEFAULT 0.00,
  `BASIC2` decimal(10,2) NOT NULL DEFAULT 0.00,
  `EARNED` decimal(10,2) NOT NULL DEFAULT 0.00,
  `ACA` decimal(10,2) NOT NULL DEFAULT 0.00,
  `PERA` decimal(10,2) NOT NULL DEFAULT 0.00,
  `RA` decimal(10,2) NOT NULL DEFAULT 0.00,
  `TA` decimal(10,2) NOT NULL DEFAULT 0.00,
  `ADJUST` decimal(10,2) NOT NULL DEFAULT 0.00,
  `RICE` decimal(10,2) NOT NULL DEFAULT 0.00,
  `ITW` decimal(10,2) NOT NULL DEFAULT 0.00,
  `GSIS` decimal(10,2) NOT NULL DEFAULT 0.00,
  `GSL` decimal(10,2) NOT NULL DEFAULT 0.00,
  `PROVI` decimal(10,2) NOT NULL DEFAULT 0.00,
  `OTHERDEDUCT` decimal(10,2) NOT NULL DEFAULT 0.00,
  `NETPAY` decimal(10,2) NOT NULL DEFAULT 0.00,
  `payRegMonth` int(2) NOT NULL DEFAULT 0,
  `payRegYear` year(4) NOT NULL DEFAULT 0000,
  `dateTime` varchar(30) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblPayrolRegisterZone
#

DROP TABLE IF EXISTS `tblPayrolRegisterZone`;

CREATE TABLE `tblPayrolRegisterZone` (
  `period` int(1) NOT NULL DEFAULT 0,
  `employeeAppoint` varchar(20) NOT NULL DEFAULT '',
  `pageNo` int(5) NOT NULL DEFAULT 0,
  `BASIC` decimal(10,2) NOT NULL DEFAULT 0.00,
  `BASIC2` decimal(10,2) NOT NULL DEFAULT 0.00,
  `EARNED` decimal(10,2) NOT NULL DEFAULT 0.00,
  `ACA` decimal(10,2) NOT NULL DEFAULT 0.00,
  `PERA` decimal(10,2) NOT NULL DEFAULT 0.00,
  `RA` decimal(10,2) NOT NULL DEFAULT 0.00,
  `TA` decimal(10,2) NOT NULL DEFAULT 0.00,
  `ADJUST` decimal(10,2) NOT NULL DEFAULT 0.00,
  `RICE` decimal(10,2) NOT NULL DEFAULT 0.00,
  `ITW` decimal(10,2) NOT NULL DEFAULT 0.00,
  `GSIS` decimal(10,2) NOT NULL DEFAULT 0.00,
  `GSL` decimal(10,2) NOT NULL DEFAULT 0.00,
  `PROVI` decimal(10,2) NOT NULL DEFAULT 0.00,
  `OTHERDEDUCT` decimal(10,2) NOT NULL DEFAULT 0.00,
  `NETPAY` decimal(10,2) NOT NULL DEFAULT 0.00,
  `payRegMonth` int(2) NOT NULL DEFAULT 0,
  `payRegYear` year(4) NOT NULL DEFAULT 0000,
  `dateTime` varchar(30) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblPayrollGroup
#

DROP TABLE IF EXISTS `tblPayrollGroup`;

CREATE TABLE `tblPayrollGroup` (
  `payrollGroupCode` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `payrollGroupName` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `projectCode` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `payrollGroupOrder` int(11) NOT NULL DEFAULT 0,
  `payrollGroupRC` varchar(30) NOT NULL DEFAULT '-',
  PRIMARY KEY (`payrollGroupCode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

#
# TABLE STRUCTURE FOR: tblPayrollOfficer
#

DROP TABLE IF EXISTS `tblPayrollOfficer`;

CREATE TABLE `tblPayrollOfficer` (
  `poID` int(11) NOT NULL AUTO_INCREMENT,
  `empNumber` varchar(20) NOT NULL DEFAULT '',
  `payrollGroupCode` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`poID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblPayrollProcess
#

DROP TABLE IF EXISTS `tblPayrollProcess`;

CREATE TABLE `tblPayrollProcess` (
  `appointmentCode` varchar(20) NOT NULL DEFAULT '',
  `processWith` varchar(200) NOT NULL DEFAULT '',
  `computation` varchar(30) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblPayrollProcess` (`appointmentCode`, `processWith`, `computation`) VALUES ('GIA', 'GIA', 'Semimonthly');
INSERT INTO `tblPayrollProcess` (`appointmentCode`, `processWith`, `computation`) VALUES ('JO', 'JO', 'Daily');
INSERT INTO `tblPayrollProcess` (`appointmentCode`, `processWith`, `computation`) VALUES ('P', 'CT,PC1,PC2,PC3,PC4,PC5,CTI,E,O,PA,SE,SU,T,P', 'Monthly');
INSERT INTO `tblPayrollProcess` (`appointmentCode`, `processWith`, `computation`) VALUES ('CONT', 'CONT', 'Daily');
INSERT INTO `tblPayrollProcess` (`appointmentCode`, `processWith`, `computation`) VALUES (' ', 'GIA-1, ', 'Semimonthly');


#
# TABLE STRUCTURE FOR: tblPhilhealthRange
#

DROP TABLE IF EXISTS `tblPhilhealthRange`;

CREATE TABLE `tblPhilhealthRange` (
  `philhealthFrom` decimal(10,2) NOT NULL DEFAULT 0.00,
  `philhealthTo` decimal(10,2) NOT NULL DEFAULT 0.00,
  `philSalaryBase` decimal(10,2) NOT NULL DEFAULT 0.00,
  `philMonthlyContri` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblPhilhealthRange` (`philhealthFrom`, `philhealthTo`, `philSalaryBase`, `philMonthlyContri`) VALUES ('26000.00', '26999.99', '26000.00', '650.00');
INSERT INTO `tblPhilhealthRange` (`philhealthFrom`, `philhealthTo`, `philSalaryBase`, `philMonthlyContri`) VALUES ('33000.00', '33999.99', '33000.00', '825.00');
INSERT INTO `tblPhilhealthRange` (`philhealthFrom`, `philhealthTo`, `philSalaryBase`, `philMonthlyContri`) VALUES ('31000.00', '31999.99', '32000.00', '800.00');
INSERT INTO `tblPhilhealthRange` (`philhealthFrom`, `philhealthTo`, `philSalaryBase`, `philMonthlyContri`) VALUES ('1.00', '7999.99', '7000.00', '175.00');
INSERT INTO `tblPhilhealthRange` (`philhealthFrom`, `philhealthTo`, `philSalaryBase`, `philMonthlyContri`) VALUES ('9000.00', '9999.99', '9000.00', '225.00');
INSERT INTO `tblPhilhealthRange` (`philhealthFrom`, `philhealthTo`, `philSalaryBase`, `philMonthlyContri`) VALUES ('10000.00', '10999.99', '10000.00', '250.00');
INSERT INTO `tblPhilhealthRange` (`philhealthFrom`, `philhealthTo`, `philSalaryBase`, `philMonthlyContri`) VALUES ('11000.00', '11999.99', '11000.00', '275.00');
INSERT INTO `tblPhilhealthRange` (`philhealthFrom`, `philhealthTo`, `philSalaryBase`, `philMonthlyContri`) VALUES ('12000.00', '12999.99', '12000.00', '300.00');
INSERT INTO `tblPhilhealthRange` (`philhealthFrom`, `philhealthTo`, `philSalaryBase`, `philMonthlyContri`) VALUES ('13000.00', '13999.99', '13000.00', '325.00');
INSERT INTO `tblPhilhealthRange` (`philhealthFrom`, `philhealthTo`, `philSalaryBase`, `philMonthlyContri`) VALUES ('14000.00', '14999.99', '14000.00', '350.00');
INSERT INTO `tblPhilhealthRange` (`philhealthFrom`, `philhealthTo`, `philSalaryBase`, `philMonthlyContri`) VALUES ('15000.00', '15999.99', '15000.00', '375.00');
INSERT INTO `tblPhilhealthRange` (`philhealthFrom`, `philhealthTo`, `philSalaryBase`, `philMonthlyContri`) VALUES ('16000.00', '16999.99', '16000.00', '400.00');
INSERT INTO `tblPhilhealthRange` (`philhealthFrom`, `philhealthTo`, `philSalaryBase`, `philMonthlyContri`) VALUES ('17000.00', '17999.99', '17000.00', '425.00');
INSERT INTO `tblPhilhealthRange` (`philhealthFrom`, `philhealthTo`, `philSalaryBase`, `philMonthlyContri`) VALUES ('18000.00', '18999.99', '18000.00', '450.00');
INSERT INTO `tblPhilhealthRange` (`philhealthFrom`, `philhealthTo`, `philSalaryBase`, `philMonthlyContri`) VALUES ('19000.00', '19999.99', '19000.99', '475.00');
INSERT INTO `tblPhilhealthRange` (`philhealthFrom`, `philhealthTo`, `philSalaryBase`, `philMonthlyContri`) VALUES ('20000.00', '20999.99', '20000.00', '500.00');
INSERT INTO `tblPhilhealthRange` (`philhealthFrom`, `philhealthTo`, `philSalaryBase`, `philMonthlyContri`) VALUES ('21000.00', '21999.99', '21000.00', '525.00');
INSERT INTO `tblPhilhealthRange` (`philhealthFrom`, `philhealthTo`, `philSalaryBase`, `philMonthlyContri`) VALUES ('22000.00', '22999.99', '22000.00', '550.00');
INSERT INTO `tblPhilhealthRange` (`philhealthFrom`, `philhealthTo`, `philSalaryBase`, `philMonthlyContri`) VALUES ('23000.00', '23999.99', '23000.00', '575.00');
INSERT INTO `tblPhilhealthRange` (`philhealthFrom`, `philhealthTo`, `philSalaryBase`, `philMonthlyContri`) VALUES ('24000.00', '24999.99', '24000.00', '600.00');
INSERT INTO `tblPhilhealthRange` (`philhealthFrom`, `philhealthTo`, `philSalaryBase`, `philMonthlyContri`) VALUES ('25000.00', '25999.99', '25000.00', '625.00');
INSERT INTO `tblPhilhealthRange` (`philhealthFrom`, `philhealthTo`, `philSalaryBase`, `philMonthlyContri`) VALUES ('27000.00', '27999.99', '27000.00', '675.00');
INSERT INTO `tblPhilhealthRange` (`philhealthFrom`, `philhealthTo`, `philSalaryBase`, `philMonthlyContri`) VALUES ('28000.00', '28999.99', '28000.00', '700.00');
INSERT INTO `tblPhilhealthRange` (`philhealthFrom`, `philhealthTo`, `philSalaryBase`, `philMonthlyContri`) VALUES ('29000.00', '29999.99', '29000.00', '725.00');
INSERT INTO `tblPhilhealthRange` (`philhealthFrom`, `philhealthTo`, `philSalaryBase`, `philMonthlyContri`) VALUES ('30000.00', '30999.99', '30000.00', '750.00');
INSERT INTO `tblPhilhealthRange` (`philhealthFrom`, `philhealthTo`, `philSalaryBase`, `philMonthlyContri`) VALUES ('34000.00', '34999.99', '34000.00', '850.00');
INSERT INTO `tblPhilhealthRange` (`philhealthFrom`, `philhealthTo`, `philSalaryBase`, `philMonthlyContri`) VALUES ('8000.00', '8999.00', '8000.00', '200.00');
INSERT INTO `tblPhilhealthRange` (`philhealthFrom`, `philhealthTo`, `philSalaryBase`, `philMonthlyContri`) VALUES ('35000.00', '100000.00', '110000.00', '875.00');


#
# TABLE STRUCTURE FOR: tblPlantilla
#

DROP TABLE IF EXISTS `tblPlantilla`;

CREATE TABLE `tblPlantilla` (
  `plantillaID` int(11) NOT NULL AUTO_INCREMENT,
  `itemNumber` varchar(50) NOT NULL DEFAULT '',
  `positionCode` varchar(20) NOT NULL DEFAULT '',
  `authorizeSalary` decimal(10,2) NOT NULL DEFAULT 0.00,
  `authorizeSalaryYear` decimal(15,2) NOT NULL DEFAULT 0.00,
  `salaryGrade` int(2) NOT NULL DEFAULT 0,
  `xstepNumber` int(2) NOT NULL DEFAULT 0,
  `plantillaGroupCode` varchar(20) NOT NULL DEFAULT '',
  `uniqueItemNumber` varchar(50) NOT NULL DEFAULT '',
  `plantillaItemOrder` int(5) NOT NULL DEFAULT 0,
  `payrollGroupCode` varchar(20) NOT NULL DEFAULT '',
  `agencyHead` int(1) NOT NULL DEFAULT 0,
  `rationalized` tinyint(1) NOT NULL DEFAULT 0,
  `salarySched` int(11) NOT NULL DEFAULT 0,
  `level` varchar(20) NOT NULL DEFAULT '',
  `areaCode` varchar(20) NOT NULL DEFAULT '',
  `areaType` varchar(20) NOT NULL DEFAULT '',
  `examCode` varchar(20) NOT NULL DEFAULT '',
  `examCode2` varchar(20) NOT NULL DEFAULT '',
  `educational` varchar(100) NOT NULL,
  `experience` varchar(100) NOT NULL,
  `training` varchar(100) NOT NULL,
  PRIMARY KEY (`plantillaID`),
  KEY `itemNumber` (`itemNumber`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblPlantilla` (`plantillaID`, `itemNumber`, `positionCode`, `authorizeSalary`, `authorizeSalaryYear`, `salaryGrade`, `xstepNumber`, `plantillaGroupCode`, `uniqueItemNumber`, `plantillaItemOrder`, `payrollGroupCode`, `agencyHead`, `rationalized`, `salarySched`, `level`, `areaCode`, `areaType`, `examCode`, `examCode2`, `educational`, `experience`, `training`) VALUES ('3', 'PAE-HR-062', 'AO-II', '0.00', '0.00', '11', '0', 'GAS', '', '0', '', '0', '0', '0', '', '060', 'R', 'CSE-2', '', '', '', '');
INSERT INTO `tblPlantilla` (`plantillaID`, `itemNumber`, `positionCode`, `authorizeSalary`, `authorizeSalaryYear`, `salaryGrade`, `xstepNumber`, `plantillaGroupCode`, `uniqueItemNumber`, `plantillaItemOrder`, `payrollGroupCode`, `agencyHead`, `rationalized`, `salarySched`, `level`, `areaCode`, `areaType`, `examCode`, `examCode2`, `educational`, `experience`, `training`) VALUES ('4', 'PAE-MO-007', 'ADA-1', '0.00', '0.00', '7', '0', '1', '', '0', '', '0', '0', '0', '', '060', 'R', '', '', '', '', '');


#
# TABLE STRUCTURE FOR: tblPlantillaDuties
#

DROP TABLE IF EXISTS `tblPlantillaDuties`;

CREATE TABLE `tblPlantillaDuties` (
  `plantilla_duties_index` int(11) NOT NULL AUTO_INCREMENT,
  `itemNumber` varchar(50) NOT NULL,
  `percentWork` int(5) NOT NULL,
  `itemDuties` text NOT NULL,
  `dutyNumber` int(11) NOT NULL,
  PRIMARY KEY (`plantilla_duties_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblPlantillaGroup
#

DROP TABLE IF EXISTS `tblPlantillaGroup`;

CREATE TABLE `tblPlantillaGroup` (
  `plantillaGroupId` int(11) NOT NULL AUTO_INCREMENT,
  `plantillaGroupCode` varchar(20) NOT NULL DEFAULT '',
  `plantillaGroupName` varchar(255) NOT NULL DEFAULT '',
  `plantillaGroupOrder` int(11) NOT NULL,
  PRIMARY KEY (`plantillaGroupId`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblPlantillaGroup` (`plantillaGroupId`, `plantillaGroupCode`, `plantillaGroupName`, `plantillaGroupOrder`) VALUES ('1', 'GAS', 'GENERAL ADMINISTRATIVE SERVICE', '1');
INSERT INTO `tblPlantillaGroup` (`plantillaGroupId`, `plantillaGroupCode`, `plantillaGroupName`, `plantillaGroupOrder`) VALUES ('2', 'FS', 'FINANCIAL SERVICE', '2');


#
# TABLE STRUCTURE FOR: tblPosition
#

DROP TABLE IF EXISTS `tblPosition`;

CREATE TABLE `tblPosition` (
  `positionId` int(11) NOT NULL AUTO_INCREMENT,
  `positionCode` varchar(20) NOT NULL DEFAULT '',
  `positionAbb` varchar(50) NOT NULL DEFAULT '',
  `positionDesc` varchar(70) NOT NULL DEFAULT '',
  `educational` varchar(100) NOT NULL DEFAULT '',
  `experience` varchar(100) NOT NULL DEFAULT '',
  `eligibility` varchar(100) NOT NULL DEFAULT '',
  `training` varchar(200) NOT NULL DEFAULT '',
  `level` varchar(5) NOT NULL DEFAULT '',
  PRIMARY KEY (`positionId`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblPosition` (`positionId`, `positionCode`, `positionAbb`, `positionDesc`, `educational`, `experience`, `eligibility`, `training`, `level`) VALUES ('35', 'AO-II', 'AO-II', 'Administrative Officer II', '', '', '', '', '');
INSERT INTO `tblPosition` (`positionId`, `positionCode`, `positionAbb`, `positionDesc`, `educational`, `experience`, `eligibility`, `training`, `level`) VALUES ('36', 'AA-I', 'AA-I', 'Administrative Aide I', '', '', '', '', '');
INSERT INTO `tblPosition` (`positionId`, `positionCode`, `positionAbb`, `positionDesc`, `educational`, `experience`, `eligibility`, `training`, `level`) VALUES ('37', 'ADA-1', 'ADA-1', 'Administrative Assistant I', '', '', '', '', '');


#
# TABLE STRUCTURE FOR: tblProcess
#

DROP TABLE IF EXISTS `tblProcess`;

CREATE TABLE `tblProcess` (
  `processID` int(11) NOT NULL AUTO_INCREMENT,
  `employeeAppoint` varchar(20) NOT NULL DEFAULT '',
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `processDate` date DEFAULT NULL,
  `processMonth` int(11) DEFAULT NULL,
  `processYear` int(11) DEFAULT NULL,
  `processCode` varchar(15) DEFAULT NULL,
  `payrollGroupCode` varchar(50) NOT NULL DEFAULT '',
  `salarySchedule` varchar(10) NOT NULL DEFAULT '',
  `period` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`processID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblProcessedEmployees
#

DROP TABLE IF EXISTS `tblProcessedEmployees`;

CREATE TABLE `tblProcessedEmployees` (
  `processID` int(11) NOT NULL DEFAULT 0,
  `appointmentCode` varchar(20) NOT NULL DEFAULT '',
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `surname` varchar(50) NOT NULL DEFAULT '',
  `firstname` varchar(50) NOT NULL DEFAULT '',
  `middlename` varchar(50) NOT NULL DEFAULT '',
  `middleInitial` varchar(10) NOT NULL DEFAULT '',
  `nameExtension` varchar(10) NOT NULL DEFAULT '',
  `positionAbb` varchar(50) NOT NULL DEFAULT '',
  `processDate` date DEFAULT NULL,
  `processMonth` int(11) DEFAULT NULL,
  `processYear` int(11) DEFAULT NULL,
  `processCode` varchar(15) DEFAULT NULL,
  `payrollGroupCode` varchar(50) NOT NULL DEFAULT '',
  `projectCode` varchar(20) NOT NULL DEFAULT '',
  `netPayPeriod1` decimal(10,2) NOT NULL DEFAULT 0.00,
  `netPayPeriod2` decimal(10,2) NOT NULL DEFAULT 0.00,
  `netPay` decimal(10,2) NOT NULL DEFAULT 0.00,
  `actualSalary` decimal(10,2) NOT NULL DEFAULT 0.00,
  `positionCode` varchar(20) NOT NULL DEFAULT '',
  `officeCode` varchar(20) NOT NULL DEFAULT '',
  `salarySchedule` varchar(10) NOT NULL DEFAULT '',
  `period` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblProcessedPayrollGroup
#

DROP TABLE IF EXISTS `tblProcessedPayrollGroup`;

CREATE TABLE `tblProcessedPayrollGroup` (
  `processID` int(11) NOT NULL DEFAULT 0,
  `payrollGroupCode` varchar(20) NOT NULL DEFAULT '',
  `payrollGroupName` varchar(200) NOT NULL DEFAULT '',
  `projectCode` varchar(20) NOT NULL DEFAULT '',
  `payrollGroupOrder` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblProcessedProject
#

DROP TABLE IF EXISTS `tblProcessedProject`;

CREATE TABLE `tblProcessedProject` (
  `processID` int(11) NOT NULL DEFAULT 0,
  `projectCode` varchar(100) NOT NULL DEFAULT '',
  `projectDesc` text NOT NULL,
  `projectOrder` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblProject
#

DROP TABLE IF EXISTS `tblProject`;

CREATE TABLE `tblProject` (
  `projectCode` varchar(100) NOT NULL DEFAULT '',
  `projectDesc` text NOT NULL,
  `projectOrder` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`projectCode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblRATA
#

DROP TABLE IF EXISTS `tblRATA`;

CREATE TABLE `tblRATA` (
  `RATACode` char(3) NOT NULL DEFAULT '',
  `RATAAmount` decimal(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`RATACode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblReportType
#

DROP TABLE IF EXISTS `tblReportType`;

CREATE TABLE `tblReportType` (
  `reportCode` varchar(10) NOT NULL DEFAULT '',
  `reportDesc` text NOT NULL,
  `reportType` varchar(255) NOT NULL DEFAULT '',
  `reportModule` varchar(4) NOT NULL DEFAULT '',
  `numberOfSignatory` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`reportCode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblReports
#

DROP TABLE IF EXISTS `tblReports`;

CREATE TABLE `tblReports` (
  `reportCode` varchar(10) NOT NULL DEFAULT '',
  `reportDesc` text NOT NULL,
  `reportType` varchar(255) NOT NULL DEFAULT '',
  `reportModule` varchar(4) NOT NULL DEFAULT '',
  `reportStatus` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`reportCode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('PR', 'Payroll Register', 'Monthly', '2', '1');
INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('PS', 'Pay Slip', 'Monthly', '2', '1');
INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('MCBR', 'MC Benefit Register for DOST Employees', 'Monthly', '2', '1');
INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('DR', 'Deduction Register for DOST Employees', 'Monthly', '2', '1');
INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('FR', 'Funding Requirements', 'Monthly', '2', '1');
INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('AR', 'Acceptance of Resignation', '', '1', '1');
INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('ARO', 'Accumulated Report By Office', '', '1', '1');
INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('AFLF', 'Application for Leave Form', '', '1', '1');
INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('ADR', 'Assumption of Duties and Responsibilities', '', '1', '1');
INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('DTR', 'Daily Time Record', '', '1', '1');
INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('CDR', 'Certificate of Duties and Responsibilities', '', '1', '1');
INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('PDS', 'Personal Data Sheet', '', '1', '1');
INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('CEC', 'Certificate of Employees Compensation', '', '1', '1');
INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('CNAC', 'Certificate of No Administrative Charge', '', '1', '1');
INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('CNACLP', 'Certificate of No Administrative Charge (for legal purposes)', '', '1', '1');
INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('CNACL', 'Certification of Service for Loyalty Award', '', '1', '1');
INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('CACQ', 'Comparative Analysis of Candidates\' Qualifications', '', '1', '1');
INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('LEA', 'List of Educational Attainment', '', '1', '1');
INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('LEAGE', 'List of Employees by Age', '', '1', '1');
INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('LEDH', 'List of Employees by Date Hired', '', '1', '1');
INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('LEDB', 'List of Employees by Date of Birth', '', '1', '1');
INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('LEEA', 'List of Employees by Educational Attainment', '', '1', '1');
INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('LEG', 'List of Employees by Gender', '', '1', '1');
INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('LELS', 'List of Employees by Length of Service', '', '1', '1');
INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('LESG', 'List of Employees by Salary Grade', '', '1', '1');
INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('ALC', 'Accumulated Leave Credits', '', '1', '1');
INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('SR', 'Service Record', '', '1', '1');
INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('ROT', 'Report on Tardiness', '', '1', '1');
INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('ROTUA', 'Report on Tardiness, Undertime and Absences', '', '1', '1');
INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('TOS', 'Trainings of Staff', '', '1', '1');
INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('LET', 'List of Employees\' Training', '', '1', '1');
INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('EFDS', 'Employees First Day of Service', '', '1', '1');
INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('EP', 'Employees Profile', '', '1', '1');
INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('LESGA', 'List of Employees by Salary Grade (Alphabetical)', '', '1', '1');
INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('LEDBA', 'List of Employees\' Date of Birth (Alphabetical)', '', '1', '1');
INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('LR', 'List of Retirees', '', '1', '1');
INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('LTP', 'List of Training Programs', '', '1', '1');
INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('LVP', 'List of Vacant Position(s)', '', '1', '1');
INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('LOYR', 'Loyalty Report', '', '1', '1');
INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('OB', 'Official Business Slip', '', '1', '1');
INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('PSK', 'Panunumpa sa Katungkulan', '', '1', '1');
INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('PP', 'Plantilla of Personnel', '', '1', '1');
INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('EAS', 'Employees Attendance Summary', '', '1', '1');
INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('AAR', 'Report of Attendance and Accumulated Leave Credits', '', '1', '1');
INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('LB', 'Leave Balance Form', '', '1', '1');
INSERT INTO `tblReports` (`reportCode`, `reportDesc`, `reportType`, `reportModule`, `reportStatus`) VALUES ('SR67', 'Service Record (CS Form No. 67)', '', '1', '1');


#
# TABLE STRUCTURE FOR: tblRequestApplicant
#

DROP TABLE IF EXISTS `tblRequestApplicant`;

CREATE TABLE `tblRequestApplicant` (
  `AppliCode` varchar(100) NOT NULL DEFAULT '',
  `Applicant` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`AppliCode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblRequestApplicant` (`AppliCode`, `Applicant`) VALUES ('EXECUTIVE', 'Employees under Executive Office');
INSERT INTO `tblRequestApplicant` (`AppliCode`, `Applicant`) VALUES ('SERVICE', 'Employees under Service');
INSERT INTO `tblRequestApplicant` (`AppliCode`, `Applicant`) VALUES ('DIVISION', 'Employees under Division');
INSERT INTO `tblRequestApplicant` (`AppliCode`, `Applicant`) VALUES ('SECTION', 'Employees under Section');
INSERT INTO `tblRequestApplicant` (`AppliCode`, `Applicant`) VALUES ('SECTIONHEAD', 'Section Head');
INSERT INTO `tblRequestApplicant` (`AppliCode`, `Applicant`) VALUES ('DIVISIONHEAD', 'Division Head');
INSERT INTO `tblRequestApplicant` (`AppliCode`, `Applicant`) VALUES ('SERVICEHEAD', 'Service Head');
INSERT INTO `tblRequestApplicant` (`AppliCode`, `Applicant`) VALUES ('ALLEMP', 'All Employees');
INSERT INTO `tblRequestApplicant` (`AppliCode`, `Applicant`) VALUES ('EXEHEAD', 'Executive Office Head');


#
# TABLE STRUCTURE FOR: tblRequestFlow
#

DROP TABLE IF EXISTS `tblRequestFlow`;

CREATE TABLE `tblRequestFlow` (
  `reqID` int(2) NOT NULL AUTO_INCREMENT,
  `RequestType` varchar(100) NOT NULL DEFAULT '',
  `Applicant` varchar(100) NOT NULL DEFAULT '',
  `Signatory1` varchar(100) NOT NULL DEFAULT '',
  `Signatory2` varchar(100) NOT NULL DEFAULT '',
  `Signatory3` varchar(100) NOT NULL DEFAULT '',
  `SignatoryFin` varchar(100) NOT NULL DEFAULT '',
  `isactive` int(11) NOT NULL,
  PRIMARY KEY (`reqID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblRequestFlow` (`reqID`, `RequestType`, `Applicant`, `Signatory1`, `Signatory2`, `Signatory3`, `SignatoryFin`, `isactive`) VALUES ('1', 'TO', 'ALLEMP;PILOILO;', 'RECOMMENDED;;CADOF-96-2014', 'APPROVED;;OSEC-DENRB-CENRO-149', 'APPROVED;;PENRO-33-1998', 'CERTIFIED;;PENRO-32-1998', '0');
INSERT INTO `tblRequestFlow` (`reqID`, `RequestType`, `Applicant`, `Signatory1`, `Signatory2`, `Signatory3`, `SignatoryFin`, `isactive`) VALUES ('2', 'TO', 'ALLEMP;PILOILO;INFOSA2-98-2014', 'RECOMMENDED;;CADOF-96-2014', 'APPROVED;;OSEC-DENRB-CENRO-149', 'APPROVED;;PENRO-33-1998', 'CERTIFIED;;PENRO-32-1998', '0');


#
# TABLE STRUCTURE FOR: tblRequestSignatory
#

DROP TABLE IF EXISTS `tblRequestSignatory`;

CREATE TABLE `tblRequestSignatory` (
  `SignCode` varchar(50) NOT NULL DEFAULT '',
  `Signatory` varchar(100) NOT NULL DEFAULT '',
  `SignHead` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`SignCode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblRequestSignatoryAction
#

DROP TABLE IF EXISTS `tblRequestSignatoryAction`;

CREATE TABLE `tblRequestSignatoryAction` (
  `ID` int(2) NOT NULL AUTO_INCREMENT,
  `ActionDesc` varchar(50) NOT NULL DEFAULT '',
  `ActionCode` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblRequestSignatoryAction` (`ID`, `ActionDesc`, `ActionCode`) VALUES ('1', 'CERTIFY', 'CERTIFIED');
INSERT INTO `tblRequestSignatoryAction` (`ID`, `ActionDesc`, `ActionCode`) VALUES ('2', 'APPROVE', 'APPROVED');
INSERT INTO `tblRequestSignatoryAction` (`ID`, `ActionDesc`, `ActionCode`) VALUES ('3', 'RECOMMEND', 'RECOMMENDED');


#
# TABLE STRUCTURE FOR: tblRequestType
#

DROP TABLE IF EXISTS `tblRequestType`;

CREATE TABLE `tblRequestType` (
  `requestCode` varchar(20) NOT NULL DEFAULT '',
  `requestDesc` text NOT NULL,
  PRIMARY KEY (`requestCode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblRequestType` (`requestCode`, `requestDesc`) VALUES ('Leave', 'Leave');
INSERT INTO `tblRequestType` (`requestCode`, `requestDesc`) VALUES ('OB', 'Official Business');
INSERT INTO `tblRequestType` (`requestCode`, `requestDesc`) VALUES ('201', 'Update PDS');
INSERT INTO `tblRequestType` (`requestCode`, `requestDesc`) VALUES ('Report', 'Reports');
INSERT INTO `tblRequestType` (`requestCode`, `requestDesc`) VALUES ('Trainings', 'Seminars / Trainings');
INSERT INTO `tblRequestType` (`requestCode`, `requestDesc`) VALUES ('TO', 'Travel Order');
INSERT INTO `tblRequestType` (`requestCode`, `requestDesc`) VALUES ('DTR', 'DTR Update Request');


#
# TABLE STRUCTURE FOR: tblSalarySched
#

DROP TABLE IF EXISTS `tblSalarySched`;

CREATE TABLE `tblSalarySched` (
  `stepNumber` int(2) NOT NULL DEFAULT 0,
  `salaryGradeNumber` int(2) NOT NULL DEFAULT 0,
  `actualSalary` decimal(10,2) NOT NULL DEFAULT 0.00,
  `version` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('1', '1', '9981.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('2', '1', '10072.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('3', '1', '10165.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('4', '1', '10258.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('5', '1', '10352.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('6', '1', '10453.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('7', '1', '10543.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('8', '1', '10640.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('1', '2', '10667.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('2', '2', '10761.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('3', '2', '10856.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('4', '2', '10952.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('5', '2', '11049.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('6', '2', '11147.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('7', '2', '11245.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('8', '2', '11345.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('1', '3', '11387.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('2', '3', '11488.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('3', '3', '11589.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('4', '3', '11691.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('5', '3', '11795.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('6', '3', '11899.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('8', '3', '12110.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('7', '3', '12004.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('1', '4', '12155.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('2', '4', '12262.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('3', '4', '12371.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('4', '4', '12480.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('5', '4', '12591.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('6', '4', '12702.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('7', '4', '12814.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('8', '4', '12927.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('1', '5', '12975.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('2', '5', '13117.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('3', '5', '13206.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('4', '5', '13322.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('5', '5', '13440.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('6', '5', '13559.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('7', '5', '13679.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('8', '5', '13799.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('1', '6', '13851.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('2', '6', '13973.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('3', '6', '14096.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('4', '6', '14221.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('5', '6', '14347.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('6', '6', '14474.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('7', '6', '14602.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('8', '6', '14731.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('1', '7', '14785.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('2', '7', '14916.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('3', '7', '15048.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('4', '7', '15181.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('5', '7', '15315.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('6', '7', '15450.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('7', '7', '15587.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('8', '7', '15725.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('1', '8', '15818.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('2', '8', '15969.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('3', '8', '16121.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('4', '8', '16275.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('5', '8', '16430.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('6', '8', '16586.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('7', '8', '16744.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('8', '8', '16903.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('1', '9', '16986.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('2', '9', '17142.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('3', '9', '17299.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('4', '9', '17458.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('5', '9', '17618.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('6', '9', '17780.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('7', '9', '17943.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('8', '9', '18108.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('1', '10', '18217.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('2', '10', '18385.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('3', '10', '18553.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('4', '10', '18724.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('5', '10', '18896.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('6', '10', '19095.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('7', '10', '19244.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('8', '10', '19421.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('1', '11', '19620.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('2', '11', '19853.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('3', '11', '20088.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('4', '11', '20326.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('5', '11', '20567.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('6', '11', '20811.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('7', '11', '21058.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('8', '11', '21307.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('1', '12', '21387.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('2', '12', '21626.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('3', '12', '21868.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('4', '12', '22113.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('5', '12', '22361.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('6', '12', '22611.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('7', '12', '22864.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('8', '12', '23120.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('1', '13', '23257.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('2', '13', '23517.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('3', '13', '23780.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('4', '13', '24047.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('5', '13', '24315.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('6', '13', '24587.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('7', '13', '24863.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('8', '13', '25141.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('1', '14', '25290.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('2', '14', '25573.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('3', '14', '25859.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('4', '14', '26149.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('5', '14', '26441.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('6', '14', '26737.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('7', '14', '27036.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('8', '14', '27339.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('1', '15', '27565.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('2', '15', '27887.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('3', '15', '28214.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('4', '15', '28544.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('5', '15', '28877.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('6', '15', '29214.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('7', '15', '29557.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('8', '15', '29902.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('1', '16', '30044.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('2', '16', '30396.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('3', '16', '30751.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('4', '16', '31111.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('5', '16', '31474.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('6', '16', '31843.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('7', '16', '32215.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('8', '16', '32592.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('1', '17', '32747.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('2', '17', '33131.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('3', '17', '33518.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('4', '17', '33909.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('5', '17', '34306.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('6', '17', '34707.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('7', '17', '35113.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('8', '17', '35524.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('1', '18', '35693.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('2', '18', '36111.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('3', '18', '36532.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('4', '18', '36960.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('5', '18', '37392.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('6', '18', '37829.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('7', '18', '38272.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('8', '18', '38719.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('1', '19', '39151.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('2', '19', '39685.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('3', '19', '40227.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('4', '19', '40776.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('5', '19', '41333.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('6', '19', '41898.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('7', '19', '42470.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('8', '19', '43051.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('1', '20', '43250.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('2', '20', '43841.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('3', '20', '44440.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('4', '20', '45047.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('5', '20', '45662.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('6', '20', '46285.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('7', '20', '46917.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('8', '20', '47559.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('1', '21', '47779.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('2', '21', '48432.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('3', '21', '49094.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('4', '21', '49764.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('5', '21', '50443.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('6', '21', '51132.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('7', '21', '51831.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('8', '21', '52539.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('1', '22', '52783.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('2', '22', '53503.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('3', '22', '54234.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('4', '22', '54975.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('5', '22', '55726.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('6', '22', '56487.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('7', '22', '57258.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('8', '22', '58040.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('1', '23', '58310.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('2', '23', '59106.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('3', '23', '59913.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('4', '23', '60732.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('5', '23', '61561.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('6', '23', '62402.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('7', '23', '63255.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('8', '23', '64118.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('1', '24', '64416.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('2', '24', '65296.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('3', '24', '66187.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('4', '24', '67092.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('5', '24', '68008.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('6', '24', '68937.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('7', '24', '69878.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('8', '24', '70832.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('1', '25', '71476.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('2', '25', '72452.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('3', '25', '73441.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('4', '25', '74444.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('5', '25', '75461.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('6', '25', '76491.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('7', '25', '77536.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('8', '25', '78595.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('1', '26', '78960.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('2', '26', '80039.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('3', '26', '81132.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('4', '26', '82240.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('5', '26', '83363.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('6', '26', '84502.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('7', '26', '85657.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('8', '26', '86825.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('1', '27', '87229.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('2', '27', '88420.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('3', '27', '89628.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('4', '27', '90852.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('5', '27', '92093.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('6', '27', '93351.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('7', '27', '94625.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('8', '27', '95925.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('1', '28', '96363.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('2', '28', '97679.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('3', '28', '99013.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('4', '28', '100366.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('5', '28', '101736.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('6', '28', '103126.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('7', '28', '104534.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('8', '28', '105962.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('1', '29', '106454.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('2', '29', '107908.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('3', '29', '109382.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('4', '29', '110875.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('5', '29', '112390.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('6', '29', '113925.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('7', '29', '115481.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('8', '29', '117058.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('1', '30', '117601.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('2', '30', '119208.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('3', '30', '120836.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('4', '30', '122486.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('5', '30', '124159.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('6', '30', '125855.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('7', '30', '127855.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('8', '30', '129316.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('1', '31', '152325.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('2', '31', '154649.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('3', '31', '157008.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('4', '31', '159404.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('5', '31', '161836.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('6', '31', '164305.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('7', '31', '166812.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('8', '31', '169357.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('1', '32', '177929.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('2', '32', '180700.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('2', '33', '222278.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('1', '33', '215804.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('8', '32', '198255.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('7', '32', '195215.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('6', '32', '192221.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('5', '32', '189274.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('4', '32', '186372.00', '5');
INSERT INTO `tblSalarySched` (`stepNumber`, `salaryGradeNumber`, `actualSalary`, `version`) VALUES ('3', '32', '183513.00', '5');


#
# TABLE STRUCTURE FOR: tblSalarySchedVersion
#

DROP TABLE IF EXISTS `tblSalarySchedVersion`;

CREATE TABLE `tblSalarySchedVersion` (
  `version` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(50) NOT NULL DEFAULT '',
  `effectivity` date NOT NULL DEFAULT '0000-00-00',
  `unused` tinyint(1) NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`version`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblSalarySchedVersion` (`version`, `title`, `description`, `effectivity`, `unused`, `active`) VALUES ('5', 'LBC 149-24 A-6 (Fourth Tranche)', 'LBC 149-24 A-6 (Fourth Tranche)', '2017-01-01', '1', '1');


#
# TABLE STRUCTURE FOR: tblScheduler_Logs
#

DROP TABLE IF EXISTS `tblScheduler_Logs`;

CREATE TABLE `tblScheduler_Logs` (
  `id` int(10) NOT NULL DEFAULT 0,
  `script` varchar(130) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `output` text CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `execution_time` varchar(130) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblScholarship
#

DROP TABLE IF EXISTS `tblScholarship`;

CREATE TABLE `tblScholarship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblScholarship` (`id`, `description`) VALUES ('1', 'DOST-SEI Scholarship');
INSERT INTO `tblScholarship` (`id`, `description`) VALUES ('2', 'MalacaÃ±ang Scholar');
INSERT INTO `tblScholarship` (`id`, `description`) VALUES ('6', 'ACTC Scholarship Develpoment Program');
INSERT INTO `tblScholarship` (`id`, `description`) VALUES ('4', 'DOST-HRDP');
INSERT INTO `tblScholarship` (`id`, `description`) VALUES ('5', 'FPJ Scholarship Program');
INSERT INTO `tblScholarship` (`id`, `description`) VALUES ('7', 'DOST Scholarship Program');
INSERT INTO `tblScholarship` (`id`, `description`) VALUES ('8', 'JLP Scholar');
INSERT INTO `tblScholarship` (`id`, `description`) VALUES ('9', 'DOST-ASTHRDP');
INSERT INTO `tblScholarship` (`id`, `description`) VALUES ('10', 'CHED Scholarship');


#
# TABLE STRUCTURE FOR: tblSecurityCode
#

DROP TABLE IF EXISTS `tblSecurityCode`;

CREATE TABLE `tblSecurityCode` (
  `securityID` int(11) NOT NULL AUTO_INCREMENT,
  `empNumber` varchar(20) NOT NULL DEFAULT '',
  `securityQuestion` varchar(30) NOT NULL DEFAULT '',
  `securityAnswer` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`securityID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblSecurityQuestion
#

DROP TABLE IF EXISTS `tblSecurityQuestion`;

CREATE TABLE `tblSecurityQuestion` (
  `securityCode` int(11) NOT NULL AUTO_INCREMENT,
  `securityQuestion` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`securityCode`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblSecurityQuestion` (`securityCode`, `securityQuestion`) VALUES ('1', 'What is the first name of your favorite uncle?');
INSERT INTO `tblSecurityQuestion` (`securityCode`, `securityQuestion`) VALUES ('2', 'Where did you meet your spouse?');
INSERT INTO `tblSecurityQuestion` (`securityCode`, `securityQuestion`) VALUES ('3', 'What is your oldest cousin\'s name?');
INSERT INTO `tblSecurityQuestion` (`securityCode`, `securityQuestion`) VALUES ('4', 'What is your youngest child\'s nickname?');
INSERT INTO `tblSecurityQuestion` (`securityCode`, `securityQuestion`) VALUES ('5', 'What is the first name of your oldest niece?');
INSERT INTO `tblSecurityQuestion` (`securityCode`, `securityQuestion`) VALUES ('6', 'What is the first name of your oldest nephew?');
INSERT INTO `tblSecurityQuestion` (`securityCode`, `securityQuestion`) VALUES ('7', 'What is the first name of favourite aunt?');
INSERT INTO `tblSecurityQuestion` (`securityCode`, `securityQuestion`) VALUES ('8', 'Where did you spent your honeymoon?');


#
# TABLE STRUCTURE FOR: tblSeparationCause
#

DROP TABLE IF EXISTS `tblSeparationCause`;

CREATE TABLE `tblSeparationCause` (
  `separationCause` varchar(50) NOT NULL DEFAULT '',
  `system` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`separationCause`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblSeparationCause` (`separationCause`, `system`) VALUES ('AWOL', '1');
INSERT INTO `tblSeparationCause` (`separationCause`, `system`) VALUES ('Deceased', '1');
INSERT INTO `tblSeparationCause` (`separationCause`, `system`) VALUES ('Drop-from-the-Rolls', '1');
INSERT INTO `tblSeparationCause` (`separationCause`, `system`) VALUES ('End-of-Contract', '1');
INSERT INTO `tblSeparationCause` (`separationCause`, `system`) VALUES ('Rationalization-Plan', '1');
INSERT INTO `tblSeparationCause` (`separationCause`, `system`) VALUES ('Resigned', '1');
INSERT INTO `tblSeparationCause` (`separationCause`, `system`) VALUES ('Retired', '1');
INSERT INTO `tblSeparationCause` (`separationCause`, `system`) VALUES ('Terminated', '1');
INSERT INTO `tblSeparationCause` (`separationCause`, `system`) VALUES ('Transferred', '1');
INSERT INTO `tblSeparationCause` (`separationCause`, `system`) VALUES ('Permanent', '0');


#
# TABLE STRUCTURE FOR: tblServiceCode
#

DROP TABLE IF EXISTS `tblServiceCode`;

CREATE TABLE `tblServiceCode` (
  `serviceCode` varchar(20) NOT NULL DEFAULT '',
  `serviceDesc` varchar(50) NOT NULL DEFAULT '',
  `system` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`serviceCode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblServiceCode` (`serviceCode`, `serviceDesc`, `system`) VALUES ('GOV', 'Government', '1');
INSERT INTO `tblServiceCode` (`serviceCode`, `serviceDesc`, `system`) VALUES ('PRIV', 'Private', '1');
INSERT INTO `tblServiceCode` (`serviceCode`, `serviceDesc`, `system`) VALUES ('SPRIV', 'Semi-Private', '1');
INSERT INTO `tblServiceCode` (`serviceCode`, `serviceDesc`, `system`) VALUES ('LGU', 'Local Government Unit', '1');
INSERT INTO `tblServiceCode` (`serviceCode`, `serviceDesc`, `system`) VALUES ('GOCC', 'Government Owned and Controlled Corporation', '1');
INSERT INTO `tblServiceCode` (`serviceCode`, `serviceDesc`, `system`) VALUES ('SGOV', 'Semi-Government', '1');
INSERT INTO `tblServiceCode` (`serviceCode`, `serviceDesc`, `system`) VALUES ('GPRJ', 'Government Project', '1');
INSERT INTO `tblServiceCode` (`serviceCode`, `serviceDesc`, `system`) VALUES ('SUC', 'State Universities and Colleges', '0');


#
# TABLE STRUCTURE FOR: tblServiceRecord
#

DROP TABLE IF EXISTS `tblServiceRecord`;

CREATE TABLE `tblServiceRecord` (
  `serviceRecID` int(11) NOT NULL AUTO_INCREMENT,
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `serviceFromDate` date NOT NULL DEFAULT '0000-00-00',
  `serviceToDate` varchar(10) NOT NULL DEFAULT '0000-00-00',
  `tmpServiceToDate` varchar(25) NOT NULL DEFAULT 'Present',
  `positionCode` varchar(10) NOT NULL DEFAULT '',
  `positionDesc` text NOT NULL,
  `salary` decimal(10,2) NOT NULL DEFAULT 0.00,
  `salaryPer` varchar(10) NOT NULL DEFAULT '',
  `stationAgency` varchar(50) NOT NULL DEFAULT '',
  `salaryGrade` varchar(10) DEFAULT '',
  `appointmentCode` varchar(50) NOT NULL DEFAULT '',
  `governService` varchar(5) DEFAULT NULL,
  `NCCRA` varchar(20) DEFAULT NULL,
  `separationCause` varchar(20) DEFAULT NULL,
  `separationDate` varchar(10) DEFAULT NULL,
  `branch` varchar(50) DEFAULT NULL,
  `currency` varchar(10) NOT NULL DEFAULT '',
  `remarks` varchar(50) NOT NULL DEFAULT '',
  `lwop` int(3) NOT NULL DEFAULT 0,
  `processor` varchar(50) NOT NULL,
  `signee` varchar(50) NOT NULL,
  PRIMARY KEY (`serviceRecID`),
  KEY `empNumber` (`empNumber`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblServiceRecord` (`serviceRecID`, `empNumber`, `serviceFromDate`, `serviceToDate`, `tmpServiceToDate`, `positionCode`, `positionDesc`, `salary`, `salaryPer`, `stationAgency`, `salaryGrade`, `appointmentCode`, `governService`, `NCCRA`, `separationCause`, `separationDate`, `branch`, `currency`, `remarks`, `lwop`, `processor`, `signee`) VALUES ('1', 'POS4-5-2014', '2015-09-08', '', 'Present', '', 'Park Operation Superintendent IV ', '69.00', 'Month', 'DENR', '22', 'P', 'No', NULL, '', '', 'National', '', '', '0', '', '');
INSERT INTO `tblServiceRecord` (`serviceRecID`, `empNumber`, `serviceFromDate`, `serviceToDate`, `tmpServiceToDate`, `positionCode`, `positionDesc`, `salary`, `salaryPer`, `stationAgency`, `salaryGrade`, `appointmentCode`, `governService`, `NCCRA`, `separationCause`, `separationDate`, `branch`, `currency`, `remarks`, `lwop`, `processor`, `signee`) VALUES ('3', 'INFOSA2-98-2014', '2016-02-09', '', 'Present', '', 'Information System Analyst II', '36000.00', 'Month', 'PENRO Iloilo', 'SG 16', 'P', 'No', NULL, '', '', 'National', 'Php', '', '0', '', '');


#
# TABLE STRUCTURE FOR: tblSignatory
#

DROP TABLE IF EXISTS `tblSignatory`;

CREATE TABLE `tblSignatory` (
  `signatoryId` int(11) NOT NULL AUTO_INCREMENT,
  `payrollGroupCode` varchar(20) NOT NULL DEFAULT '',
  `signatory` text NOT NULL,
  `signatoryPosition` text NOT NULL,
  `signatoryOrder` int(11) NOT NULL DEFAULT 0,
  `sig_module` tinyint(4) NOT NULL,
  PRIMARY KEY (`signatoryId`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblSignatory` (`signatoryId`, `payrollGroupCode`, `signatory`, `signatoryPosition`, `signatoryOrder`, `sig_module`) VALUES ('1', '', 'Livino B. Duran', 'Regional Executive Director', '0', '1');
INSERT INTO `tblSignatory` (`signatoryId`, `payrollGroupCode`, `signatory`, `signatoryPosition`, `signatoryOrder`, `sig_module`) VALUES ('2', '', 'Raul L. Lorilla', 'Assistant Regional Director for Technical Services', '0', '1');
INSERT INTO `tblSignatory` (`signatoryId`, `payrollGroupCode`, `signatory`, `signatoryPosition`, `signatoryOrder`, `sig_module`) VALUES ('3', '', 'Atty. Noel C. Empleo', 'Assistant Regional Director for Management Services', '0', '1');
INSERT INTO `tblSignatory` (`signatoryId`, `payrollGroupCode`, `signatory`, `signatoryPosition`, `signatoryOrder`, `sig_module`) VALUES ('4', '', 'Ernest C. Federiso', 'Chief, Administrative Division', '0', '1');
INSERT INTO `tblSignatory` (`signatoryId`, `payrollGroupCode`, `signatory`, `signatoryPosition`, `signatoryOrder`, `sig_module`) VALUES ('5', '', 'Merlene B. Aborka', 'PENRO Aklan', '0', '1');
INSERT INTO `tblSignatory` (`signatoryId`, `payrollGroupCode`, `signatory`, `signatoryPosition`, `signatoryOrder`, `sig_module`) VALUES ('6', '', 'Salvador C. Manglinong Jr.', 'OIC - PENR Officer', '0', '1');


#
# TABLE STRUCTURE FOR: tblSignatory_edited
#

DROP TABLE IF EXISTS `tblSignatory_edited`;

CREATE TABLE `tblSignatory_edited` (
  `signatoryId` int(11) NOT NULL AUTO_INCREMENT,
  `payrollGroupCode` varchar(20) NOT NULL DEFAULT '',
  `signatory` text NOT NULL,
  `signatoryPosition` text NOT NULL,
  `signatoryOrder` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`signatoryId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblSpecificLeave
#

DROP TABLE IF EXISTS `tblSpecificLeave`;

CREATE TABLE `tblSpecificLeave` (
  `leaveCode` char(3) NOT NULL DEFAULT '',
  `specifyLeave` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblSpecificLeave` (`leaveCode`, `specifyLeave`) VALUES ('PL', 'Personal Milestone');
INSERT INTO `tblSpecificLeave` (`leaveCode`, `specifyLeave`) VALUES ('PL', 'Parental Obligation');
INSERT INTO `tblSpecificLeave` (`leaveCode`, `specifyLeave`) VALUES ('PL', 'Filial Obligation');
INSERT INTO `tblSpecificLeave` (`leaveCode`, `specifyLeave`) VALUES ('VL', 'Abroad');
INSERT INTO `tblSpecificLeave` (`leaveCode`, `specifyLeave`) VALUES ('PL', 'Domestic Emergency');
INSERT INTO `tblSpecificLeave` (`leaveCode`, `specifyLeave`) VALUES ('PL', 'Personal Transaction');
INSERT INTO `tblSpecificLeave` (`leaveCode`, `specifyLeave`) VALUES ('SL', 'Out-patient');
INSERT INTO `tblSpecificLeave` (`leaveCode`, `specifyLeave`) VALUES ('VL', 'PERSONAL TRANSACTION');


#
# TABLE STRUCTURE FOR: tblTaxDetails
#

DROP TABLE IF EXISTS `tblTaxDetails`;

CREATE TABLE `tblTaxDetails` (
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `otherDependent` varchar(50) DEFAULT NULL,
  `dRelationship` varchar(15) DEFAULT NULL,
  `dBirthDate` date DEFAULT NULL,
  `pTin` varchar(20) DEFAULT NULL,
  `pAddress` text NOT NULL,
  `pEmployer` varchar(50) DEFAULT NULL,
  `pZipCode` varchar(6) DEFAULT NULL,
  `pTin1` varchar(20) DEFAULT NULL,
  `pAddress1` text NOT NULL,
  `pEmployer1` varchar(50) DEFAULT NULL,
  `pZipCode1` varchar(6) DEFAULT NULL,
  `pTin2` varchar(20) DEFAULT NULL,
  `pAddress2` text DEFAULT NULL,
  `pEmployer2` varchar(50) NOT NULL DEFAULT '',
  `pZipCode2` varchar(6) NOT NULL DEFAULT '',
  `pTaxComp` decimal(10,2) NOT NULL DEFAULT 0.00,
  `pTaxWheld` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblTaxExempt
#

DROP TABLE IF EXISTS `tblTaxExempt`;

CREATE TABLE `tblTaxExempt` (
  `taxStatus` varchar(20) NOT NULL DEFAULT '',
  `exemptAmount` float(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`taxStatus`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblTaxExempt` (`taxStatus`, `exemptAmount`) VALUES ('Married', '50000.00');
INSERT INTO `tblTaxExempt` (`taxStatus`, `exemptAmount`) VALUES ('Head', '50000.00');
INSERT INTO `tblTaxExempt` (`taxStatus`, `exemptAmount`) VALUES ('Single', '50000.00');


#
# TABLE STRUCTURE FOR: tblTaxRange
#

DROP TABLE IF EXISTS `tblTaxRange`;

CREATE TABLE `tblTaxRange` (
  `taxableFrom` decimal(10,2) NOT NULL DEFAULT 0.00,
  `taxableTo` decimal(10,2) NOT NULL DEFAULT 0.00,
  `taxFactor` decimal(10,2) NOT NULL DEFAULT 0.00,
  `taxBase` decimal(10,2) NOT NULL DEFAULT 0.00,
  `taxDeduct` decimal(10,2) NOT NULL DEFAULT 0.00,
  `orderNumber` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `tblTaxRange` (`taxableFrom`, `taxableTo`, `taxFactor`, `taxBase`, `taxDeduct`, `orderNumber`) VALUES ('140000.00', '250000.00', '0.25', '140000.00', '22500.00', '4');
INSERT INTO `tblTaxRange` (`taxableFrom`, `taxableTo`, `taxFactor`, `taxBase`, `taxDeduct`, `orderNumber`) VALUES ('500000.00', '2000000.00', '0.32', '500000.00', '125000.00', '6');
INSERT INTO `tblTaxRange` (`taxableFrom`, `taxableTo`, `taxFactor`, `taxBase`, `taxDeduct`, `orderNumber`) VALUES ('250000.00', '500000.00', '0.30', '250000.00', '50000.00', '5');
INSERT INTO `tblTaxRange` (`taxableFrom`, `taxableTo`, `taxFactor`, `taxBase`, `taxDeduct`, `orderNumber`) VALUES ('70000.00', '140000.00', '0.20', '70000.00', '8500.00', '3');
INSERT INTO `tblTaxRange` (`taxableFrom`, `taxableTo`, `taxFactor`, `taxBase`, `taxDeduct`, `orderNumber`) VALUES ('10000.00', '30000.00', '0.10', '10000.00', '500.00', '1');
INSERT INTO `tblTaxRange` (`taxableFrom`, `taxableTo`, `taxFactor`, `taxBase`, `taxDeduct`, `orderNumber`) VALUES ('30000.00', '70000.00', '0.15', '30000.00', '2500.00', '2');


#
# TABLE STRUCTURE FOR: tblTempNotification
#

DROP TABLE IF EXISTS `tblTempNotification`;

CREATE TABLE `tblTempNotification` (
  `tmpDate` date NOT NULL DEFAULT '0000-00-00',
  `tmpStepIncrement` int(11) NOT NULL DEFAULT 0,
  `tmpBirthday` int(11) NOT NULL DEFAULT 0,
  `tmpEmployeesMovement` int(11) NOT NULL DEFAULT 0,
  `tmpVacantPosition` int(11) NOT NULL DEFAULT 0,
  `tmpRetiree` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblWorkZone
#

DROP TABLE IF EXISTS `tblWorkZone`;

CREATE TABLE `tblWorkZone` (
  `currentWorkZone` varchar(20) DEFAULT NULL,
  `currentchiefworkzone` varchar(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='stores the current working zone. 201 display depend on which';

INSERT INTO `tblWorkZone` (`currentWorkZone`, `currentchiefworkzone`) VALUES ('Home', 'Laptop');


#
# TABLE STRUCTURE FOR: tblZone
#

DROP TABLE IF EXISTS `tblZone`;

CREATE TABLE `tblZone` (
  `zonecode` varchar(20) NOT NULL DEFAULT '',
  `zonedesc` varchar(255) NOT NULL DEFAULT '',
  `serverName` varchar(30) NOT NULL DEFAULT '',
  `username` varchar(30) NOT NULL DEFAULT '',
  `password` varchar(30) NOT NULL DEFAULT '',
  `databaseName` varchar(30) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tblcompensatory_timeoff
#

DROP TABLE IF EXISTS `tblcompensatory_timeoff`;

CREATE TABLE `tblcompensatory_timeoff` (
  `cto_id` int(11) NOT NULL AUTO_INCREMENT,
  `empnumber` varchar(20) NOT NULL,
  `dtr_id` int(11) NOT NULL,
  `cto_date` date DEFAULT NULL,
  `cto_timefrom` time DEFAULT NULL,
  `cto_timeto` time DEFAULT NULL,
  `process_by` varchar(20) DEFAULT NULL,
  `process_date` datetime DEFAULT NULL,
  `process_ip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: tblraffle
#

DROP TABLE IF EXISTS `tblraffle`;

CREATE TABLE `tblraffle` (
  `name` text NOT NULL,
  `amount` double(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tempEmpDeduct
#

DROP TABLE IF EXISTS `tempEmpDeduct`;

CREATE TABLE `tempEmpDeduct` (
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `deductionCode` varchar(20) NOT NULL DEFAULT '',
  `deductionDesc` varchar(30) NOT NULL DEFAULT '',
  `deductAmount` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: tempEmpIncome
#

DROP TABLE IF EXISTS `tempEmpIncome`;

CREATE TABLE `tempEmpIncome` (
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `incomeCode` varchar(20) NOT NULL DEFAULT '',
  `incomeDesc` varchar(30) NOT NULL DEFAULT '',
  `incomeAmount` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: xbacktblEmpPersonal
#

DROP TABLE IF EXISTS `xbacktblEmpPersonal`;

CREATE TABLE `xbacktblEmpPersonal` (
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `surname` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `firstname` varchar(50) NOT NULL DEFAULT '',
  `middlename` varchar(50) NOT NULL DEFAULT '',
  `middleInitial` varchar(10) DEFAULT NULL,
  `nameExtension` varchar(10) DEFAULT '',
  `sex` char(1) NOT NULL DEFAULT 'M',
  `civilStatus` varchar(20) NOT NULL DEFAULT 'Single',
  `spouse` varchar(80) NOT NULL DEFAULT '',
  `spouseWork` varchar(50) NOT NULL DEFAULT '',
  `spouseBusName` varchar(70) NOT NULL DEFAULT '',
  `spouseBusAddress` text DEFAULT NULL,
  `spouseTelephone` varchar(10) DEFAULT NULL,
  `tin` varchar(20) DEFAULT NULL,
  `citizenship` varchar(10) NOT NULL DEFAULT '',
  `birthday` date NOT NULL DEFAULT '0000-00-00',
  `birthPlace` varchar(80) NOT NULL DEFAULT '',
  `bloodType` varchar(6) DEFAULT NULL,
  `height` decimal(5,2) NOT NULL DEFAULT 0.00,
  `weight` decimal(5,2) NOT NULL DEFAULT 0.00,
  `residentialAddress` text DEFAULT NULL,
  `zipCode1` int(4) DEFAULT NULL,
  `telephone1` varchar(20) DEFAULT NULL,
  `permanentAddress` text DEFAULT NULL,
  `zipCode2` int(4) DEFAULT NULL,
  `telephone2` varchar(20) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `fatherName` varchar(80) NOT NULL DEFAULT '',
  `motherName` varchar(80) NOT NULL DEFAULT '',
  `parentAddress` text DEFAULT NULL,
  `skills` text NOT NULL,
  `nadr` text DEFAULT NULL,
  `miao` text DEFAULT NULL,
  `relatedThird` char(1) DEFAULT NULL,
  `relatedDegreeParticularsThird` text DEFAULT NULL,
  `relatedFourth` char(1) DEFAULT NULL,
  `relatedDegreeParticulars` text DEFAULT NULL,
  `violateLaw` char(1) DEFAULT NULL,
  `violateLawParticulars` text DEFAULT NULL,
  `formallyCharged` char(1) DEFAULT NULL,
  `formallyChargedParticulars` text DEFAULT NULL,
  `adminCase` char(1) DEFAULT NULL,
  `adminCaseParticulars` text DEFAULT NULL,
  `forcedResign` char(1) DEFAULT NULL,
  `forcedResignParticulars` text DEFAULT NULL,
  `candidate` char(1) DEFAULT NULL,
  `candidateParticulars` text DEFAULT NULL,
  `indigenous` char(1) DEFAULT NULL,
  `indigenousParticulars` text DEFAULT NULL,
  `disabled` char(1) DEFAULT NULL,
  `disabledParticulars` text DEFAULT NULL,
  `soloParent` char(1) DEFAULT NULL,
  `soloParentParticulars` text DEFAULT NULL,
  `signature` varchar(50) NOT NULL DEFAULT '',
  `dateAccomplished` date DEFAULT '0000-00-00',
  `comTaxNumber` varchar(10) NOT NULL DEFAULT '',
  `issuedAt` varchar(50) DEFAULT NULL,
  `issuedOn` date NOT NULL DEFAULT '0000-00-00',
  `gsisNumber` varchar(25) DEFAULT NULL,
  `philHealthNumber` varchar(14) DEFAULT NULL,
  `sssNumber` varchar(20) DEFAULT '',
  `pagibigNumber` varchar(14) DEFAULT NULL,
  `AccountNum` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`empNumber`),
  KEY `Emp_No` (`empNumber`),
  FULLTEXT KEY `surname` (`surname`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: xbacktblEmpPosition
#

DROP TABLE IF EXISTS `xbacktblEmpPosition`;

CREATE TABLE `xbacktblEmpPosition` (
  `empNumber` varchar(15) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `appointmentCode` varchar(20) NOT NULL DEFAULT '',
  `statusOfAppointment` varchar(50) NOT NULL DEFAULT '',
  `positionCode` varchar(20) NOT NULL DEFAULT '',
  `serviceCode` varchar(20) NOT NULL DEFAULT '',
  `plantillaGroupCode` varchar(10) NOT NULL DEFAULT '',
  `divisionCode` varchar(20) NOT NULL DEFAULT '',
  `sectionCode` varchar(20) NOT NULL DEFAULT '',
  `taxStatCode` varchar(20) NOT NULL DEFAULT '',
  `itemNumber` varchar(50) NOT NULL DEFAULT '',
  `salaryGradeNumber` int(2) NOT NULL DEFAULT 0,
  `authorizeSalary` decimal(10,2) NOT NULL DEFAULT 0.00,
  `actualSalary` decimal(10,2) NOT NULL DEFAULT 0.00,
  `contractEndDate` date DEFAULT '0000-00-00',
  `effectiveDate` date NOT NULL DEFAULT '0000-00-00',
  `positionDate` date NOT NULL DEFAULT '0000-00-00',
  `longevityDate` date NOT NULL DEFAULT '0000-00-00',
  `longevityGap` decimal(4,2) DEFAULT 0.00,
  `firstDayAgency` date NOT NULL DEFAULT '0000-00-00',
  `firstDayGov` date NOT NULL DEFAULT '0000-00-00',
  `assignPlace` varchar(50) DEFAULT NULL,
  `stepNumber` int(2) NOT NULL DEFAULT 0,
  `dateIncremented` date NOT NULL DEFAULT '0000-00-00',
  `personnelAction` varchar(20) NOT NULL DEFAULT '',
  `employmentBasis` varchar(20) NOT NULL DEFAULT 'Fulltime',
  `categoryService` varchar(20) NOT NULL DEFAULT 'Career',
  `nature` varchar(20) NOT NULL DEFAULT 'Support',
  `hpFactor` decimal(2,0) NOT NULL DEFAULT 0,
  `longiFactor` decimal(2,0) DEFAULT 0,
  `payrollSwitch` char(1) NOT NULL DEFAULT 'N',
  `schemeCode` varchar(20) NOT NULL DEFAULT 'GEN',
  `itwSwitch` char(1) NOT NULL DEFAULT 'Y',
  `lifeRetSwitch` char(1) NOT NULL DEFAULT 'Y',
  `pagibigSwitch` char(1) NOT NULL DEFAULT 'Y',
  `philhealthSwitch` char(1) NOT NULL DEFAULT 'Y',
  `providentSwitch` char(1) NOT NULL DEFAULT '',
  `premiumAidSwitch` char(1) NOT NULL DEFAULT 'Y',
  `dtrSwitch` char(1) NOT NULL DEFAULT 'Y',
  `mcSwitch` char(1) NOT NULL DEFAULT 'Y',
  `hazardSwitch` char(1) NOT NULL DEFAULT 'Y',
  `longevitySwitch` char(1) NOT NULL DEFAULT 'Y',
  `PERASwitch` char(1) NOT NULL DEFAULT 'Y',
  `ADCOMSwitch` char(1) NOT NULL DEFAULT 'Y',
  `dependents` decimal(2,0) NOT NULL DEFAULT 0,
  `healthProvider` char(1) NOT NULL DEFAULT 'N',
  `tmpStepNumber` int(2) NOT NULL DEFAULT 0,
  `tmpActualSalary` decimal(10,2) NOT NULL DEFAULT 0.00,
  `tmpDateIncremented` date NOT NULL DEFAULT '0000-00-00',
  `tmpPositionDate` date NOT NULL DEFAULT '0000-00-00',
  `regularDedSwitch` char(1) NOT NULL DEFAULT '',
  `contriDedSwitch` char(1) NOT NULL DEFAULT '',
  `loanDedSwitch` char(1) NOT NULL DEFAULT '',
  `zonecode` varchar(20) NOT NULL DEFAULT '',
  `riceSwitch` char(1) NOT NULL DEFAULT '',
  `detailedfrom` char(1) NOT NULL DEFAULT '',
  `departmentcode` varchar(5) NOT NULL DEFAULT '',
  `groupCode` varchar(10) DEFAULT NULL,
  `firefighter` char(1) NOT NULL DEFAULT 'N',
  `security` char(1) NOT NULL DEFAULT 'N',
  `uniqueItemNumber` varchar(50) NOT NULL DEFAULT '',
  `physician` char(1) DEFAULT 'N',
  `officecode` varchar(20) NOT NULL DEFAULT '',
  `service` varchar(50) NOT NULL DEFAULT '',
  `payrollGroupCode` varchar(50) DEFAULT NULL,
  `taxAmount` decimal(10,2) DEFAULT 0.00,
  `hpTax` decimal(10,2) DEFAULT NULL,
  `lpTax` decimal(10,2) DEFAULT NULL,
  `laundrySwitch` char(1) NOT NULL DEFAULT 'Y',
  `addPAGIBIGContri` decimal(10,2) NOT NULL DEFAULT 0.00,
  `includeSecondment` int(1) NOT NULL DEFAULT 0,
  `group1` varchar(20) NOT NULL DEFAULT '',
  `group2` varchar(20) NOT NULL DEFAULT '',
  `group3` varchar(20) NOT NULL DEFAULT '',
  `group4` varchar(20) NOT NULL DEFAULT '',
  `group5` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`empNumber`),
  KEY `AppointmentCode` (`appointmentCode`),
  KEY `DivisionCode` (`divisionCode`),
  KEY `Emp_No` (`empNumber`),
  KEY `PositionCode` (`positionCode`),
  KEY `SectionCode` (`sectionCode`),
  KEY `ServiceCode` (`serviceCode`),
  KEY `TaxStatusCode` (`taxStatCode`),
  FULLTEXT KEY `assignPlace` (`assignPlace`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: xesessions
#

DROP TABLE IF EXISTS `xesessions`;

CREATE TABLE `xesessions` (
  `sess_id` varchar(32) NOT NULL DEFAULT '',
  `sess_sec_level` tinyint(3) unsigned NOT NULL DEFAULT 255,
  `sess_created` int(11) NOT NULL DEFAULT 0,
  `sess_expiry` int(11) NOT NULL DEFAULT 0,
  `sess_timeout` int(11) NOT NULL DEFAULT 0,
  `sess_locked` tinyint(1) NOT NULL DEFAULT 1,
  `sess_value` text NOT NULL,
  `sess_enc_iv` varchar(32) NOT NULL DEFAULT '',
  `sess_sec_id` varchar(32) NOT NULL DEFAULT '',
  `sess_trace` tinytext NOT NULL,
  PRIMARY KEY (`sess_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='This table stores PHP session data';

#
# TABLE STRUCTURE FOR: xphpjobscheduler
#

DROP TABLE IF EXISTS `xphpjobscheduler`;

CREATE TABLE `xphpjobscheduler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scriptpath` varchar(255) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `time_interval` int(11) DEFAULT NULL,
  `fire_time` int(11) NOT NULL DEFAULT 0,
  `time_last_fired` int(11) DEFAULT NULL,
  `run_only_once` tinyint(1) NOT NULL DEFAULT 0,
  `currently_running` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fire_time` (`fire_time`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: xphpjobscheduler_logs
#

DROP TABLE IF EXISTS `xphpjobscheduler_logs`;

CREATE TABLE `xphpjobscheduler_logs` (
  `id` int(11) NOT NULL DEFAULT 0,
  `script` varchar(128) DEFAULT NULL,
  `output` text DEFAULT NULL,
  `execution_time` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: xtblBackUpScheduler
#

DROP TABLE IF EXISTS `xtblBackUpScheduler`;

CREATE TABLE `xtblBackUpScheduler` (
  `id` int(10) NOT NULL DEFAULT 0,
  `time_interval` int(10) DEFAULT NULL,
  `fire_time` int(10) NOT NULL DEFAULT 0,
  `time_last_fired` int(10) DEFAULT NULL,
  `email` varchar(50) NOT NULL DEFAULT '',
  `ftpip` varchar(20) NOT NULL DEFAULT '',
  `ftpuname` varchar(20) NOT NULL DEFAULT '',
  `ftppass` varchar(20) NOT NULL DEFAULT '',
  `ftppath` varchar(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: xtblDept
#

DROP TABLE IF EXISTS `xtblDept`;

CREATE TABLE `xtblDept` (
  `departmentcode` varchar(10) NOT NULL DEFAULT '',
  `groupcode` varchar(10) NOT NULL DEFAULT '',
  `departmentname` varchar(255) NOT NULL DEFAULT '',
  `departmenthead` varchar(50) NOT NULL DEFAULT '',
  `departmentheadtitle` varchar(50) NOT NULL DEFAULT '',
  `empNumber` varchar(15) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`departmentcode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: xtblDivision
#

DROP TABLE IF EXISTS `xtblDivision`;

CREATE TABLE `xtblDivision` (
  `divisionCode` varchar(20) NOT NULL DEFAULT '',
  `divisionName` varchar(100) NOT NULL DEFAULT '',
  `projectCode` text NOT NULL,
  `empNumber` varchar(15) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `divisionHead` varchar(50) NOT NULL DEFAULT '',
  `divisionHeadTitle` varchar(50) NOT NULL DEFAULT '',
  `divisionCustodian` varchar(15) NOT NULL DEFAULT '',
  `divisionSecretary` varchar(15) NOT NULL DEFAULT '',
  `departmentcode` varchar(10) NOT NULL DEFAULT '',
  `serviceCode` varchar(20) NOT NULL DEFAULT '',
  `eoCode` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`divisionCode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: xtblEmpDeductConRemit
#

DROP TABLE IF EXISTS `xtblEmpDeductConRemit`;

CREATE TABLE `xtblEmpDeductConRemit` (
  `processID` int(11) NOT NULL DEFAULT 0,
  `empNumber` varchar(15) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `code` int(100) NOT NULL DEFAULT 0,
  `deductionCode` varchar(20) NOT NULL DEFAULT '',
  `deductMonth` varchar(10) NOT NULL DEFAULT '',
  `deductYear` year(4) NOT NULL DEFAULT 0000,
  `deductAmount` decimal(10,2) DEFAULT NULL,
  `orNumber` varchar(20) DEFAULT NULL,
  `orDate` date NOT NULL DEFAULT '0000-00-00',
  `TYPE` varchar(20) NOT NULL DEFAULT '',
  `appointmentCode` varchar(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: xtblEmpDeductContri
#

DROP TABLE IF EXISTS `xtblEmpDeductContri`;

CREATE TABLE `xtblEmpDeductContri` (
  `empNumber` varchar(15) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `deductionCode` varchar(20) NOT NULL DEFAULT '',
  `deductAmount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `contriCode` int(100) NOT NULL AUTO_INCREMENT,
  `status` char(1) NOT NULL DEFAULT '',
  PRIMARY KEY (`contriCode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: xtblEmpDeductOtherAdjust
#

DROP TABLE IF EXISTS `xtblEmpDeductOtherAdjust`;

CREATE TABLE `xtblEmpDeductOtherAdjust` (
  `empNumber` varchar(15) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `deductionCode` varchar(20) NOT NULL DEFAULT '',
  `deductMonth` varchar(10) NOT NULL DEFAULT '',
  `deductYear` year(4) NOT NULL DEFAULT 0000,
  `deductAmount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `adjustSwitch` char(1) NOT NULL DEFAULT '',
  `adjustMonth` varchar(10) NOT NULL DEFAULT '0',
  `adjustYear` year(4) NOT NULL DEFAULT 0000,
  `appointmentCode` varchar(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: xtblEmpDeductOtherRemit
#

DROP TABLE IF EXISTS `xtblEmpDeductOtherRemit`;

CREATE TABLE `xtblEmpDeductOtherRemit` (
  `processID` int(11) DEFAULT NULL,
  `empNumber` varchar(15) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `deductionCode` varchar(20) NOT NULL DEFAULT '',
  `deductMonth` varchar(10) NOT NULL DEFAULT '',
  `deductYear` year(4) NOT NULL DEFAULT 0000,
  `deductAmount` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: xtblEmpDeductReguAdjust
#

DROP TABLE IF EXISTS `xtblEmpDeductReguAdjust`;

CREATE TABLE `xtblEmpDeductReguAdjust` (
  `empNumber` varchar(15) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `deductionCode` varchar(20) NOT NULL DEFAULT '',
  `deductMonth` varchar(10) NOT NULL DEFAULT '',
  `deductYear` year(4) NOT NULL DEFAULT 0000,
  `deductAmount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `orNumber` varchar(20) DEFAULT NULL,
  `orDate` date DEFAULT NULL,
  `employerAmount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `adjustSwitch` char(1) NOT NULL DEFAULT '',
  `adjustMonth` varchar(10) NOT NULL DEFAULT '0',
  `adjustYear` year(4) NOT NULL DEFAULT 0000,
  `appointmentCode` varchar(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: xtblEmpDeductReguRemit
#

DROP TABLE IF EXISTS `xtblEmpDeductReguRemit`;

CREATE TABLE `xtblEmpDeductReguRemit` (
  `processID` int(11) NOT NULL DEFAULT 0,
  `empNumber` varchar(15) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `deductionCode` varchar(20) NOT NULL DEFAULT '',
  `deductMonth` varchar(10) NOT NULL DEFAULT '',
  `deductYear` year(4) NOT NULL DEFAULT 0000,
  `positionCode` varchar(20) NOT NULL DEFAULT '',
  `actualSalary` decimal(10,2) NOT NULL DEFAULT 0.00,
  `deductAmount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `orNumber` varchar(20) DEFAULT NULL,
  `orDate` date DEFAULT NULL,
  `employerAmount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `appointmentCode` varchar(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: xtblExeOffice
#

DROP TABLE IF EXISTS `xtblExeOffice`;

CREATE TABLE `xtblExeOffice` (
  `eoCode` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `eoName` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `empNumber` varchar(15) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `eoHead` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `eoHeadTitle` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `eoCustodian` varchar(15) NOT NULL DEFAULT '',
  `eoSecretary` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`eoCode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

#
# TABLE STRUCTURE FOR: xtblPlantillaGroup2
#

DROP TABLE IF EXISTS `xtblPlantillaGroup2`;

CREATE TABLE `xtblPlantillaGroup2` (
  `plantillaGroupCode` varchar(20) NOT NULL DEFAULT '',
  `plantillaGroupName` varchar(255) NOT NULL DEFAULT '',
  `plantillaGroupOrder` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: xtblSection
#

DROP TABLE IF EXISTS `xtblSection`;

CREATE TABLE `xtblSection` (
  `sectionCode` varchar(20) NOT NULL DEFAULT '',
  `divisionCode` varchar(20) NOT NULL DEFAULT '',
  `sectionName` varchar(50) NOT NULL DEFAULT '',
  `empNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `sectionHead` varchar(50) NOT NULL DEFAULT '',
  `sectionHeadTitle` varchar(50) NOT NULL DEFAULT '',
  `sectionCustodian` varchar(15) NOT NULL DEFAULT '',
  `sectionSecretary` varchar(15) NOT NULL DEFAULT '',
  `eoCode` varchar(20) NOT NULL DEFAULT '',
  `serviceCode` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`sectionCode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

#
# TABLE STRUCTURE FOR: xtblService
#

DROP TABLE IF EXISTS `xtblService`;

CREATE TABLE `xtblService` (
  `serviceCode` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `serviceName` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `empNumber` varchar(15) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `serviceHead` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `serviceHeadTitle` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `serviceCustodian` varchar(15) NOT NULL DEFAULT '',
  `serviceSecretary` varchar(15) NOT NULL DEFAULT '',
  `eoCode` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`serviceCode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

#
# TABLE STRUCTURE FOR: xtblURLparam
#

DROP TABLE IF EXISTS `xtblURLparam`;

CREATE TABLE `xtblURLparam` (
  `url` text NOT NULL,
  `param` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

