DROP TABLE IF EXISTS `t_site_language_i18n`;
CREATE TABLE IF NOT EXISTS `t_site_language_i18n` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT '',
  `code` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT '',
  `title` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1281 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `t_site_language_i18n`
--

INSERT INTO `t_site_language_i18n` (`id`, `lang`, `code`, `title`) VALUES
(1, 'en', 'en', 'English'),
(2, 'en', 'aa', 'Afar'),
(3, 'en', 'ab', 'Abkhazian'),
(4, 'en', 'af', 'Afrikaans'),
(5, 'en', 'am', 'Amharic'),
(6, 'en', 'ar', 'Arabic'),
(7, 'en', 'as', 'Assamese'),
(8, 'en', 'ay', 'Aymara'),
(9, 'en', 'az', 'Azerbaijani'),
(10, 'en', 'ba', 'Bashkir'),
(11, 'en', 'be', 'Belarusian'),
(12, 'en', 'bg', 'Bulgarian'),
(13, 'en', 'bh', 'Bihari'),
(14, 'en', 'bi', 'Bislama'),
(15, 'en', 'bn', 'Bengali/Bangla'),
(16, 'en', 'bo', 'Tibetan'),
(17, 'en', 'br', 'Breton'),
(18, 'en', 'ca', 'Catalan'),
(19, 'en', 'co', 'Corsican'),
(20, 'en', 'cs', 'Czech'),
(21, 'en', 'cy', 'Welsh'),
(22, 'en', 'da', 'Danish'),
(23, 'en', 'de', 'German'),
(24, 'en', 'dz', 'Bhutani'),
(25, 'en', 'el', 'Greek'),
(26, 'en', 'eo', 'Esperanto'),
(27, 'en', 'es', 'Spanish'),
(28, 'en', 'et', 'Estonian'),
(29, 'en', 'eu', 'Basque'),
(30, 'en', 'fa', 'Persian'),
(31, 'en', 'fi', 'Finnish'),
(32, 'en', 'fj', 'Fiji'),
(33, 'en', 'fo', 'Faeroese'),
(34, 'en', 'fr', 'French'),
(35, 'en', 'fy', 'Frisian'),
(36, 'en', 'ga', 'Irish'),
(37, 'en', 'gd', 'Scots/Gaelic'),
(38, 'en', 'gl', 'Galician'),
(39, 'en', 'gn', 'Guarani'),
(40, 'en', 'gu', 'Gujarati'),
(41, 'en', 'ha', 'Hausa'),
(42, 'en', 'hi', 'Hindi'),
(43, 'en', 'hr', 'Croatian'),
(44, 'en', 'hu', 'Hungarian'),
(45, 'en', 'hy', 'Armenian'),
(46, 'en', 'ia', 'Interlingua'),
(47, 'en', 'ie', 'Interlingue'),
(48, 'en', 'ik', 'Inupiak'),
(49, 'en', 'in', 'Indonesian'),
(50, 'en', 'is', 'Icelandic'),
(51, 'en', 'it', 'Italian'),
(52, 'en', 'iw', 'Hebrew'),
(53, 'en', 'ja', 'Japanese'),
(54, 'en', 'ji', 'Yiddish'),
(55, 'en', 'jw', 'Javanese'),
(56, 'en', 'ka', 'Georgian'),
(57, 'en', 'kk', 'Kazakh'),
(58, 'en', 'kl', 'Greenlandic'),
(59, 'en', 'km', 'Cambodian'),
(60, 'en', 'kn', 'Kannada'),
(61, 'en', 'ko', 'Korean'),
(62, 'en', 'ks', 'Kashmiri'),
(63, 'en', 'ku', 'Kurdish'),
(64, 'en', 'ky', 'Kirghiz'),
(65, 'en', 'la', 'Latin'),
(66, 'en', 'ln', 'Lingala'),
(67, 'en', 'lo', 'Laothian'),
(68, 'en', 'lt', 'Lithuanian'),
(69, 'en', 'lv', 'Latvian/Lettish'),
(70, 'en', 'mg', 'Malagasy'),
(71, 'en', 'mi', 'Maori'),
(72, 'en', 'mk', 'Macedonian'),
(73, 'en', 'ml', 'Malayalam'),
(74, 'en', 'mn', 'Mongolian'),
(75, 'en', 'mo', 'Moldavian'),
(76, 'en', 'mr', 'Marathi'),
(77, 'en', 'ms', 'Malay'),
(78, 'en', 'mt', 'Maltese'),
(79, 'en', 'my', 'Burmese'),
(80, 'en', 'na', 'Nauru'),
(81, 'en', 'ne', 'Nepali'),
(82, 'en', 'nl', 'Dutch'),
(83, 'en', 'no', 'Norwegian'),
(84, 'en', 'oc', 'Occitan'),
(85, 'en', 'om', '(Afan)/Oromoor/Oriya'),
(86, 'en', 'pa', 'Punjabi'),
(87, 'en', 'pl', 'Polish'),
(88, 'en', 'ps', 'Pashto/Pushto'),
(89, 'en', 'pt', 'Portuguese'),
(90, 'en', 'qu', 'Quechua'),
(91, 'en', 'rm', 'Rhaeto-Romance'),
(92, 'en', 'rn', 'Kirundi'),
(93, 'en', 'ro', 'Romanian'),
(94, 'en', 'ru', 'Russian'),
(95, 'en', 'rw', 'Kinyarwanda'),
(96, 'en', 'sa', 'Sanskrit'),
(97, 'en', 'sd', 'Sindhi'),
(98, 'en', 'sg', 'Sangro'),
(99, 'en', 'sh', 'Serbo-Croatian'),
(100, 'en', 'si', 'Singhalese'),
(101, 'en', 'sk', 'Slovak'),
(102, 'en', 'sl', 'Slovenian'),
(103, 'en', 'sm', 'Samoan'),
(104, 'en', 'sn', 'Shona'),
(105, 'en', 'so', 'Somali'),
(106, 'en', 'sq', 'Albanian'),
(107, 'en', 'sr', 'Serbian'),
(108, 'en', 'ss', 'Siswati'),
(109, 'en', 'st', 'Sesotho'),
(110, 'en', 'su', 'Sundanese'),
(111, 'en', 'sv', 'Swedish'),
(112, 'en', 'sw', 'Swahili'),
(113, 'en', 'ta', 'Tamil'),
(114, 'en', 'te', 'Telugu'),
(115, 'en', 'tg', 'Tajik'),
(116, 'en', 'th', 'Thai'),
(117, 'en', 'ti', 'Tigrinya'),
(118, 'en', 'tk', 'Turkmen'),
(119, 'en', 'tl', 'Tagalog'),
(120, 'en', 'tn', 'Setswana'),
(121, 'en', 'to', 'Tonga'),
(122, 'en', 'tr', 'Turkish'),
(123, 'en', 'ts', 'Tsonga'),
(124, 'en', 'tt', 'Tatar'),
(125, 'en', 'tw', 'Twi'),
(126, 'en', 'uk', 'Ukrainian'),
(127, 'en', 'ur', 'Urdu'),
(128, 'en', 'uz', 'Uzbek'),
(129, 'en', 'vi', 'Vietnamese'),
(130, 'en', 'vo', 'Volapuk'),
(131, 'en', 'wo', 'Wolof'),
(132, 'en', 'xh', 'Xhosa'),
(133, 'en', 'yo', 'Yoruba'),
(134, 'en', 'zh', 'Chinese'),
(135, 'en', 'zu', 'Zulu');