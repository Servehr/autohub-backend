-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 18, 2024 at 06:49 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `autos`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `username` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` text DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `role` varchar(191) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `login_time` datetime DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `pass_changed` varchar(191) DEFAULT NULL,
  `save_log` int(11) NOT NULL DEFAULT 1,
  `viewstaff` int(11) NOT NULL DEFAULT 0,
  `manageuser` int(11) NOT NULL,
  `createuser` int(11) NOT NULL,
  `viewuser` int(11) NOT NULL,
  `purchase` int(11) NOT NULL,
  `sales` int(11) NOT NULL,
  `withdraw` int(11) NOT NULL,
  `deposit` int(11) NOT NULL,
  `transfer` int(11) NOT NULL,
  `setting` int(11) NOT NULL,
  `message` int(11) NOT NULL DEFAULT 0,
  `frontend` int(11) NOT NULL,
  `kyc` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `username`, `email`, `phone`, `image`, `address`, `city`, `state`, `role`, `status`, `login_time`, `password`, `remember_token`, `pass_changed`, `save_log`, `viewstaff`, `manageuser`, `createuser`, `viewuser`, `purchase`, `sales`, `withdraw`, `deposit`, `transfer`, `setting`, `message`, `frontend`, `kyc`, `created_at`, `updated_at`) VALUES
(1, 'System Administrator', 'president', 'admin@autohub.ng', '07036218209', 'assets/images/admin/1636600471_.jpg', 'AutoHub Head Office', 'Bariga', 'Lagos', NULL, 1, NULL, '$2y$10$zYVzkxk683eGsz4n/tYKYezizCm1UfU9MsGv0WISf4RzbiPsv5weu', NULL, '2021-04-16 02:38:32', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2021-11-11 03:14:31');

-- --------------------------------------------------------

--
-- Table structure for table `admin_logins`
--

CREATE TABLE `admin_logins` (
  `id` int(10) UNSIGNED NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `admin_ip` varchar(191) DEFAULT NULL,
  `location` varchar(191) DEFAULT NULL,
  `details` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_logins`
--

INSERT INTO `admin_logins` (`id`, `admin_id`, `admin_ip`, `location`, `details`, `created_at`, `updated_at`) VALUES
(1, 1, '127.0.0.1', 'Unknown', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '2022-11-16 20:09:26', '2022-11-16 20:09:26');

-- --------------------------------------------------------

--
-- Table structure for table `asked`
--

CREATE TABLE `asked` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `question` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `basic_settings`
--

CREATE TABLE `basic_settings` (
  `id` int(11) NOT NULL,
  `sitename` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `phone` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `currency` varchar(191) DEFAULT NULL,
  `currency_sym` varchar(191) DEFAULT NULL,
  `registration` int(11) NOT NULL DEFAULT 0,
  `login` int(11) NOT NULL DEFAULT 0,
  `maintain` int(11) NOT NULL DEFAULT 0,
  `email_verification` tinyint(4) NOT NULL DEFAULT 0,
  `email_notification` tinyint(4) NOT NULL DEFAULT 0,
  `sms_notification` tinyint(4) NOT NULL DEFAULT 0,
  `allow_sms` tinyint(4) NOT NULL DEFAULT 0,
  `decimal` int(11) NOT NULL,
  `facebook` text DEFAULT NULL,
  `twitter` text DEFAULT NULL,
  `instagram` text DEFAULT NULL,
  `linkedin` text DEFAULT NULL,
  `telegram` text DEFAULT NULL,
  `youtube` text DEFAULT NULL,
  `map` text DEFAULT NULL,
  `livechat` text DEFAULT NULL,
  `privacy` longtext DEFAULT NULL,
  `term` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `basic_settings`
--

INSERT INTO `basic_settings` (`id`, `sitename`, `description`, `phone`, `email`, `address`, `currency`, `currency_sym`, `registration`, `login`, `maintain`, `email_verification`, `email_notification`, `sms_notification`, `allow_sms`, `decimal`, `facebook`, `twitter`, `instagram`, `linkedin`, `telegram`, `youtube`, `map`, `livechat`, `privacy`, `term`, `created_at`, `updated_at`) VALUES
(1, 'AutoHub', 'AutoHub Nigeria', '+234 703 6218 209', 'info@autohub.ng', '17, Abdul Adekunle Street, Aba Ada, Oyeniyan, Ibadan', 'NGN', '₦', 1, 1, 0, 1, 1, 0, 1, 2, 'http://www.facebook.com/', 'http://www.twitter.com/', NULL, NULL, NULL, NULL, '<iframe style=\"border: 0;\" src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3971.001974364822!2d5.743822814712541!3d5.566722135089598!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x1041ad2360ebeaeb%3A0xff2194cf8dcf9803!2sCompos+Mentis+Chambers!5e0!3m2!1sen!2sng!4v1490562775461\" width=\"100%\" height=\"350\" frameborder=\"0\" allowfullscreen=\"allowfullscreen\"></iframe>', NULL, '<h1 class=\"page-entry-title\" style=\"word-break: break-word; overflow-wrap: break-word; clear: both; font-family: \" source=\"\" sans=\"\" pro\";=\"\" font-weight:=\"\" 600;=\"\" margin:=\"\" -10px=\"\" 0px=\"\" 25px=\"\" -2px;=\"\" color:=\"\" rgb(0,=\"\" 0,=\"\" 0);=\"\" line-height:=\"\" 1.4;=\"\" font-size:=\"\" 34px;=\"\" letter-spacing:=\"\" -0.8px;\"=\"\">Privacy Policy</h1><ul><li><div style=\"color: rgb(85, 85, 85); position: absolute; top: 0px; left: -9999px;\">Want create site? Find&nbsp;<a href=\"http://dlwordpress.com/\" style=\"color: rgb(191, 169, 128);\">Free WordPress Themes</a>&nbsp;and plugins.</div><p style=\"color: rgb(85, 85, 85); word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\">Your privacy is important to us. We collect information from Users in many ways. The purpose of this Privacy Policy is to provide Users with an understanding of what types of information we collect, how we treat it, and choices they may have related to this information. We are also firmly committed to the EU-US and US-Swiss Safe Harbor program and have certified that we adhere to the Safe Harbor Privacy Principles of notice, choice, onward transfer, security, data integrity, access, and enforcement. We reserve the right to change our Privacy Policy at any time. Please make sure you understand our policy on this matter and feel free to contact us if you have any questions or issues regarding this document.</p><p style=\"color: rgb(85, 85, 85); word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><b><span style=\"font-size: 24px;\">The Information We Collect</span></b></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">This notice applies to all information collected or submitted on the GiftBills website. On some pages, you can order services and make requests. The types of personal information collected at these pages are:</font></p><ul><li style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">1. Name</font></li><li style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">2. Address</font></li><li style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><span style=\"color: rgb(85, 85, 85); font-size: 0.875rem;\">3. Email Address</span><br></li></ul><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><span style=\"color: rgb(85, 85, 85); font-size: 0.875rem;\">4. Phone number</span><br></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><span style=\"color: rgb(85, 85, 85); font-size: 0.875rem;\">5. (etc.)</span><br></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><span style=\"font-size: 24px;\"><font color=\"#000000\">The Length We Retain Information</font></span></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#000000\">Any and all client information including login credentials and billing information will be purged from our databases 90 days after service termination, and will be held no greater than 120 days after services have been terminated.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><span style=\"font-size: 24px;\"><font color=\"#000000\">The Way We Use Information</font></span></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#000000\">We use the information you provide about yourself when placing an order only to complete that order. We do not share this information with outside parties except to the extent necessary to complete that order.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#000000\">We use return email addresses to answer the email we receive. Such addresses are not used for any other purpose and are not shared with outside parties.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#000000\">We use non-identifying and aggregate information to better design our website and to share with advertisers. For example, we may tell an advertiser that X number of individuals visited a certain area on our website, or that Y number of men and Z number of women filled out our registration form, but we would not disclose anything that could be used to identify those individuals.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#000000\">Finally, we never use or share the personally identifiable information provided to us online in ways unrelated to the ones described above without also providing you an opportunity to opt-out or otherwise prohibit such unrelated uses.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><span style=\"font-size: 24px;\"><font color=\"#000000\">Our Commitment To Data Security</font></span></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#000000\">We keep the information covered by our Privacy Policy indefinitely. Information collected by the technologies described in this Privacy Policy is protected by SSL 256 bit encryption technology during transmission. Information kept by us in our business is protected using industry standard security measures. Our employees are required to keep information covered by this Privacy Policy confidential, unless disclosure is authorized in this Privacy Policy or by Users. No means of communication or information transmission or storage is totally secure. Because of this we are not responsible for loss corruption or unauthorized acquisition and use of information covered by this Privacy Policy, or for any resulting damages, including unauthorized acquisition and use.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><span style=\"font-size: 24px;\"><font color=\"#000000\">Our Commitment To Children\'s Privacy</font></span></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#000000\">Protecting the privacy of the very young is especially important. For that reason, we never collect or maintain information at our website from those we actually know are under 13, and no part of our website is structured to attract anyone under 13.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><span style=\"font-size: 24px;\"><font color=\"#000000\">How You Can Access Or Correct Your Information</font></span></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#000000\">You can access all your personally identifiable information that we collect online and maintain by accessing our billing system under \"Edit Account\". We use this procedure to better safeguard your information.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#000000\">You can correct factual errors in your personally identifiable information by sending us a request that credibly shows error.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#000000\">To protect your privacy and security, we will also take reasonable steps to verify your identity before granting access or making corrections.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><span style=\"font-size: 24px;\"><font color=\"#000000\">How To Contact Us</font></span></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#000000\">Should you have other questions or concerns about these privacy policies, please send us an email to \"support@giftbills.com\"</font></p></li></ul>', '<h1 class=\"page-entry-title\" style=\"word-break: break-word; overflow-wrap: break-word; clear: both; font-family: \" source=\"\" sans=\"\" pro\";=\"\" font-weight:=\"\" 600;=\"\" margin:=\"\" -10px=\"\" 0px=\"\" 25px=\"\" -2px;=\"\" color:=\"\" rgb(0,=\"\" 0,=\"\" 0);=\"\" line-height:=\"\" 1.4;=\"\" font-size:=\"\" 34px;=\"\" letter-spacing:=\"\" -0.8px;\"=\"\">Terms &amp; Conditions</h1><div class=\"entry-content\" style=\"\" open=\"\" sans\";\"=\"\"><div style=\"color: rgb(85, 85, 85); position: absolute; top: 0px; left: -9999px;\">Want create site? Find&nbsp;<a href=\"http://dlwordpress.com/\" style=\"color: rgb(191, 169, 128);\">Free WordPress Themes</a>&nbsp;and plugins.</div><p style=\"color: rgb(85, 85, 85); word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><span style=\"font-size: 24px;\"><b><br></b></span></p><p style=\"color: rgb(85, 85, 85); word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><span style=\"font-size: 24px;\"><b>Rules on Use of giftbills.com site</b></span><br></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">If you browse or otherwise access any content or data on the&nbsp;</font><span style=\"color: rgb(85, 85, 85);\">giftbills.com</span><font color=\"#555555\">&nbsp;website where this Terms and Condition appears in the footer, and to any&nbsp;</font><span style=\"color: rgb(85, 85, 85);\">giftbills.com</span><font color=\"#555555\">&nbsp;application, service, or tool (collectively \"Resource\" or \"Service\") you agree to be bound by these terms. If you do not agree to these terms, please do not use this Resource.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">By using the Resource with or without Registered account, regardless of how you access or use it, including through mobile devices you are accepting the terms of this Terms of Conditions and any applicable posted guidelines for the Service.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">These Terms of Conditions shall be a legally binding agreement between the User and Administrator, which subject is a provision of access to use of the Resource and to its functionality to the User. Among these Terms of Conditions, the agreement between the User and the Administrator comprises also all specific documents, by which a provision of access to use of the Resource is regulated, including Privacy Policy, and other documents as well being developed by the Administrator from time to time.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">Administrator reserve the right to change Terms and Condition at any time by publishing the new Terms and Conditions on the Resource. By continuing to use the Service you are indicating your acceptance to be bound by the amended Terms and Conditions.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">\"Administrator\", \"we\" or \"us\" - Local Content Administrator or other entity that exercise control over the Local Content Administrator, which renders the Services to the Users.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">\"Local Content Administrator\" —&nbsp;</font><span style=\"color: rgb(85, 85, 85);\">giftbills.com</span><font color=\"#555555\">&nbsp;Online Bill Payment Solution by Tech Plus Network Nigeria Limited, entity incorporated under the laws of Nigeria.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">\"User\", \"you\", \"your\" – means any natural person eligible to conclude an agreement under the applicable law with Administrator and using any of Services with or without a Registered account. The Users may also act on behalf of the company that provides goods and services and intends to use the Resource or Service. In this case Users shall be empowered for such representation in a written form.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">\"Register entry/account\" — an electronic User area within functional system of the Resource or Service, with a help of which he/she is able to manage his/her activities on the Resource.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><b><span style=\"font-size: 24px;\">1. General provisions</span></b></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">1.1. For the registration of an account, you shall provide necessary veridical and current information for the purpose of generation of User account, which includes User’s unique login (email address), and a Resource password, as well as his/her surname and name. Resource Registration Form may require the User to provide more detailed information.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">1.2. Resource is a bill payment system that allows users to purchase and resell just about anything offered on giftbills.com. The actual contract for purchase is directly between you and Giftbills.com. We server as an intermediary&nbsp;between you(the buyer) and the service provider. And so we do not provide a refund for any successful purchase on any of the services giftbills.com provides.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">1.3. Administrator does not pursue actions focused on service rendered by any of the service provider and expressly disclaims all responsibilities in relation to service by the provider such as network disruption, etc.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">1.4. Administrator can remove any service provider from giftbills.com at any point or add new services at any point in time depending on the availability of such service.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">1.5. We may set limits of transaction or service order base on user account status or level of kyc provided by such user. The Resource Administrator can render additional services of increasing of a column limit by means of sales of a service package.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><b><span style=\"font-size: 24px;\">2. Using Resource</span></b></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">2.1. Using the Resource, the User shall:</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">2.1.1. provide veridical, complete and current data during registration, ensure them being updated;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">2.1.2. The User shall immediately change data for accessing to the Resource, if he/she has a suspicion that his/her email address and password used for entering to the Resource were disclosed or probably used by the third parties.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">2.1.3. notify the Administrator of unauthorized access to the personal account and/or of unauthorized access to and/or use of User’s login and password;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">2.1.4. prevent other Users’ getting access to the personal account or any specific information contained on it, if this can lead to violation of the laws of Nigeria and/or these Terms and Conditions;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">2.1.5. avoid posting of information and objects (including references hereto) to the Resource, which can infringe other persons’ rights and interests;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">2.1.6. avoid posting of information and objects (including references hereto) to the Resource prohibited by these Terms and Conditions and by applicable law.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">2.2. Using the Resource, the User shall not:</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">2.2.1. log in as a User on behalf or instead of other person (“false account”). However, the User can log in for and on behalf of other individual or legal entity subject to receipt of necessary well-documented authorities</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">2.2.2. confuse User concerning his/her personality using login and password of any other registered User;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">2.2.3. illegally download, store, post, distribute or provide access to or in any other way use intellectual property of Users and the third parties;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">2.2.4. perform bulk mailing to the addresses of other Resource Users without their consents;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">2.2.5. use software and pursue any other actions aimed to interference with normal operation of the Resource or Users personal areas;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">2.2.6. download, store, post, distribute and provide access to, or in any other way use viruses, li&gt; and other malware;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">2.2.7. in any way, including, but not limited to, fraudulently, be way of breach of faith or crack, endeavor to get access to other User’s login and password;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">2.2.8. perform illegal collection and processing of other individuals’ personal data</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">2.2.9. use the Resource otherwise but as provided herein, except when such actions were directly permitted to the User pursuant to a separate agreement with the Administrator;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">2.2.10. reproduce, duplicate, copy, sell, carry out trade transactions and resell access to using of the Resource for any purposes, except when such actions were directly permitted to the User pursuant to a separate agreement with the Administrator;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">2.2.11. post any other information, which is undesirable, disagrees with the purposes of creation of the Resource, encroaches Users’ interests or otherwise presents itself as undesirable for being posted to the Resource;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">2.3. Each User shall warrant and acknowledge that:</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">2.3.1. he/she undertakes full responsibility for obtaining of all necessary permits in relation to any User content, which he/she represents, downloads, or displays;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">2.3.2. any User content represented, downloaded or displayed by him/her does not infringe any copyrights, patents, rights for trademarks, firm names, commercial secrets or any other personal or proprietary rights of any third party (\"Third party rights\"); and</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">2.3.3. he/she is entitled and authorized for sale, trade, distribution or export, or for offer for sale, trade, distribution or export of products and services described in User content, and such sale, trade, distribution or export, or offer does not infringe any Third party rights.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><b><span style=\"font-size: 24px;\">3. Posting of announcements by the User</span></b></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">3.1. Administrator may request User to provide the documents confirming legitimacy of posting of announcements in relation to goods and services.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">3.2. The User, who posts announcements with regard to sale of goods and services to the Resource, shall place information about them in accordance with these Terms and Conditions and provide precise and complete information about the goods and services, as well as about the terms and conditions of sale of them. When the User places information about goods or services, he/she hereby confirms being legally authorized to sell these goods or render such services pursuant to laws of states, in which they are sold, as well as that he/she has obtained all necessary approvals.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">3.3. The User warrants that goods/services he/she offers corresponds with quality norms established by legislation of states, in which they are sold, and are free of the third parties’ claims.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">3.4. The User warrants that goods/services he/she offers, provided that any special permits are needed for sale or rendering of them, will be sold/rendered in accordance with the requirements of states, which special authorities will be empowered to supervise such User’s activity.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">3.5. The User shall thoroughly check all information about goods and services posted by him/her to the Resource, and, in case of any incorrect information detected, add necessary data in the description of goods or services. If no possibility exists to do so, the User shall adjust incorrect information by having annulled the announcement and posted information about goods or services again.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">3.6. Delivery conditions should be included in a goods description, and services terms and conditions should form a part of service description. Goods sale and service terms and conditions developed by the User shall not interfere with these Terms and Conditions and applicable legislation of states, for which they are sold.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">3.7. Price of goods or services shall be exact. If it is perceived to be changed due to any specific circumstances, the terms and conditions of price change shall be provided in an announcement.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">3.8. The User is not allowed to post or distribute:</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- false, misleading or deceitful information;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- disreputable, defamatory, threatening or harassing, improper, unacceptable information;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- discriminative information, or information that facilitates discrimination on the basis of race, sex, religion, nationality, invalidity, sexual orientation or age;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- information which violates these Rules;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- information which violates applicable laws and regulations (including, without limitation, those regulating export control, consumer protection, unfair competition or false advertising, intellectual property rights);</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- direct or indirect references to any other web sites, which comprise any content being able to violate these Rules;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- vulgar abusive language;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- advocacy of hate, violence, discrimination, racism, xenophobia, ethnic conflicts;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- appeals to violence and unlawful actions;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- data infringing personal (non-proprietary) rights and intellectual property rights of the third parties;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- information that facilitates fraud, deception or breach of faith;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- information leading to transactioning with stolen or counterfeit objects;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- information violating or encroaching on the third party’s property, commercial secret or right to privacy;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- personal or identifying information about other persons without their express consent;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- information comprising data which may encroach on privacy right, abuse anybody’s honor, merit or business reputation;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- information comprising slander or threats directed against whosoever;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- information of pornographic nature;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- information which may inflict damage to under-ages;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- false or misleading information;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- viruses or any other techniques being able to damage the Resource, Administrator or other Users;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- information about services deemed to be immoral, such as prostitution or other forms contradicting moral or legal norms;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- references or information about websites competing with the Resource services;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- information representing “spam”, “chain letters”, “pyramids schemes” or undesirable or deceitful commercial advertising;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- information distributed by information agencies;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- information offering to earn over the Internet without employer’s actual address or direct contacts indicated;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- information of multistage and network marketing or any other activity, which requires recruiting of other members, subagents, sub-distributors, etc.;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- information of solely promotional nature with no offers of specific goods or services;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- information or announcements about counterfeit and imitated goods or unauthorized copies. Unauthorized copies include also goods having been acquired by illegal means, pirated or stolen. Such goods may infringe intellectual property rights, and trademark rights as well;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- information or announcements on sale being able otherwise to violate legislation of state, which this announcement is intended for.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><br></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><b><span style=\"font-size: 24px;\">4. Intellectual property rights</span></b></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">4.1. If User posts legally owned content to the Resource, he/she hereby grants to other users and the Administrator non-exclusive rights for its use solely in the scope of functionality provided by the Resource, except when such use damages or may damage legally protected right holder’s interests.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">4.2. The User also grants to the Administrator a non-exclusive right to use content, which is located on the Resource and legally owned by him/her, without a compensation so that the Administrator would be able to ensure operation of the Resource to the extent determined by its functionality and architecture. The abovementioned non-exclusive right is provided for the period of posting of content to the Resource covering all states over the world. The Administrator is entitled to assign rights described in this clause to the third parties.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">4.3. Any use of the Resource or any content on the Resource, except that permitted by these Terms and Conditions or in the event of express right holder’s consent to such use, without prior written consent of a right holder is strictly prohibited.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">4.4. Responsibility for violation of exclusive rights. The User shall be solely responsible for any content or other information, which he/she downloads or in any other way make publicly available (posts) on the Resource, or by its means. The User shall not download, distribute or post content to the Resource, if he/she is not properly entitled to such activity. In case of infringement of rights being detected, the rules of filing of notification on the infringement of rights stipulated herein shall be used.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">4.5. The Administrator may, but not shall, review the Resource for a presence of any prohibited content and may delete or displace (without notice) any content at its discretion, for any reason or without it, including but not limited to deletion or displacement of content which violates these Terms and Conditions, laws and/or may infringe rights, inflict damages or endanger safety of other Users or the third parties.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">4.6. Materials on the Resource, except those posted by the User, including but not limited to texts, software, scripts, graphics, photos, sounds, music, videos, interactive functions, etc. (\"Materials\") and trademarks, service marks and logos included in it (\"Marks\") belong to the Administrator representing items of copyright and of any other intellectual property rights. Unauthorized use of such Materials and Marks without prior notice of the Administrator is not allowed.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><b><span style=\"font-size: 24px;\">5. Notice for Claims of Intellectual Property Violations and Copyright Infringement</span></b></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">5.1. If you are a holder of intellectual property rights or a person authorized to act in the name of a holder of intellectual property rights and you reasonably believe that information which is posted to the Resource someway infringes your intellectual property rights or intellectual property rights of a person, in which name you act, you may provide notification to the Administrator requiring to delete such material. In this regard you shall warrant that your appeal has a legal basis, and you act in good faith according to law.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">5.2. Providing relevant notification concerning infringement of rights you shall ensure that your request corresponds to the form below and includes the following:</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- an appeal should include physical or electronic signature of a person empowered for acting in the name of a holder of exclusive right, which is believed to be infringed;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- the items of intellectual property right, rights on which were supposedly infringed, shall be specified. If several items exist, the entire list of such items shall be provided;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- you shall specify materials (with an indication of specific URL-pages), which are stated to infringe rights or themselves are the objects of infringement;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- you shall provide contact information so that the Administrator would be able to contact you, for example, address, phone number, and email address;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- signed application with regard to your faithful and reasonable believe in that materials being the objects of complaint concerning infringement of intellectual property rights are used without a right holder’s or its representative’s consent, and also that this is not allowed by law;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- signed application with regard to that a holder of intellectual property rights releases the Administrator from any third parties\' claims related to deletion of relevant materials by the Administrator;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- signed application with regard to that information contained in a notification is accurate under penalty of perjury, and you are authorized to act in the name of a holder of exclusive right, which has been supposedly infringed;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- statutory regulations indicated which you believe to be violated in connection to using of disputable content;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- state indicated, in which territory you believe the rights to be infringed;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- copies of documents establishing rights for an object of intellectual property right, which is subject to security, as well as a document that confirms powers for acting in the holder’s name, in attachments to your appeal.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- relevant notification shall be sent to email support@selltome.com.ng</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><b><span style=\"font-size: 24px;\">6. Antispam policy</span></b></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">These Rules strictly prohibit mailing out of undesirable advertisements via email, or of any other undesirable messages, or by means of the Resource. Administrator may periodically control letters delivery within the Resource for spam mailouts.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><b><span style=\"font-size: 24px;\">7. Limitation of liability</span></b></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">7.1. ALL SERVICES RENDERED BY THE ADMINISTRATOR ARE RENDERED “AS IS”, “AS AVAILABLE” AND “WITH ALL FAULTS”, AND THE ADMINISTRATOR DISCLAIMS ALL WARRANTIES, EXPRESSED OR IMPLIED, INCLUDING WITHOUT LIMITATION ANY GUARANTIES REGARDING CONDITION, QUALITY, LIFE DURATION, PERFORMANCE, ACCURACY, RELIABILITY, COMMERCIAL VALUE AND SUITABILITY FOR SPECIFIC PURPOSES. ALL SUCH WARRANTIES AND LIABILITIES ARE HEREBY EXCLUDED.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">7.2. THE ADMINISTRATOR MAKES NO WARRANTIES CONCERNING AUTHENTICITY, ACCURACY, CORRECTNESS, RELIABILITY, QUALITY, STABILITY, COMPLETENESS OR CURRENCY OF ANY INFORMATION PROVIDED BY MEANS OF THE RESOURCE; THE ADMINISTRATOR MAKES NO WARRANTIES CONCERNING THAT MANUFACTURING, IMPORT, EXPORT, OFFER, DISPLAYING, PURCHASE, SALE AND/OR USE OF PRODUCTS OR SERVICES, WHICH ARE OFFERED OR DISPLAYED ON THE RESOURCE DO NOT INFRINGE ANY THIRD PARTIES’ RIGHTS; AND THE ADMINISTRATOR MAKES NO WARRANTIES OR REPRESENTATIONS OF WHATSOEVER NATURE CONCERNING ANY PRODUCTS OR SERVICES OFFERED OR PROVIDED ON THE RESOURCE.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">7.3. Any data downloaded or in any other way acquired by means of the Resource are created at each User’s discretion, and each User shall be fully responsible for any damages inflicted to the computer system or loss of data, which may arise as a result of downloading of any such data.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">7.4. The Administrator and affiliated parties shall bear no responsibility for materials posted by the Users, as well as for goods and services offered by the User for trade. The Administrator disclaims all warranties regarding that quality of goods and services acquired by means of the Resource will be consistent with a buyer’s expectations and/or demands. The Administrator makes no warranties about that goods, services or information ordered by means of the Resource will be provided by the Resource User in accordance with a buyer’s expectations.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><b><span style=\"font-size: 24px;\">8. Indemnity</span></b></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">8.1. Each User agrees to be obliged to indemnify the Administrator, affiliated parties, directors, officials and employees from any and all losses, claims, liabilities (as well as from legal costs to the fullest extent), which may arise following Users’ use of the Resource, as a result of violation of any condition of the Terms and Conditions, or violation of representations and warranties made by him/her towards the Administrator.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">8.2. Each User hereby agrees to indemnify the Administrator, affiliated parties, directors, officials and employees from any and all losses, claims, liabilities, which may arise, whether directly or indirectly, as a result of any claims, made by holders/claimants of the Third parties or other parties’ rights, related to the goods and services offered or displayed on the Resource. Each User hereby acknowledges that the Administrator shall have no liabilities or responsibilities against you with regard to any data posted by any other persons, as well as those discreditable or illegal, and risk of losses related to such data remains entirely with each User.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">8.3. The Administrator shall not be responsible for any expressed or implicit, penalty, accidental or consequential losses or damage of whatsoever nature (including, but not limited to, losses related to loss of profit or saving, termination of business, loss of information, loss of benefit), incurred as a result of transactioning, negligence, delinquency, or in any other way, or any other losses related to the following actions:</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- use or impossibility of use of the Resource;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- in case of any defects of goods, patterns, data, information or services purchased of otherwise acquired from the User or by any other party by means of the Resource;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- infringement of the third-party\'s rights or claims, or requirements for production, import, export, distribution, offer, display, acquisition, sale and/or use of User’s products or services, offered or displayed on the Resource, which may infringe or may be purported as infringing the third parties’ rights; or a claim of any party related to rights protection;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- unauthorized third parties’ access to any User’s data or personal information;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- applications or actions of any Resource User; or</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- other actions related to use of Resource and arising by negligence, as well.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><br></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><b><span style=\"font-size: 24px;\">9. Enforcement</span></b></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">9.1. The Administrator reserves a right to delete or block access to information posted by User without notice in the event of:</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- receiving of mandatory judgments of competent public authorities;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- claim of a holder of intellectual property rights to terminate infringement of his/her rights by a user on the Resource; other infringements of rights or legal interests of other Resource Users, of legal entities or individuals upon their reasonable appeal;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">- detecting information, which posting to the Resource is prohibited under these Rules.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">&nbsp;</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">9.2. The Administrator shall be entitled to block access to information posted by users to the Resource at its sole discretion having provided a user with relevant substantiation.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><b><span style=\"font-size: 24px;\">10. Users and organizations interaction</span></b></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">10.1. The Administrator disclaims any responsibility for User’s interaction with any organizations and/or persons in the course of using of the Resource. This includes, but not limited to, payments for and delivery of goods and services, as well as any other interaction in relation to other organizations and/or individuals. Transactions are concluded only between Users and such organizations and/or individuals. The Administrator disclaims responsibility for such interactions or other losses incurred following such relations or interactions. If any dispute arises between you and one or several other users, you shall indemnify the Administrator, its officials, employees, agents and successors from any and all claims, requirements and losses (whether direct or indirect) of whatsoever kind or nature, which arise or relate to such disputes and /or goods and services.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><b><span style=\"font-size: 24px;\">11. Mandatory Arbitration.</span></b></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">11.1. Please read this Section carefully. YOU AND ADMINISTRATOR, AND EACH OF OUR RESPECTIVE AGENTS, CORPORATE PARENTS, SUBSIDIARIES, AFFILIATES, PREDECESSORS IN INTEREST, SUCCESSORS AND ASSIGNS, AGREE TO ARBITRATION (EXCEPT FOR MATTERS THAT MAY BE TAKEN TO SMALL CLAIMS COURT), AS THE EXCLUSIVE FORM OF DISPUTE RESOLUTION EXCEPT AS PROVIDED FOR BELOW, FOR ALL DISPUTES AND CLAIMS ARISING OUT OF OR RELATING TO THIS TERMS AND CONDITIONS OR THE SERVICE, UNLESS YOU ARE LOCATED IN A JURISDICTION THAT PROHIBITS THE EXCLUSIVE USE OF ARBITRATION FOR DISPUTE RESOLUTION. Arbitration is more informal than a lawsuit in court. Arbitration uses a neutral arbitrator instead of a judge or jury, allows for more limited discovery than in court, and is subject to very limited review by courts. Arbitrators can award the same damages and relief that a court can award. Please visit www.adr.org for more information about arbitration.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">11.2. Commencing Arbitration. A party intending to seek arbitration must first send to the other, by an international courier with a tracking mechanism, a written notice of intent to arbitrate (a “Notice”), or, in the absence of a mailing address provided by you to Administrator, via any other method available to Administrator, including via e-mail. The Notice to Administrator must be addressed to selltome.com.ng Online Marketplace by Tech Plus Network Nigeria Limited (350, Borno Way, Yaba, Lagos, Nigeria), Attn: Chief Executive Officer (the \"Arbitration Notice Address\"). The Notice must (i) describe the nature and basis of the claim or dispute; and (ii) set forth the specific relief sought (the \"Demand\"). If you and Administrator do not reach an agreement to resolve the claim within 30 days after the Notice is received, then you or Administrator may commence an arbitration proceeding as set forth below or file a claim in small claims court. THE AMERICAN ARBITRATION ASSOCIATION (\"AAA\") WILL ADMINISTER THE ARBITRATION IN ACCORDANCE WITH ITS COMMERCIAL ARBITRATION RULES AND THE SUPPLEMENTARY PROCEDURES FOR CONSUMER RELATED DISPUTES (THE \"Rules\"), AS MODIFIED BY THIS TERMS AND CONDITIONS. The Rules and AAA forms are available online at http://www.adr.org. If you are required to pay a filing fee to commence an arbitration against Administrator, then Administrator will promptly reimburse you for your confirmed payment of the filing fee upon Administrator\'s receipt of a Notice at the Arbitration Notice Address that you have commenced arbitration along with a receipt evidencing payment of the filing fee, unless your Demand is equal to or greater than $1,000 or was filed in bad faith, in which case you are solely responsible for the payment of the filing fee.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">11.3. Arbitration Proceeding. The arbitration will be in English. A single independent and impartial arbitrator with his or her primary place of business in Alexandria, Virginia will be appointed pursuant to the Rules, as modified herein. You and Administrator agree to comply with the following rules, which are intended to streamline the dispute resolution process and reduce the costs and burdens on the parties: (i) the arbitration will be conducted online and/or be solely based on written submissions, the specific manner to be chosen by the party initiating the arbitration; (ii) the arbitration will not require any personal appearance by the parties or witnesses unless otherwise mutually agreed in writing by the parties; and (iii) any judgment on the award the arbitrator renders may be entered in any court of competent jurisdiction.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">11.4. No Class Actions. TO THE FULLEST EXTENT PERMITTED UNDER LAW, YOU AND ADMINISTRATOR AGREE THAT YOU AND ADMINISTRATOR MAY BRING CLAIMS AGAINST THE OTHER ONLY IN YOUR OR ITS INDIVIDUAL CAPACITY AND NOT AS A PLAINTIFF OR CLASS MEMBER IN ANY PURPORTED CLASS OR REPRESENTATIVE PROCEEDING. FURTHER, YOU AGREE THAT THE ARBITRATOR MAY NOT CONSOLIDATE PROCEEDINGS OF MORE THAN ONE PERSON\'S CLAIMS, AND MAY NOT OTHERWISE PRESIDE OVER ANY FORM OF A REPRESENTATIVE OR CLASS PROCEEDING, AND THAT IF THIS SPECIFIC PROVISO IS FOUND TO BE UNENFORCEABLE, THEN THE ENTIRETY OF THIS MANDATORY ARBITRATION SECTION WILL BE NULL AND VOID.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">11.5. Decision of the Arbitrator. Barring extraordinary circumstances, the arbitrator will issue his or her decision within 120 days from the date the arbitrator is appointed. The arbitrator may extend this time limit for an additional 30 days in the interests of justice. All arbitration proceedings will be closed to the public and confidential, and all records relating thereto will be permanently sealed, except as necessary to obtain court confirmation of the arbitration award. The award of the arbitrator will be in writing and will include a statement setting forth the reasons for the disposition of any claim. The arbitrator will apply the laws of the State of California in conducting the arbitration. You acknowledge that these terms and your use of the Service evidences a transaction involving interstate commerce. The United States Federal Arbitration Act will govern the interpretation, enforcement, and proceedings pursuant to this Section 11.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">11.6. Equitable Relief. The foregoing provisions of this Section 11 do not apply to any claim in which either party seeks equitable relief to protect such party’s copyrights, trademarks, or patents. For the avoidance of doubt, however, you acknowledge that, in the event Administrator or a third party breaches this Terms and Conditions, the damage or harm, if any, caused to you will not entitle you to seek injunctive or other equitable relief against Administrator, and your only remedy will be for monetary damages, subject to the limitations of liability set forth in this Terms and Conditions.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">11.7. Claims. You and Administrator agree that, notwithstanding any other rights a party may have under law or equity, any cause of action arising out of or related to this Terms and Conditions or the Service, excluding a claim for indemnification, must commence within one year after the cause of action accrues. Otherwise, such cause of action is permanently barred.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">11.8. Improperly Filed Claims. All claims you bring against Administrator must be resolved in accordance with this Section. All claims filed or brought contrary to this Section will be considered improperly filed. Should you file a claim contrary to this Section, Administrator may recover attorneys\' fees and reimbursement of its costs, provided that Administrator has notified you in writing of the improperly filed claim, and you have failed to promptly withdraw the claim.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">11.9. Modifications. In the event that Administrator makes any future change to the \"Mandatory Arbitration\" paragraph set forth above (other than a change to Administrator\'s Arbitration Notice Address), you may reject any such change by sending us written notice within thirty (30) days of the change to Administrator\'s Arbitration Notice Address, in which case your account with Administrator and your license to use the Service will terminate immediately, and this Section, as in effect immediately prior to the amendments you reject, will survive the termination of this Terms and Conditions.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><b><span style=\"font-size: 24px;\">12. Miscellanies</span></b></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">12.1. Except as otherwise provided, if any provision of this Terms and Conditions is held to be invalid, void or for any reason unenforceable, such provision shall be struck out and shall not affect the validity and enforceability of the remaining provisions. In our sole discretion, we may assign this Terms and Conditions, and in such event, we will post notice on www.ebay.com.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">12.2. Our failure to act with respect to a breach by you or others does not waive our right to act with respect to subsequent or similar breaches. We do not guarantee we will take action against all breaches of this Terms and Conditions.</font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\"><br></font></p><p style=\"word-break: break-word; overflow-wrap: break-word; margin-bottom: 15px;\"><font color=\"#555555\">12.3. The policies posted on our sites may be changed from time to time. Changes take effect when we post them on the Resource.</font></p></div>', '2022-11-07 21:00:20', '2022-11-07 21:00:20');

-- --------------------------------------------------------

--
-- Table structure for table `blog_images`
--

CREATE TABLE `blog_images` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `image_url` text NOT NULL,
  `cover_page` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `logo` text NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` varchar(191) NOT NULL,
  `updated_at` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `icon` text NOT NULL,
  `link` varchar(100) NOT NULL,
  `mobile` varchar(30) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` varchar(191) NOT NULL,
  `updated_at` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `icon`, `link`, `mobile`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Cars', '/assets/icons/cars.svg', '/cars', '/assets/images/cars.png', 1, '2022-11-15 21:33:56', '2022-11-15 21:33:56'),
(2, 'Buses', '/assets/icons/buses.svg', '/buses', '/assets/images/buses.png', 1, '2022-11-15 21:33:56', '2022-11-15 21:33:56'),
(3, 'Trucks & Trailers', '/assets/icons/trucks.svg', '/trucks-and-trailers', '/assets/images/trucks.png', 1, '2022-11-15 21:33:56', '2022-11-15 21:33:56'),
(4, 'Motorcycles', '/assets/icons/motorcycle.svg', '/motorcycles', '/assets/images/bike.png', 1, '2022-11-15 21:33:56', '2022-11-15 21:33:56'),
(5, 'Boats-Ships', '/assets/icons/boats.svg', '/boats-and-ships', '/assets/images/boats.png', 1, '2022-11-15 21:33:56', '2022-11-15 21:33:56'),
(6, 'Trains', '/assets/icons/trains.svg', '/trains', '/assets/images/trains.png', 1, '2022-11-15 21:33:56', '2022-11-15 21:33:56'),
(7, 'Aircrafts', '/assets/icons/aircrafts.svg', '/aircrafts', '/assets/images/aircrafts.png', 1, '2022-11-15 21:33:56', '2022-11-15 21:33:56'),
(8, 'AI', '/assets/icons/boats.svg', '/ai', '/assets/images/boats.png', 1, '2022-11-15 21:33:56', '2022-11-15 21:33:56'),
(9, 'Spare parts Accessories', '/assets/icons/tire.svg', '/spare-parts-and-accessories', '/assets/images/spare.png', 0, '2022-11-15 21:33:56', '2022-11-15 21:33:56');

-- --------------------------------------------------------

--
-- Table structure for table `colours`
--

CREATE TABLE `colours` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `category` varchar(30) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `colours`
--

INSERT INTO `colours` (`id`, `name`, `category`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Black', 'POPULAR', 1, '2023-02-26 17:35:52', '2023-02-26 17:35:52'),
(2, 'Blue', 'POPULAR', 1, '2023-02-26 17:35:52', '2023-02-26 17:35:52'),
(3, 'Grey', 'OTHER', 1, '2023-02-26 17:36:46', '2023-02-26 17:36:46'),
(4, 'Silver', 'OTHER', 1, '2023-02-26 17:36:46', '2023-02-26 17:36:46'),
(5, 'Biege', 'OTHER', 1, '2023-02-26 17:36:46', '2023-02-26 17:36:46'),
(6, 'Emerald', 'OTHER', 1, '2023-02-26 17:36:46', '2023-02-26 17:36:46'),
(7, 'Olive', 'OTHER', 1, '2023-02-26 17:36:46', '2023-02-26 17:36:46'),
(8, 'Lime', 'OTHER', 1, '2023-02-26 17:36:46', '2023-02-26 17:36:46'),
(9, 'Azure', 'OTHER', 1, '2023-02-26 17:36:46', '2023-02-26 17:36:46'),
(10, 'Indigo', 'OTHER', 1, '2023-02-26 17:36:46', '2023-02-26 17:36:46'),
(11, 'Teal', 'OTHER', 1, '2023-02-26 17:36:46', '2023-02-26 17:36:46'),
(12, 'Lavender', 'OTHER', 1, '2023-02-26 17:36:46', '2023-02-26 17:36:46'),
(13, 'Magenta', 'OTHER', 1, '2023-02-26 17:36:46', '2023-02-26 17:36:46'),
(14, 'Violet', 'OTHER', 1, '2023-02-26 17:36:46', '2023-02-26 17:36:46'),
(15, 'Beige', 'OTHER', 1, '2023-02-26 17:36:46', '2023-02-26 17:36:46'),
(16, 'Chocolate', 'OTHER', 1, '2023-02-26 17:36:46', '2023-02-26 17:36:46'),
(17, 'Sienna', 'OTHER', 1, '2023-02-26 17:36:46', '2023-02-26 17:36:46'),
(18, 'Charcoal', 'OTHER', 1, '2023-02-26 17:36:46', '2023-02-26 17:36:46'),
(19, 'Slate', 'OTHER', 1, '2023-02-26 17:36:46', '2023-02-26 17:36:46'),
(20, 'Crimson', 'OTHER', 1, '2023-02-26 17:36:46', '2023-02-26 17:36:46'),
(21, 'Maroon', 'OTHER', 1, '2023-02-26 17:36:46', '2023-02-26 17:36:46'),
(22, 'Scarlet', 'OTHER', 1, '2023-02-26 17:36:46', '2023-02-26 17:36:46'),
(23, 'Gold', 'OTHER', 1, '2023-02-26 17:36:46', '2023-02-26 17:36:46'),
(24, 'Lemon', 'OTHER', 1, '2023-02-26 17:36:46', '2023-02-26 17:36:46'),
(25, 'Red', 'OTHER', 1, '2023-02-26 17:36:46', '2023-02-26 17:36:46'),
(26, 'Yellow', 'OTHER', 1, '2023-02-26 17:36:46', '2023-02-26 17:36:46'),
(27, 'Green', 'OTHER', 1, '2023-02-26 17:36:46', '2023-02-26 17:36:46'),
(28, 'Purple', 'OTHER', 1, '2023-02-26 17:36:46', '2023-02-26 17:36:46'),
(29, 'Brown', 'OTHER', 1, '2023-02-26 17:36:46', '2023-02-26 17:36:46'),
(30, 'Pink', 'OTHER', 1, '2023-02-26 17:36:46', '2023-02-26 17:36:46'),
(31, 'White', 'OTHER', 1, '2023-02-26 17:36:46', '2023-02-26 17:36:46'),
(32, 'Orange', 'OTHER', 1, '2023-11-22 00:45:41', '2023-11-22 00:45:41');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `user_id`, `message`, `created_at`, `updated_at`) VALUES
(1, 3, 28, 'Am coming down for inspection', '2024-06-15 00:10:05', '2024-06-15 00:10:05'),
(2, 3, 28, 'Asking to get more detail on this product', '2024-06-15 00:45:10', '2024-06-15 00:45:10'),
(3, 2, 28, 'I like this', '2024-06-15 00:46:28', '2024-06-15 00:46:28'),
(4, 2, 28, 'Can i talk to someone', '2024-06-15 00:46:44', '2024-06-15 00:46:44'),
(5, 2, 28, 'Trying out commenting', '2024-06-15 03:55:12', '2024-06-15 03:55:12'),
(6, 1, 28, 'Cool and Nice', '2024-07-06 02:59:43', '2024-07-06 02:59:43');

-- --------------------------------------------------------

--
-- Table structure for table `companys`
--

CREATE TABLE `companys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `cac_number` varchar(100) DEFAULT NULL,
  `nata` int(11) NOT NULL DEFAULT 0,
  `address` varchar(200) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companys`
--

INSERT INTO `companys` (`id`, `user_id`, `name`, `cac_number`, `nata`, `address`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 'Samji Ventures', '1', 1, '23, Oyedire street', 1, '2023-02-26 13:49:33', '2023-02-26 13:49:33'),
(2, 7, 'Samji Ventures', '73737373', 0, '23, Onipanu Street', 1, '2023-03-20 18:21:01', '2023-03-20 18:21:01'),
(3, 8, 'Samji Ventures', '83737373', 0, '25, Oyewole Lamidi', 1, '2023-03-20 18:22:47', '2023-03-20 18:22:47'),
(4, 11, 'Autohub Nigeria', 'RC150324', 0, 'Plot 2015 Festac Link Road Amuwo Odofin, Lagos.', 1, '2023-04-24 09:03:02', '2023-04-24 09:03:02'),
(5, 12, 'Lamidi Ventures', '367232', 1, '6 220 Makinde Street, Anaocha, Anambra', 1, '2023-05-13 04:40:02', '2023-05-15 10:50:23'),
(6, 13, 'Tech Plus Auto', 'Tech Plus Network', 0, 'bariga lagos', 1, '2023-05-15 06:05:24', '2023-05-15 06:05:24'),
(7, 23, 'Samji Ventures', '2424234342', 0, '23, Oyedire street', 1, '2023-10-04 02:58:22', '2023-10-04 02:58:22'),
(8, 65, 'ABCD', '1111111111', 0, 'Greatness', 1, '2024-06-07 23:07:04', '2024-06-07 23:07:04'),
(9, 66, 'Imole AYO', '33333333', 0, 'Crazy World', 1, '2024-06-07 23:15:53', '2024-06-07 23:15:53'),
(10, 67, 'Imole AYO', '2222222222', 0, 'Crazy World', 1, '2024-06-07 23:20:15', '2024-06-07 23:20:15'),
(11, 80, 'AutoHub', '1092834809', 0, 'Plot 1205 Festac-Link Road', 1, '2024-07-09 03:59:47', '2024-07-09 03:59:47'),
(12, 81, 'AutoHub', '1092834809', 0, 'Plot 1205 Festac-Link Road', 1, '2024-07-09 04:20:34', '2024-07-09 04:20:34'),
(13, 105, 'AutoHub1', '1092834809', 0, 'Plot 1205 Festac-Link Road1', 1, '2024-07-09 06:33:07', '2024-07-09 06:33:07'),
(14, 116, 'Number Number', '233449233', 0, 'Festac Festac', 1, '2024-07-18 03:01:25', '2024-07-18 03:01:25');

-- --------------------------------------------------------

--
-- Table structure for table `conditions`
--

CREATE TABLE `conditions` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `conditions`
--

INSERT INTO `conditions` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Brand new', 1, '2023-02-26 17:23:24', '2023-02-26 17:23:24'),
(2, 'Foreign', 1, '2023-02-26 17:23:24', '2023-02-26 17:23:24'),
(3, 'Nigerian used', 1, '2023-02-26 17:23:24', '2023-02-26 17:23:24');

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `sent_by` int(11) NOT NULL,
  `received_by` int(11) NOT NULL,
  `conversation_id` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `conversations`
--

INSERT INTO `conversations` (`id`, `product_id`, `message`, `sent_by`, `received_by`, `conversation_id`, `created_at`, `updated_at`) VALUES
(1, 108, 'Hi', 28, 62, '108-jreuroeoormeoer', '2024-07-17 11:21:16', '2024-07-17 11:21:16'),
(2, 108, 'Good afternoon', 62, 28, '108-jreuroeoormeoer', '2024-07-17 11:23:10', '2024-07-17 11:23:10'),
(3, 108, 'Afternoon', 28, 62, '108-jreuroeoormeoer', '2024-07-17 11:52:40', '2024-07-17 11:52:40'),
(8, 108, 'Can i have a reduced price for this car?', 62, 28, '108-jreuroeoormeoer', '2024-07-17 12:11:48', '2024-07-17 12:11:48'),
(10, 107, 'Hi', 28, 81, 'kroijkfgffgfgfg', '2024-07-17 13:56:59', '2024-07-17 13:56:59'),
(11, 107, '.I goat you', 28, 81, 'kroijkfgffgfgfg', '2024-07-17 13:59:38', '2024-07-17 13:59:38'),
(12, 93, '.I goat you', 28, 28, '108-jreuroeoormeoer', '2024-07-17 15:24:46', '2024-07-17 15:24:46'),
(13, 108, 'We already gave you a good price', 114, 62, '108-jreuroeoormeoer', '2024-07-17 19:54:41', '2024-07-17 19:54:41'),
(14, 114, 'What a nice car', 62, 62, '108-jreuroeoormeoer', '2024-07-18 02:54:28', '2024-07-18 02:54:28'),
(15, 108, 'That`s on a hight side', 62, 62, '108-jreuroeoormeoer', '2024-07-18 02:56:44', '2024-07-18 02:56:44');

-- --------------------------------------------------------

--
-- Table structure for table `conversations_users`
--

CREATE TABLE `conversations_users` (
  `id` int(11) NOT NULL,
  `conversation_id` varchar(50) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `conversations_users`
--

INSERT INTO `conversations_users` (`id`, `conversation_id`, `sender_id`, `receiver_id`, `created_at`, `updated_at`) VALUES
(1, '108-jreuroeoormeoer', 28, 62, '2024-07-17 13:02:07', NULL),
(2, 'kroijkfgffgfgfg', 28, 81, '2024-07-17 13:53:59', '2024-07-17 13:53:59');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `slug` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `file_name` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_attendee`
--

CREATE TABLE `course_attendee` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_marks`
--

CREATE TABLE `exam_marks` (
  `id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `exam_question_id` int(11) NOT NULL,
  `selected` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_questionaires`
--

CREATE TABLE `exam_questionaires` (
  `id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_questions`
--

CREATE TABLE `exam_questions` (
  `id` int(11) NOT NULL DEFAULT 0,
  `exam_questionaire_id` int(11) NOT NULL,
  `question` varchar(500) NOT NULL,
  `option_a` int(11) NOT NULL,
  `option_b` int(11) NOT NULL,
  `option_c` int(11) NOT NULL,
  `option_d` int(11) NOT NULL,
  `answer` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(11) NOT NULL,
  `title` varchar(225) NOT NULL,
  `content` text NOT NULL,
  `isOpened` varchar(100) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `title`, `content`, `isOpened`, `created_at`, `updated_at`) VALUES
(1, 'CAR ENGINE SERVICE', 'This will return true. Save always returns true, unless update or save ...', 'opened', '2024-06-01 04:25:16', '2024-06-27 21:00:52'),
(2, 'How To Save Money By Reducing Fuel Consumption', 'No one needs to be told, with the current reality – nah only big boiz & gurls  ...', 'closed', '2024-06-01 04:29:18', '2024-06-01 04:29:40');

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

CREATE TABLE `followers` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `vendor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `followers`
--

INSERT INTO `followers` (`id`, `user`, `vendor`) VALUES
(54, 28, 63),
(66, 63, 63),
(67, 114, 62),
(68, 62, 62);

-- --------------------------------------------------------

--
-- Table structure for table `home_sliders`
--

CREATE TABLE `home_sliders` (
  `id` int(11) NOT NULL,
  `image` text NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` varchar(191) NOT NULL,
  `updated_at` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_sliders`
--

INSERT INTO `home_sliders` (`id`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'assets/images/sliders/slider11.jpg', 1, '2022-11-17 12:59:41', '2022-11-17 12:59:41'),
(2, 'assets/images/sliders/slider22.jpg', 1, '2022-11-17 12:59:41', '2022-11-17 12:59:41'),
(3, 'assets/images/sliders/slider33.jpg', 1, '2022-11-17 12:59:41', '2022-11-17 12:59:41'),
(4, 'assets/images/sliders/slider44.jpg', 1, '2022-11-17 12:59:41', '2022-11-17 12:59:41');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image_url` text NOT NULL,
  `cover_page` tinyint(1) NOT NULL DEFAULT 0,
  `as_advert` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `user_id`, `product_id`, `image_url`, `cover_page`, `as_advert`, `created_at`, `updated_at`, `deleted_at`) VALUES
(22, 28, 71, '2818039146046657fbee26fc3.jpg', 0, 1, '2024-05-30 04:09:18', '2024-06-01 01:24:12', NULL),
(23, 28, 71, '2818039146046657fbee2780b.jpg', 1, 0, '2024-05-30 04:09:18', '2024-06-01 01:24:13', NULL),
(24, 28, 72, '2816021201156658025b66a46.jpg', 1, 0, '2024-05-30 04:36:43', '2024-06-01 01:30:00', NULL),
(25, 28, 72, '2816021201156658025b6737e.jpg', 0, 0, '2024-05-30 04:36:43', '2024-06-01 01:30:00', NULL),
(26, 28, 73, '286746062276659027abd1fa.jpg', 0, 0, '2024-05-30 22:49:31', '2024-05-30 22:49:31', NULL),
(27, 28, 73, '286746062276659027ac2dc4.jpg', 1, 1, '2024-05-30 22:49:31', '2024-05-30 22:49:31', NULL),
(30, 28, 75, '281369224617665947f07e1a0.jpg', 0, 0, '2024-05-31 03:45:52', '2024-06-01 01:24:25', NULL),
(31, 28, 75, '281369224617665947f07ea1c.jpg', 0, 0, '2024-05-31 03:45:52', '2024-05-31 03:45:52', NULL),
(32, 28, 75, '281369224617665947f07ecae.jpg', 0, 0, '2024-05-31 03:45:52', '2024-05-31 04:04:42', NULL),
(33, 28, 75, '281369224617665947f07eeb8.jpg', 1, 0, '2024-05-31 03:45:53', '2024-06-01 01:24:25', NULL),
(34, 28, 71, '1717131399-537914853075053-IMG-20230817-WA0015.jpg', 0, 0, '2024-05-31 04:56:39', '2024-05-31 04:56:39', NULL),
(35, 28, 76, '28389603684665a7ab0f0dc3.jpg', 0, 0, '2024-06-01 01:34:41', '2024-06-01 01:34:41', NULL),
(36, 28, 76, '28389603684665a7ab0f15d3.jpg', 1, 0, '2024-06-01 01:34:41', '2024-06-01 03:44:49', NULL),
(37, 28, 76, '28389603684665a7ab0f18ae.jpg', 0, 0, '2024-06-01 01:34:41', '2024-06-01 01:34:41', NULL),
(38, 28, 77, '281115466323665fed6456b57.jpg', 0, 0, '2024-06-05 04:45:24', '2024-06-05 04:45:24', NULL),
(39, 28, 77, '281115466323665fed64572c7.jpg', 0, 0, '2024-06-05 04:45:24', '2024-06-05 04:45:24', NULL),
(40, 28, 77, '281115466323665fed6457530.jpg', 0, 0, '2024-06-05 04:45:24', '2024-06-05 04:45:24', NULL),
(41, 28, 77, '281115466323665fed645774d.jpg', 0, 0, '2024-06-05 04:45:24', '2024-06-05 04:45:24', NULL),
(42, 28, 77, '281115466323665fed645795c.jpg', 1, 0, '2024-06-05 04:45:24', '2024-06-05 04:45:24', NULL),
(43, 28, 77, '281115466323665fed6457d1e.jpg', 0, 0, '2024-06-05 04:45:24', '2024-06-05 04:45:24', NULL),
(44, 28, 77, '28111546', 0, 0, '2024-06-05 04:45:24', '2024-06-05 04:45:24', NULL),
(45, 28, 78, '281300888423665fedba1e6c0.jpg', 0, 0, '2024-06-05 04:46:50', '2024-06-05 04:46:50', NULL),
(46, 28, 78, '281300888423665fedba1eee0.jpg', 0, 0, '2024-06-05 04:46:50', '2024-06-05 04:46:50', NULL),
(47, 28, 78, '281300888423665fedba1f1d0.jpg', 0, 0, '2024-06-05 04:46:50', '2024-06-05 04:46:50', NULL),
(48, 28, 78, '281300888423665fedba1f4ee.jpg', 1, 0, '2024-06-05 04:46:50', '2024-06-08 04:14:51', NULL),
(49, 28, 79, '2813037231066612dd4934a7.jpg', 0, 0, '2024-06-06 03:32:37', '2024-06-06 03:32:37', NULL),
(50, 28, 79, '2813037231066612dd494026.jpg', 1, 0, '2024-06-06 03:32:37', '2024-06-06 03:32:37', NULL),
(51, 28, 79, '2813037231066612dd494318.jpg', 0, 0, '2024-06-06 03:32:37', '2024-06-06 03:32:37', NULL),
(52, 28, 82, '28175360876666133e73c783.jpg', 0, 0, '2024-06-06 03:58:31', '2024-06-06 03:58:31', NULL),
(53, 28, 82, '28175360876666133e73d0a3.jpg', 1, 0, '2024-06-06 03:58:31', '2024-06-06 03:58:31', NULL),
(54, 28, 82, '28175360876666133e73d35c.jpg', 0, 0, '2024-06-06 03:58:31', '2024-06-06 03:58:31', NULL),
(55, 28, 83, '2838030374466613793a8fc2.jpg', 1, 0, '2024-06-06 04:14:11', '2024-06-06 04:14:12', NULL),
(56, 28, 83, '2838030374466613793a9a07.jpg', 0, 0, '2024-06-06 04:14:12', '2024-06-06 04:14:12', NULL),
(57, 28, 84, '2872194114166626f396e3f7.jpg', 0, 0, '2024-06-07 02:23:53', '2024-06-07 02:23:53', NULL),
(58, 28, 84, '2872194114166626f396f2dc.jpg', 0, 0, '2024-06-07 02:23:53', '2024-06-07 02:23:53', NULL),
(59, 28, 84, '2872194114166626f396f77a.jpg', 1, 0, '2024-06-07 02:23:53', '2024-06-07 02:23:54', NULL),
(60, 28, 84, '2872194114166626f396fcdf.jpg', 0, 0, '2024-06-07 02:23:53', '2024-06-07 02:23:53', NULL),
(61, 28, 84, '2872194114166626f397025d.jpg', 0, 0, '2024-06-07 02:23:54', '2024-06-07 02:23:54', NULL),
(62, 28, 78, '1717820076-593418632618879-8882d2bfc3da4fecba1a9bb0f6203a18.jpg', 0, 0, '2024-06-08 04:14:36', '2024-06-08 04:14:51', NULL),
(63, 28, 85, '282718827556664df0c100ab.jpg', 0, 0, '2024-06-08 22:45:32', '2024-06-08 22:45:32', NULL),
(64, 28, 85, '282718827556664df0c1099b.jpg', 1, 0, '2024-06-08 22:45:32', '2024-06-08 22:45:32', NULL),
(65, 28, 85, '282718827556664df0c10c44.jpg', 0, 0, '2024-06-08 22:45:32', '2024-06-08 22:45:32', NULL),
(66, 28, 86, '2819656805516664dff617be1.jpg', 1, 0, '2024-06-08 22:49:26', '2024-06-08 22:49:26', NULL),
(67, 28, 86, '2819656805516664dff618544.jpg', 0, 0, '2024-06-08 22:49:26', '2024-06-08 22:49:26', NULL),
(68, 28, 87, '286889151546664e0ec45bd0.jpg', 1, 0, '2024-06-08 22:53:32', '2024-06-08 22:53:32', NULL),
(69, 28, 88, '286251012986664e134a9012.jpg', 1, 0, '2024-06-08 22:54:44', '2024-06-08 22:54:44', NULL),
(70, 28, 88, '286251012986664e134a9ba7.jpg', 0, 0, '2024-06-08 22:54:44', '2024-06-08 22:54:44', NULL),
(71, 28, 89, '282886747806664e1818b722.jpg', 0, 0, '2024-06-08 22:56:01', '2024-06-08 22:56:01', NULL),
(72, 28, 89, '282886747806664e1818c224.jpg', 1, 0, '2024-06-08 22:56:01', '2024-06-08 22:56:01', NULL),
(73, 28, 90, '285661851756664e1ca52543.jpg', 0, 0, '2024-06-08 22:57:14', '2024-06-08 22:57:14', NULL),
(74, 28, 90, '285661851756664e1ca53072.jpg', 0, 0, '2024-06-08 22:57:14', '2024-06-08 22:57:14', NULL),
(75, 28, 90, '285661851756664e1ca53386.jpg', 1, 0, '2024-06-08 22:57:14', '2024-06-08 22:57:14', NULL),
(80, 28, 92, '2818224750066664e2923b889.jpg', 0, 0, '2024-06-08 23:00:34', '2024-06-08 23:00:34', NULL),
(81, 28, 92, '2818224750066664e2923c333.jpg', 1, 0, '2024-06-08 23:00:34', '2024-06-08 23:00:34', NULL),
(82, 28, 93, '2814718629176664e34071acf.jpg', 0, 1, '2024-06-08 23:03:28', '2024-06-09 00:49:56', NULL),
(83, 28, 93, '2814718629176664e340725c8.jpg', 1, 0, '2024-06-08 23:03:28', '2024-06-08 23:03:28', NULL),
(84, 28, 94, '2817802612096664e371b87d3.jpg', 1, 0, '2024-06-08 23:04:18', '2024-06-08 23:04:18', NULL),
(88, 28, 97, '2818729176516664eb179505d.jpg', 0, 0, '2024-06-08 23:36:55', '2024-06-08 23:36:55', NULL),
(89, 28, 97, '2818729176516664eb1795909.jpg', 1, 1, '2024-06-08 23:36:55', '2024-06-27 01:47:06', NULL),
(90, 28, 98, '283782270606664f10d0a9ce.jpg', 0, 0, '2024-06-09 00:02:21', '2024-06-09 00:02:21', NULL),
(91, 28, 98, '283782270606664f10d0b270.jpg', 1, 0, '2024-06-09 00:02:21', '2024-06-09 00:02:21', NULL),
(92, 28, 99, '2819717790856664f134a33b1.jpg', 0, 0, '2024-06-09 00:03:00', '2024-06-09 00:03:00', NULL),
(93, 28, 99, '2819717790856664f134a3e5b.jpg', 1, 0, '2024-06-09 00:03:01', '2024-06-09 00:03:01', NULL),
(98, 28, 102, '281750354683666d23b513d3c.jpg', 1, 0, '2024-06-15 05:16:37', '2024-06-15 05:16:37', NULL),
(105, 28, 105, '2862190725466871f9fee4f6.jpg', 1, 0, '2024-07-04 22:18:08', '2024-07-04 22:18:08', NULL),
(106, 28, 105, '2862190725466871f9fee866.jpg', 0, 0, '2024-07-04 22:18:08', '2024-07-04 22:18:08', NULL),
(107, 28, 106, '28130448406566874eb517df4.jpg', 0, 0, '2024-07-05 01:39:01', '2024-07-05 01:39:01', NULL),
(108, 28, 106, '28130448406566874eb5181a0.jpg', 0, 0, '2024-07-05 01:39:01', '2024-07-05 01:39:01', NULL),
(111, 63, 107, '63282179434668c881ae5c09.jpg', 1, 0, '2024-07-09 00:45:15', '2024-07-09 00:45:15', NULL),
(112, 63, 107, '63282179434668c881ae5f94.jpg', 0, 0, '2024-07-09 00:45:15', '2024-07-09 00:45:15', NULL),
(113, 63, 107, '63282179434668c881ae6260.jpg', 0, 0, '2024-07-09 00:45:15', '2024-07-09 00:45:15', NULL),
(114, 62, 108, '62560561615668cb82bcfdc1.jpg', 0, 0, '2024-07-09 04:10:20', '2024-07-09 04:10:20', NULL),
(115, 62, 108, '62560561615668cb82bd00ca.jpg', 1, 0, '2024-07-09 04:10:20', '2024-07-09 04:10:20', NULL),
(116, 62, 108, '62560561615668cb82bd03a4.jpg', 0, 0, '2024-07-09 04:10:20', '2024-07-09 04:10:20', NULL),
(117, 28, 106, '1721213721-44695032780624-IMG-20240715-WA0012.jpg', 0, 0, '2024-07-17 10:55:21', '2024-07-17 10:55:21', NULL),
(119, 28, 106, '1721213734-529972004616738-IMG-20240715-WA0013.jpg', 0, 0, '2024-07-17 10:55:34', '2024-07-17 10:55:34', NULL),
(120, 28, 106, '1721213744-551707799258020-IMG-20240715-WA0008.jpg', 0, 0, '2024-07-17 10:55:44', '2024-07-17 10:55:44', NULL),
(121, 28, 106, '1721213751-849772346991095-IMG-20240715-WA0003.jpg', 0, 0, '2024-07-17 10:55:51', '2024-07-17 10:55:51', NULL),
(122, 28, 106, '1721213758-861786245808170-IMG-20240715-WA0004.jpg', 0, 0, '2024-07-17 10:55:58', '2024-07-17 10:55:58', NULL),
(123, 28, 106, '1721213766-109251883233453-IMG-20240715-WA0013.jpg', 0, 0, '2024-07-17 10:56:06', '2024-07-17 10:56:06', NULL),
(130, 62, 110, '626695891766982c9a2bc2b.jpg', 0, 0, '2024-07-17 20:42:02', '2024-07-17 20:42:02', NULL),
(131, 62, 110, '626695891766982c9a2c0e5.jpg', 0, 0, '2024-07-17 20:42:02', '2024-07-17 20:42:02', NULL),
(132, 62, 110, '626695891766982c9a2c447.jpg', 0, 0, '2024-07-17 20:42:02', '2024-07-17 20:42:02', NULL),
(133, 62, 110, '626695891766982c9a2c7c5.jpg', 0, 0, '2024-07-17 20:42:02', '2024-07-17 20:42:02', NULL),
(134, 62, 110, '626695891766982c9a2cb1c.jpg', 1, 0, '2024-07-17 20:42:02', '2024-07-17 20:42:02', NULL),
(135, 62, 110, '626695891766982c9a2ce9f.jpg', 0, 0, '2024-07-17 20:42:02', '2024-07-17 20:42:02', NULL),
(136, 62, 111, '6269556409266982d20d763d.jpg', 0, 0, '2024-07-17 20:44:16', '2024-07-17 20:44:16', NULL),
(137, 62, 111, '6269556409266982d20d7b46.jpg', 0, 0, '2024-07-17 20:44:16', '2024-07-17 20:44:16', NULL),
(138, 62, 111, '6269556409266982d20d7e56.jpg', 1, 0, '2024-07-17 20:44:16', '2024-07-17 20:44:16', NULL),
(139, 62, 111, '6269556409266982d20d8147.jpg', 0, 0, '2024-07-17 20:44:16', '2024-07-17 20:44:16', NULL),
(140, 62, 111, '6269556409266982d20d8428.jpg', 0, 0, '2024-07-17 20:44:16', '2024-07-17 20:44:16', NULL),
(141, 62, 111, '6269556409266982d20d8725.jpg', 0, 0, '2024-07-17 20:44:16', '2024-07-17 20:44:16', NULL),
(142, 62, 112, '62172631167166982e7a3f15a.jpg', 1, 0, '2024-07-17 20:50:02', '2024-07-17 20:50:02', NULL),
(143, 62, 112, '62172631167166982e7a3f5f3.jpg', 0, 0, '2024-07-17 20:50:02', '2024-07-17 20:50:02', NULL),
(144, 62, 112, '62172631167166982e7a3f8fd.jpg', 0, 0, '2024-07-17 20:50:02', '2024-07-17 20:50:02', NULL),
(145, 62, 112, '62172631167166982e7a3fc23.jpg', 0, 0, '2024-07-17 20:50:02', '2024-07-17 20:50:02', NULL),
(146, 62, 112, '62172631167166982e7a4014b.jpg', 0, 0, '2024-07-17 20:50:02', '2024-07-17 20:50:02', NULL),
(147, 62, 113, '623877337896698327bf393d.jpg', 1, 0, '2024-07-17 21:07:08', '2024-07-17 21:07:08', NULL),
(148, 62, 113, '623877337896698327bf3d36.jpg', 0, 0, '2024-07-17 21:07:08', '2024-07-17 21:07:08', NULL),
(149, 62, 113, '623877337896698327bf402b.jpg', 0, 0, '2024-07-17 21:07:08', '2024-07-17 21:07:08', NULL),
(150, 62, 113, '623877337896698327c0016a.jpg', 0, 0, '2024-07-17 21:07:08', '2024-07-17 21:07:08', NULL),
(151, 62, 113, '623877337896698327c00747.jpg', 0, 0, '2024-07-17 21:07:08', '2024-07-17 21:07:08', NULL),
(152, 62, 114, '6218726315536698332a2ffb1.jpg', 0, 0, '2024-07-17 21:10:02', '2024-07-17 21:10:02', NULL),
(153, 62, 114, '6218726315536698332a3052b.jpg', 0, 0, '2024-07-17 21:10:02', '2024-07-17 21:10:02', NULL),
(154, 62, 114, '6218726315536698332a308a1.jpg', 1, 0, '2024-07-17 21:10:02', '2024-07-17 21:10:02', NULL),
(155, 62, 114, '6218726315536698332a30c94.jpg', 0, 0, '2024-07-17 21:10:02', '2024-07-17 21:10:02', NULL),
(156, 62, 114, '6218726315536698332a30fb1.jpg', 0, 0, '2024-07-17 21:10:02', '2024-07-17 21:10:02', NULL),
(157, 62, 114, '6218726315536698332a3126d.jpg', 0, 0, '2024-07-17 21:10:02', '2024-07-17 21:10:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `local_governments`
--

CREATE TABLE `local_governments` (
  `id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Local governments in Nigeria.';

--
-- Dumping data for table `local_governments`
--

INSERT INTO `local_governments` (`id`, `state_id`, `name`) VALUES
(1, 1, 'Aba North'),
(2, 1, 'Aba South'),
(3, 1, 'Arochukwu'),
(4, 1, 'Bende'),
(5, 1, 'Ikwuano'),
(6, 1, 'Isiala Ngwa North'),
(7, 1, 'Isiala Ngwa South'),
(8, 1, 'Isuikwuato'),
(9, 1, 'Obi Ngwa'),
(10, 1, 'Ohafia'),
(11, 1, 'Osisioma'),
(12, 1, 'Ugwunagbo'),
(13, 1, 'Ukwa East'),
(14, 1, 'Ukwa West'),
(15, 1, 'Umuahia North'),
(16, 1, 'Umuahia South'),
(17, 1, 'Umu Nneochi'),
(18, 2, 'Demsa'),
(19, 2, 'Fufure'),
(20, 2, 'Ganye'),
(21, 2, 'Gayuk'),
(22, 2, 'Gombi'),
(23, 2, 'Grie'),
(24, 2, 'Hong'),
(25, 2, 'Jada'),
(26, 2, 'Larmurde'),
(27, 2, 'Madagali'),
(28, 2, 'Maiha'),
(29, 2, 'Mayo Belwa'),
(30, 2, 'Michika'),
(31, 2, 'Mubi North'),
(32, 2, 'Mubi South'),
(33, 2, 'Numan'),
(34, 2, 'Shelleng'),
(35, 2, 'Song'),
(36, 2, 'Toungo'),
(37, 2, 'Yola North'),
(38, 2, 'Yola South'),
(39, 3, 'Abak'),
(40, 3, 'Eastern Obolo'),
(41, 3, 'Eket'),
(42, 3, 'Esit Eket'),
(43, 3, 'Essien Udim'),
(44, 3, 'Etim Ekpo'),
(45, 3, 'Etinan'),
(46, 3, 'Ibeno'),
(47, 3, 'Ibesikpo Asutan'),
(48, 3, 'Ibiono-Ibom'),
(49, 3, 'Ika'),
(50, 3, 'Ikono'),
(51, 3, 'Ikot Abasi'),
(52, 3, 'Ikot Ekpene'),
(53, 3, 'Ini'),
(54, 3, 'Itu'),
(55, 3, 'Mbo'),
(56, 3, 'Mkpat-Enin'),
(57, 3, 'Nsit-Atai'),
(58, 3, 'Nsit-Ibom'),
(59, 3, 'Nsit-Ubium'),
(60, 3, 'Obot Akara'),
(61, 3, 'Okobo'),
(62, 3, 'Onna'),
(63, 3, 'Oron'),
(64, 3, 'Oruk Anam'),
(65, 3, 'Udung-Uko'),
(66, 3, 'Ukanafun'),
(67, 3, 'Uruan'),
(68, 3, 'Urue-Offong/Oruko'),
(69, 3, 'Uyo'),
(70, 4, 'Aguata'),
(71, 4, 'Anambra East'),
(72, 4, 'Anambra West'),
(73, 4, 'Anaocha'),
(74, 4, 'Awka North'),
(75, 4, 'Awka South'),
(76, 4, 'Ayamelum'),
(77, 4, 'Dunukofia'),
(78, 4, 'Ekwusigo'),
(79, 4, 'Idemili North'),
(80, 4, 'Idemili South'),
(81, 4, 'Ihiala'),
(82, 4, 'Njikoka'),
(83, 4, 'Nnewi North'),
(84, 4, 'Nnewi South'),
(85, 4, 'Ogbaru'),
(86, 4, 'Onitsha North'),
(87, 4, 'Onitsha South'),
(88, 4, 'Orumba North'),
(89, 4, 'Orumba South'),
(90, 4, 'Oyi'),
(91, 5, 'Alkaleri'),
(92, 5, 'Bauchi'),
(93, 5, 'Bogoro'),
(94, 5, 'Damban'),
(95, 5, 'Darazo'),
(96, 5, 'Dass'),
(97, 5, 'Gamawa'),
(98, 5, 'Ganjuwa'),
(99, 5, 'Giade'),
(100, 5, 'Itas/Gadau'),
(101, 5, 'Jama\'are'),
(102, 5, 'Katagum'),
(103, 5, 'Kirfi'),
(104, 5, 'Misau'),
(105, 5, 'Ningi'),
(106, 5, 'Shira'),
(107, 5, 'Tafawa Balewa'),
(108, 5, 'Toro'),
(109, 5, 'Warji'),
(110, 5, 'Zaki'),
(111, 6, 'Brass'),
(112, 6, 'Ekeremor'),
(113, 6, 'Kolokuma/Opokuma'),
(114, 6, 'Nembe'),
(115, 6, 'Ogbia'),
(116, 6, 'Sagbama'),
(117, 6, 'Southern Ijaw'),
(118, 6, 'Yenagoa'),
(119, 7, 'Agatu'),
(120, 7, 'Apa'),
(121, 7, 'Ado'),
(122, 7, 'Buruku'),
(123, 7, 'Gboko'),
(124, 7, 'Guma'),
(125, 7, 'Gwer East'),
(126, 7, 'Gwer West'),
(127, 7, 'Katsina-Ala'),
(128, 7, 'Konshisha'),
(129, 7, 'Kwande'),
(130, 7, 'Logo'),
(131, 7, 'Makurdi'),
(132, 7, 'Obi'),
(133, 7, 'Ogbadibo'),
(134, 7, 'Ohimini'),
(135, 7, 'Oju'),
(136, 7, 'Okpokwu'),
(137, 7, 'Oturkpo'),
(138, 7, 'Tarka'),
(139, 7, 'Ukum'),
(140, 7, 'Ushongo'),
(141, 7, 'Vandeikya'),
(142, 8, 'Abadam'),
(143, 8, 'Askira/Uba'),
(144, 8, 'Bama'),
(145, 8, 'Bayo'),
(146, 8, 'Biu'),
(147, 8, 'Chibok'),
(148, 8, 'Damboa'),
(149, 8, 'Dikwa'),
(150, 8, 'Gubio'),
(151, 8, 'Guzamala'),
(152, 8, 'Gwoza'),
(153, 8, 'Hawul'),
(154, 8, 'Jere'),
(155, 8, 'Kaga'),
(156, 8, 'Kala/Balge'),
(157, 8, 'Konduga'),
(158, 8, 'Kukawa'),
(159, 8, 'Kwaya Kusar'),
(160, 8, 'Mafa'),
(161, 8, 'Magumeri'),
(162, 8, 'Maiduguri'),
(163, 8, 'Marte'),
(164, 8, 'Mobbar'),
(165, 8, 'Monguno'),
(166, 8, 'Ngala'),
(167, 8, 'Nganzai'),
(168, 8, 'Shani'),
(169, 9, 'Abi'),
(170, 9, 'Akamkpa'),
(171, 9, 'Akpabuyo'),
(172, 9, 'Bakassi'),
(173, 9, 'Bekwarra'),
(174, 9, 'Biase'),
(175, 9, 'Boki'),
(176, 9, 'Calabar Municipal'),
(177, 9, 'Calabar South'),
(178, 9, 'Etung'),
(179, 9, 'Ikom'),
(180, 9, 'Obanliku'),
(181, 9, 'Obubra'),
(182, 9, 'Obudu'),
(183, 9, 'Odukpani'),
(184, 9, 'Ogoja'),
(185, 9, 'Yakuur'),
(186, 9, 'Yala'),
(187, 10, 'Aniocha North'),
(188, 10, 'Aniocha South'),
(189, 10, 'Bomadi'),
(190, 10, 'Burutu'),
(191, 10, 'Ethiope East'),
(192, 10, 'Ethiope West'),
(193, 10, 'Ika North East'),
(194, 10, 'Ika South'),
(195, 10, 'Isoko North'),
(196, 10, 'Isoko South'),
(197, 10, 'Ndokwa East'),
(198, 10, 'Ndokwa West'),
(199, 10, 'Okpe'),
(200, 10, 'Oshimili North'),
(201, 10, 'Oshimili South'),
(202, 10, 'Patani'),
(203, 10, 'Sapele, Delta'),
(204, 10, 'Udu'),
(205, 10, 'Ughelli North'),
(206, 10, 'Ughelli South'),
(207, 10, 'Ukwuani'),
(208, 10, 'Uvwie'),
(209, 10, 'Warri North'),
(210, 10, 'Warri South'),
(211, 10, 'Warri South West'),
(212, 11, 'Abakaliki'),
(213, 11, 'Afikpo North'),
(214, 11, 'Afikpo South'),
(215, 11, 'Ebonyi'),
(216, 11, 'Ezza North'),
(217, 11, 'Ezza South'),
(218, 11, 'Ikwo'),
(219, 11, 'Ishielu'),
(220, 11, 'Ivo'),
(221, 11, 'Izzi'),
(222, 11, 'Ohaozara'),
(223, 11, 'Ohaukwu'),
(224, 11, 'Onicha'),
(225, 12, 'Akoko-Edo'),
(226, 12, 'Egor'),
(227, 12, 'Esan Central'),
(228, 12, 'Esan North-East'),
(229, 12, 'Esan South-East'),
(230, 12, 'Esan West'),
(231, 12, 'Etsako Central'),
(232, 12, 'Etsako East'),
(233, 12, 'Etsako West'),
(234, 12, 'Igueben'),
(235, 12, 'Ikpoba Okha'),
(236, 12, 'Orhionmwon'),
(237, 12, 'Oredo'),
(238, 12, 'Ovia North-East'),
(239, 12, 'Ovia South-West'),
(240, 12, 'Owan East'),
(241, 12, 'Owan West'),
(242, 12, 'Uhunmwonde'),
(243, 13, 'Ado Ekiti'),
(244, 13, 'Efon'),
(245, 13, 'Ekiti East'),
(246, 13, 'Ekiti South-West'),
(247, 13, 'Ekiti West'),
(248, 13, 'Emure'),
(249, 13, 'Gbonyin'),
(250, 13, 'Ido Osi'),
(251, 13, 'Ijero'),
(252, 13, 'Ikere'),
(253, 13, 'Ikole'),
(254, 13, 'Ilejemeje'),
(255, 13, 'Irepodun/Ifelodun'),
(256, 13, 'Ise/Orun'),
(257, 13, 'Moba'),
(258, 13, 'Oye'),
(259, 14, 'Aninri'),
(260, 14, 'Awgu'),
(261, 14, 'Enugu East'),
(262, 14, 'Enugu North'),
(263, 14, 'Enugu South'),
(264, 14, 'Ezeagu'),
(265, 14, 'Igbo Etiti'),
(266, 14, 'Igbo Eze North'),
(267, 14, 'Igbo Eze South'),
(268, 14, 'Isi Uzo'),
(269, 14, 'Nkanu East'),
(270, 14, 'Nkanu West'),
(271, 14, 'Nsukka'),
(272, 14, 'Oji River'),
(273, 14, 'Udenu'),
(274, 14, 'Udi'),
(275, 14, 'Uzo Uwani'),
(276, 15, 'Abaji'),
(277, 15, 'Bwari'),
(278, 15, 'Gwagwalada'),
(279, 15, 'Kuje'),
(280, 15, 'Kwali'),
(281, 15, 'Municipal Area Council'),
(282, 16, 'Akko'),
(283, 16, 'Balanga'),
(284, 16, 'Billiri'),
(285, 16, 'Dukku'),
(286, 16, 'Funakaye'),
(287, 16, 'Gombe'),
(288, 16, 'Kaltungo'),
(289, 16, 'Kwami'),
(290, 16, 'Nafada'),
(291, 16, 'Shongom'),
(292, 16, 'Yamaltu/Deba'),
(293, 17, 'Aboh Mbaise'),
(294, 17, 'Ahiazu Mbaise'),
(295, 17, 'Ehime Mbano'),
(296, 17, 'Ezinihitte'),
(297, 17, 'Ideato North'),
(298, 17, 'Ideato South'),
(299, 17, 'Ihitte/Uboma'),
(300, 17, 'Ikeduru'),
(301, 17, 'Isiala Mbano'),
(302, 17, 'Isu'),
(303, 17, 'Mbaitoli'),
(304, 17, 'Ngor Okpala'),
(305, 17, 'Njaba'),
(306, 17, 'Nkwerre'),
(307, 17, 'Nwangele'),
(308, 17, 'Obowo'),
(309, 17, 'Oguta'),
(310, 17, 'Ohaji/Egbema'),
(311, 17, 'Okigwe'),
(312, 17, 'Orlu'),
(313, 17, 'Orsu'),
(314, 17, 'Oru East'),
(315, 17, 'Oru West'),
(316, 17, 'Owerri Municipal'),
(317, 17, 'Owerri North'),
(318, 17, 'Owerri West'),
(319, 17, 'Unuimo'),
(320, 18, 'Auyo'),
(321, 18, 'Babura'),
(322, 18, 'Biriniwa'),
(323, 18, 'Birnin Kudu'),
(324, 18, 'Buji'),
(325, 18, 'Dutse'),
(326, 18, 'Gagarawa'),
(327, 18, 'Garki'),
(328, 18, 'Gumel'),
(329, 18, 'Guri'),
(330, 18, 'Gwaram'),
(331, 18, 'Gwiwa'),
(332, 18, 'Hadejia'),
(333, 18, 'Jahun'),
(334, 18, 'Kafin Hausa'),
(335, 18, 'Kazaure'),
(336, 18, 'Kiri Kasama'),
(337, 18, 'Kiyawa'),
(338, 18, 'Kaugama'),
(339, 18, 'Maigatari'),
(340, 18, 'Malam Madori'),
(341, 18, 'Miga'),
(342, 18, 'Ringim'),
(343, 18, 'Roni'),
(344, 18, 'Sule Tankarkar'),
(345, 18, 'Taura'),
(346, 18, 'Yankwashi'),
(347, 19, 'Birnin Gwari'),
(348, 19, 'Chikun'),
(349, 19, 'Giwa'),
(350, 19, 'Igabi'),
(351, 19, 'Ikara'),
(352, 19, 'Jaba'),
(353, 19, 'Jema\'a'),
(354, 19, 'Kachia'),
(355, 19, 'Kaduna North'),
(356, 19, 'Kaduna South'),
(357, 19, 'Kagarko'),
(358, 19, 'Kajuru'),
(359, 19, 'Kaura'),
(360, 19, 'Kauru'),
(361, 19, 'Kubau'),
(362, 19, 'Kudan'),
(363, 19, 'Lere'),
(364, 19, 'Makarfi'),
(365, 19, 'Sabon Gari'),
(366, 19, 'Sanga'),
(367, 19, 'Soba'),
(368, 19, 'Zangon Kataf'),
(369, 19, 'Zaria'),
(370, 20, 'Ajingi'),
(371, 20, 'Albasu'),
(372, 20, 'Bagwai'),
(373, 20, 'Bebeji'),
(374, 20, 'Bichi'),
(375, 20, 'Bunkure'),
(376, 20, 'Dala'),
(377, 20, 'Dambatta'),
(378, 20, 'Dawakin Kudu'),
(379, 20, 'Dawakin Tofa'),
(380, 20, 'Doguwa'),
(381, 20, 'Fagge'),
(382, 20, 'Gabasawa'),
(383, 20, 'Garko'),
(384, 20, 'Garun Mallam'),
(385, 20, 'Gaya'),
(386, 20, 'Gezawa'),
(387, 20, 'Gwale'),
(388, 20, 'Gwarzo'),
(389, 20, 'Kabo'),
(390, 20, 'Kano Municipal'),
(391, 20, 'Karaye'),
(392, 20, 'Kibiya'),
(393, 20, 'Kiru'),
(394, 20, 'Kumbotso'),
(395, 20, 'Kunchi'),
(396, 20, 'Kura'),
(397, 20, 'Madobi'),
(398, 20, 'Makoda'),
(399, 20, 'Minjibir'),
(400, 20, 'Nasarawa'),
(401, 20, 'Rano'),
(402, 20, 'Rimin Gado'),
(403, 20, 'Rogo'),
(404, 20, 'Shanono'),
(405, 20, 'Sumaila'),
(406, 20, 'Takai'),
(407, 20, 'Tarauni'),
(408, 20, 'Tofa'),
(409, 20, 'Tsanyawa'),
(410, 20, 'Tudun Wada'),
(411, 20, 'Ungogo'),
(412, 20, 'Warawa'),
(413, 20, 'Wudil'),
(414, 21, 'Bakori'),
(415, 21, 'Batagarawa'),
(416, 21, 'Batsari'),
(417, 21, 'Baure'),
(418, 21, 'Bindawa'),
(419, 21, 'Charanchi'),
(420, 21, 'Dandume'),
(421, 21, 'Danja'),
(422, 21, 'Dan Musa'),
(423, 21, 'Daura'),
(424, 21, 'Dutsi'),
(425, 21, 'Dutsin Ma'),
(426, 21, 'Faskari'),
(427, 21, 'Funtua'),
(428, 21, 'Ingawa'),
(429, 21, 'Jibia'),
(430, 21, 'Kafur'),
(431, 21, 'Kaita'),
(432, 21, 'Kankara'),
(433, 21, 'Kankia'),
(434, 21, 'Katsina'),
(435, 21, 'Kurfi'),
(436, 21, 'Kusada'),
(437, 21, 'Mai\'Adua'),
(438, 21, 'Malumfashi'),
(439, 21, 'Mani'),
(440, 21, 'Mashi'),
(441, 21, 'Matazu'),
(442, 21, 'Musawa'),
(443, 21, 'Rimi'),
(444, 21, 'Sabuwa'),
(445, 21, 'Safana'),
(446, 21, 'Sandamu'),
(447, 21, 'Zango'),
(448, 22, 'Aleiro'),
(449, 22, 'Arewa Dandi'),
(450, 22, 'Argungu'),
(451, 22, 'Augie'),
(452, 22, 'Bagudo'),
(453, 22, 'Birnin Kebbi'),
(454, 22, 'Bunza'),
(455, 22, 'Dandi'),
(456, 22, 'Fakai'),
(457, 22, 'Gwandu'),
(458, 22, 'Jega'),
(459, 22, 'Kalgo'),
(460, 22, 'Koko/Besse'),
(461, 22, 'Maiyama'),
(462, 22, 'Ngaski'),
(463, 22, 'Sakaba'),
(464, 22, 'Shanga'),
(465, 22, 'Suru'),
(466, 22, 'Wasagu/Danko'),
(467, 22, 'Yauri'),
(468, 22, 'Zuru'),
(469, 23, 'Adavi'),
(470, 23, 'Ajaokuta'),
(471, 23, 'Ankpa'),
(472, 23, 'Bassa'),
(473, 23, 'Dekina'),
(474, 23, 'Ibaji'),
(475, 23, 'Idah'),
(476, 23, 'Igalamela Odolu'),
(477, 23, 'Ijumu'),
(478, 23, 'Kabba/Bunu'),
(479, 23, 'Kogi'),
(480, 23, 'Lokoja'),
(481, 23, 'Mopa Muro'),
(482, 23, 'Ofu'),
(483, 23, 'Ogori/Magongo'),
(484, 23, 'Okehi'),
(485, 23, 'Okene'),
(486, 23, 'Olamaboro'),
(487, 23, 'Omala'),
(488, 23, 'Yagba East'),
(489, 23, 'Yagba West'),
(490, 24, 'Asa'),
(491, 24, 'Baruten'),
(492, 24, 'Edu'),
(493, 24, 'Ekiti, Kwara State'),
(494, 24, 'Ifelodun'),
(495, 24, 'Ilorin East'),
(496, 24, 'Ilorin South'),
(497, 24, 'Ilorin West'),
(498, 24, 'Irepodun'),
(499, 24, 'Isin'),
(500, 24, 'Kaiama'),
(501, 24, 'Moro'),
(502, 24, 'Offa'),
(503, 24, 'Oke Ero'),
(504, 24, 'Oyun'),
(505, 24, 'Pategi'),
(506, 25, 'Agege'),
(507, 25, 'Ajeromi-Ifelodun'),
(508, 25, 'Alimosho'),
(509, 25, 'Amuwo-Odofin'),
(510, 25, 'Apapa'),
(511, 25, 'Badagry'),
(512, 25, 'Epe'),
(513, 25, 'Eti Osa'),
(514, 25, 'Ibeju-Lekki'),
(515, 25, 'Ifako-Ijaiye'),
(516, 25, 'Ikeja'),
(517, 25, 'Ikorodu'),
(518, 25, 'Kosofe'),
(519, 25, 'Lagos Island'),
(520, 25, 'Lagos Mainland'),
(521, 25, 'Mushin'),
(522, 25, 'Ojo'),
(523, 25, 'Oshodi-Isolo'),
(524, 25, 'Shomolu'),
(525, 25, 'Surulere, Lagos State'),
(526, 26, 'Akwanga'),
(527, 26, 'Awe'),
(528, 26, 'Doma'),
(529, 26, 'Karu'),
(530, 26, 'Keana'),
(531, 26, 'Keffi'),
(532, 26, 'Kokona'),
(533, 26, 'Lafia'),
(534, 26, 'Nasarawa'),
(535, 26, 'Nasarawa Egon'),
(536, 26, 'Obi'),
(537, 26, 'Toto'),
(538, 26, 'Wamba'),
(539, 27, 'Agaie'),
(540, 27, 'Agwara'),
(541, 27, 'Bida'),
(542, 27, 'Borgu'),
(543, 27, 'Bosso'),
(544, 27, 'Chanchaga'),
(545, 27, 'Edati'),
(546, 27, 'Gbako'),
(547, 27, 'Gurara'),
(548, 27, 'Katcha'),
(549, 27, 'Kontagora'),
(550, 27, 'Lapai'),
(551, 27, 'Lavun'),
(552, 27, 'Magama'),
(553, 27, 'Mariga'),
(554, 27, 'Mashegu'),
(555, 27, 'Mokwa'),
(556, 27, 'Moya'),
(557, 27, 'Paikoro'),
(558, 27, 'Rafi'),
(559, 27, 'Rijau'),
(560, 27, 'Shiroro'),
(561, 27, 'Suleja'),
(562, 27, 'Tafa'),
(563, 27, 'Wushishi'),
(564, 28, 'Abeokuta North'),
(565, 28, 'Abeokuta South'),
(566, 28, 'Ado-Odo/Ota'),
(567, 28, 'Egbado North'),
(568, 28, 'Egbado South'),
(569, 28, 'Ewekoro'),
(570, 28, 'Ifo'),
(571, 28, 'Ijebu East'),
(572, 28, 'Ijebu North'),
(573, 28, 'Ijebu North East'),
(574, 28, 'Ijebu Ode'),
(575, 28, 'Ikenne'),
(576, 28, 'Imeko Afon'),
(577, 28, 'Ipokia'),
(578, 28, 'Obafemi Owode'),
(579, 28, 'Odeda'),
(580, 28, 'Odogbolu'),
(581, 28, 'Ogun Waterside'),
(582, 28, 'Remo North'),
(583, 28, 'Shagamu'),
(584, 29, 'Akoko North-East'),
(585, 29, 'Akoko North-West'),
(586, 29, 'Akoko South-West'),
(587, 29, 'Akoko South-East'),
(588, 29, 'Akure North'),
(589, 29, 'Akure South'),
(590, 29, 'Ese Odo'),
(591, 29, 'Idanre'),
(592, 29, 'Ifedore'),
(593, 29, 'Ilaje'),
(594, 29, 'Ile Oluji/Okeigbo'),
(595, 29, 'Irele'),
(596, 29, 'Odigbo'),
(597, 29, 'Okitipupa'),
(598, 29, 'Ondo East'),
(599, 29, 'Ondo West'),
(600, 29, 'Ose'),
(601, 29, 'Owo'),
(602, 30, 'Atakunmosa East'),
(603, 30, 'Atakunmosa West'),
(604, 30, 'Aiyedaade'),
(605, 30, 'Aiyedire'),
(606, 30, 'Boluwaduro'),
(607, 30, 'Boripe'),
(608, 30, 'Ede North'),
(609, 30, 'Ede South'),
(610, 30, 'Ife Central'),
(611, 30, 'Ife East'),
(612, 30, 'Ife North'),
(613, 30, 'Ife South'),
(614, 30, 'Egbedore'),
(615, 30, 'Ejigbo'),
(616, 30, 'Ifedayo'),
(617, 30, 'Ifelodun'),
(618, 30, 'Ila'),
(619, 30, 'Ilesa East'),
(620, 30, 'Ilesa West'),
(621, 30, 'Irepodun'),
(622, 30, 'Irewole'),
(623, 30, 'Isokan'),
(624, 30, 'Iwo'),
(625, 30, 'Obokun'),
(626, 30, 'Odo Otin'),
(627, 30, 'Ola Oluwa'),
(628, 30, 'Olorunda'),
(629, 30, 'Oriade'),
(630, 30, 'Orolu'),
(631, 30, 'Osogbo'),
(632, 31, 'Afijio'),
(633, 31, 'Akinyele'),
(634, 31, 'Atiba'),
(635, 31, 'Atisbo'),
(636, 31, 'Egbeda'),
(637, 31, 'Ibadan North'),
(638, 31, 'Ibadan North-East'),
(639, 31, 'Ibadan North-West'),
(640, 31, 'Ibadan South-East'),
(641, 31, 'Ibadan South-West'),
(642, 31, 'Ibarapa Central'),
(643, 31, 'Ibarapa East'),
(644, 31, 'Ibarapa North'),
(645, 31, 'Ido'),
(646, 31, 'Irepo'),
(647, 31, 'Iseyin'),
(648, 31, 'Itesiwaju'),
(649, 31, 'Iwajowa'),
(650, 31, 'Kajola'),
(651, 31, 'Lagelu'),
(652, 31, 'Ogbomosho North'),
(653, 31, 'Ogbomosho South'),
(654, 31, 'Ogo Oluwa'),
(655, 31, 'Olorunsogo'),
(656, 31, 'Oluyole'),
(657, 31, 'Ona Ara'),
(658, 31, 'Orelope'),
(659, 31, 'Ori Ire'),
(660, 31, 'Oyo'),
(661, 31, 'Oyo East'),
(662, 31, 'Saki East'),
(663, 31, 'Saki West'),
(664, 31, 'Surulere, Oyo State'),
(665, 32, 'Bokkos'),
(666, 32, 'Barkin Ladi'),
(667, 32, 'Bassa'),
(668, 32, 'Jos East'),
(669, 32, 'Jos North'),
(670, 32, 'Jos South'),
(671, 32, 'Kanam'),
(672, 32, 'Kanke'),
(673, 32, 'Langtang South'),
(674, 32, 'Langtang North'),
(675, 32, 'Mangu'),
(676, 32, 'Mikang'),
(677, 32, 'Pankshin'),
(678, 32, 'Qua\'an Pan'),
(679, 32, 'Riyom'),
(680, 32, 'Shendam'),
(681, 32, 'Wase'),
(682, 33, 'Abua/Odual'),
(683, 33, 'Ahoada East'),
(684, 33, 'Ahoada West'),
(685, 33, 'Akuku-Toru'),
(686, 33, 'Andoni'),
(687, 33, 'Asari-Toru'),
(688, 33, 'Bonny'),
(689, 33, 'Degema'),
(690, 33, 'Eleme'),
(691, 33, 'Emuoha'),
(692, 33, 'Etche'),
(693, 33, 'Gokana'),
(694, 33, 'Ikwerre'),
(695, 33, 'Khana'),
(696, 33, 'Obio/Akpor'),
(697, 33, 'Ogba/Egbema/Ndoni'),
(698, 33, 'Ogu/Bolo'),
(699, 33, 'Okrika'),
(700, 33, 'Omuma'),
(701, 33, 'Opobo/Nkoro'),
(702, 33, 'Oyigbo'),
(703, 33, 'Port Harcourt'),
(704, 33, 'Tai'),
(705, 34, 'Binji'),
(706, 34, 'Bodinga'),
(707, 34, 'Dange Shuni'),
(708, 34, 'Gada'),
(709, 34, 'Goronyo'),
(710, 34, 'Gudu'),
(711, 34, 'Gwadabawa'),
(712, 34, 'Illela'),
(713, 34, 'Isa'),
(714, 34, 'Kebbe'),
(715, 34, 'Kware'),
(716, 34, 'Rabah'),
(717, 34, 'Sabon Birni'),
(718, 34, 'Shagari'),
(719, 34, 'Silame'),
(720, 34, 'Sokoto North'),
(721, 34, 'Sokoto South'),
(722, 34, 'Tambuwal'),
(723, 34, 'Tangaza'),
(724, 34, 'Tureta'),
(725, 34, 'Wamako'),
(726, 34, 'Wurno'),
(727, 34, 'Yabo'),
(728, 35, 'Ardo Kola'),
(729, 35, 'Bali'),
(730, 35, 'Donga'),
(731, 35, 'Gashaka'),
(732, 35, 'Gassol'),
(733, 35, 'Ibi'),
(734, 35, 'Jalingo'),
(735, 35, 'Karim Lamido'),
(736, 35, 'Kumi'),
(737, 35, 'Lau'),
(738, 35, 'Sardauna'),
(739, 35, 'Takum'),
(740, 35, 'Ussa'),
(741, 35, 'Wukari'),
(742, 35, 'Yorro'),
(743, 35, 'Zing'),
(744, 36, 'Bade'),
(745, 36, 'Bursari'),
(746, 36, 'Damaturu'),
(747, 36, 'Fika'),
(748, 36, 'Fune'),
(749, 36, 'Geidam'),
(750, 36, 'Gujba'),
(751, 36, 'Gulani'),
(752, 36, 'Jakusko'),
(753, 36, 'Karasuwa'),
(754, 36, 'Machina'),
(755, 36, 'Nangere'),
(756, 36, 'Nguru'),
(757, 36, 'Potiskum'),
(758, 36, 'Tarmuwa'),
(759, 36, 'Yunusari'),
(760, 36, 'Yusufari'),
(761, 37, 'Anka'),
(762, 37, 'Bakura'),
(763, 37, 'Birnin Magaji/Kiyaw'),
(764, 37, 'Bukkuyum'),
(765, 37, 'Bungudu'),
(766, 37, 'Gummi'),
(767, 37, 'Gusau'),
(768, 37, 'Kaura Namoda'),
(769, 37, 'Maradun'),
(770, 37, 'Maru'),
(771, 37, 'Shinkafi'),
(772, 37, 'Talata Mafara'),
(773, 37, 'Chafe'),
(774, 37, 'Zurmi');

-- --------------------------------------------------------

--
-- Table structure for table `make`
--

CREATE TABLE `make` (
  `id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL DEFAULT '',
  `title` varchar(55) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `make`
--

INSERT INTO `make` (`id`, `code`, `title`, `created_at`, `updated_at`) VALUES
(1, 'ACURA', 'Acura', '2024-06-09 01:39:05', NULL),
(2, 'ALFA', 'Alfa Romeo', '2024-06-09 01:39:05', NULL),
(3, 'AMC', 'AMC', '2024-06-09 01:39:05', NULL),
(4, 'ASTON', 'Aston Martin', '2024-06-09 01:39:05', NULL),
(5, 'AUDI', 'Audi', '2024-06-09 01:39:05', NULL),
(6, 'AVANTI', 'Avanti', '2024-06-09 01:39:05', NULL),
(7, 'BENTL', 'Bentley', '2024-06-09 01:39:05', NULL),
(8, 'BMW', 'BMW', '2024-06-09 01:39:05', NULL),
(9, 'BUICK', 'Buick', '2024-06-09 01:39:05', NULL),
(10, 'CAD', 'Cadillac', '2024-06-09 01:39:05', NULL),
(11, 'CHEV', 'Chevrolet', '2024-06-09 01:39:05', NULL),
(12, 'CHRY', 'Chrysler', '2024-06-09 01:39:05', NULL),
(13, 'DAEW', 'Daewoo', '2024-06-09 01:39:05', NULL),
(14, 'DAIHAT', 'Daihatsu', '2024-06-09 01:39:05', NULL),
(15, 'DATSUN', 'Datsun', '2024-06-09 01:39:05', NULL),
(16, 'DELOREAN', 'DeLorean', '2024-06-09 01:39:05', NULL),
(17, 'DODGE', 'Dodge', '2024-06-09 01:39:05', NULL),
(18, 'EAGLE', 'Eagle', '2024-06-09 01:39:05', NULL),
(19, 'FER', 'Ferrari', '2024-06-09 01:39:05', NULL),
(20, 'FIAT', 'FIAT', '2024-06-09 01:39:05', NULL),
(21, 'FISK', 'Fisker', '2024-06-09 01:39:05', NULL),
(22, 'FORD', 'Ford', '2024-06-09 01:39:05', NULL),
(23, 'FREIGHT', 'Freightliner', '2024-06-09 01:39:05', NULL),
(24, 'GEO', 'Geo', '2024-06-09 01:39:05', NULL),
(25, 'GMC', 'GMC', '2024-06-09 01:39:05', NULL),
(26, 'HONDA', 'Honda', '2024-06-09 01:39:05', NULL),
(27, 'AMGEN', 'HUMMER', '2024-06-09 01:39:05', NULL),
(28, 'HYUND', 'Hyundai', '2024-06-09 01:39:05', NULL),
(29, 'INFIN', 'Infiniti', '2024-06-09 01:39:05', NULL),
(30, 'ISU', 'Isuzu', '2024-06-09 01:39:05', NULL),
(31, 'JAG', 'Jaguar', '2024-06-09 01:39:05', NULL),
(32, 'JEEP', 'Jeep', '2024-06-09 01:39:05', NULL),
(33, 'KIA', 'Kia', '2024-06-09 01:39:05', NULL),
(34, 'LAM', 'Lamborghini', '2024-06-09 01:39:05', NULL),
(35, 'LAN', 'Lancia', '2024-06-09 01:39:05', NULL),
(36, 'ROV', 'Land Rover', '2024-06-09 01:39:05', NULL),
(37, 'LEXUS', 'Lexus', '2024-06-09 01:39:05', NULL),
(38, 'LINC', 'Lincoln', '2024-06-09 01:39:05', NULL),
(39, 'LOTUS', 'Lotus', '2024-06-09 01:39:05', NULL),
(40, 'MAS', 'Maserati', '2024-06-09 01:39:05', NULL),
(41, 'MAYBACH', 'Maybach', '2024-06-09 01:39:05', NULL),
(42, 'MAZDA', 'Mazda', '2024-06-09 01:39:05', NULL),
(43, 'MCLAREN', 'McLaren', '2024-06-09 01:39:05', NULL),
(44, 'MB', 'Mercedes-Benz', '2024-06-09 01:39:05', NULL),
(45, 'MERC', 'Mercury', '2024-06-09 01:39:05', NULL),
(46, 'MERKUR', 'Merkur', '2024-06-09 01:39:05', NULL),
(47, 'MINI', 'MINI', '2024-06-09 01:39:05', NULL),
(48, 'MIT', 'Mitsubishi', '2024-06-09 01:39:05', NULL),
(49, 'NISSAN', 'Nissan', '2024-06-09 01:39:05', NULL),
(50, 'OLDS', 'Oldsmobile', '2024-06-09 01:39:05', NULL),
(51, 'PEUG', 'Peugeot', '2024-06-09 01:39:05', NULL),
(52, 'PLYM', 'Plymouth', '2024-06-09 01:39:05', NULL),
(53, 'PONT', 'Pontiac', '2024-06-09 01:39:05', NULL),
(54, 'POR', 'Porsche', '2024-06-09 01:39:05', NULL),
(55, 'RAM', 'RAM', '2024-06-09 01:39:05', NULL),
(56, 'REN', 'Renault', '2024-06-09 01:39:05', NULL),
(57, 'RR', 'Rolls-Royce', '2024-06-09 01:39:05', NULL),
(58, 'SAAB', 'Saab', '2024-06-09 01:39:05', NULL),
(59, 'SATURN', 'Saturn', '2024-06-09 01:39:05', NULL),
(60, 'SCION', 'Scion', '2024-06-09 01:39:05', NULL),
(61, 'SMART', 'smart', '2024-06-09 01:39:05', NULL),
(62, 'SRT', 'SRT', '2024-06-09 01:39:05', NULL),
(63, 'STERL', 'Sterling', '2024-06-09 01:39:05', NULL),
(64, 'SUB', 'Subaru', '2024-06-09 01:39:05', NULL),
(65, 'SUZUKI', 'Suzuki', '2024-06-09 01:39:05', NULL),
(66, 'TESLA', 'Tesla', '2024-06-09 01:39:05', NULL),
(67, 'TOYOTA', 'Toyota', '2024-06-09 01:39:05', NULL),
(68, 'TRI', 'Triumph', '2024-06-09 01:39:05', NULL),
(69, 'VOLKS', 'Volkswagen', '2024-06-09 01:39:05', NULL),
(70, 'VOLVO', 'Volvo', '2024-06-09 01:39:05', NULL),
(71, 'YUGO', 'Yugo', '2024-06-09 01:39:05', NULL),
(72, 'My My My My', 'My My My My', '2024-06-09 01:39:22', '2024-06-09 01:39:22'),
(73, 'My My My My', 'My My My My', '2024-06-09 01:40:18', '2024-06-09 01:40:18');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `product_id`, `vendor_id`, `user_id`, `message`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'No, I am still expecting more next week', 1, '2023-03-01 16:15:31', '2023-03-01 16:15:31'),
(2, 1, 3, 3, 'ummm, not bad at that price', 1, '2023-04-24 06:39:52', '2023-04-24 06:39:52'),
(3, 1, 3, 3, 'how much last', 1, '2023-04-24 06:40:32', '2023-04-24 06:40:32'),
(4, 1, 3, 3, 'I will be waiting for your response', 1, '2023-04-24 06:40:48', '2023-04-24 06:40:48'),
(5, 1, 3, 3, 'how much last?', 1, '2023-04-25 21:40:37', '2023-04-25 21:40:37'),
(6, 1, 3, 3, 'test', 1, '2023-04-25 21:43:01', '2023-04-25 21:43:01'),
(7, 2, 3, 3, 'nice 1', 1, '2023-04-28 13:41:46', '2023-04-28 13:41:46'),
(8, 3, 3, 3, 'hmmm, this is good', 1, '2023-04-28 13:56:49', '2023-04-28 13:56:49'),
(9, 5, 3, 3, 'test comment', 1, '2023-04-28 14:07:16', '2023-04-28 14:07:16'),
(10, 5, 3, 3, 'good', 1, '2023-04-28 14:08:22', '2023-04-28 14:08:22'),
(11, 5, 3, 3, 'testing with another comment', 1, '2023-04-28 14:12:30', '2023-04-28 14:12:30'),
(12, 13, 3, 13, 'nice ride', 1, '2023-05-17 03:14:27', '2023-05-17 03:14:27'),
(13, 17, 13, 4, 'my comment', 1, '2023-06-20 03:51:27', '2023-06-20 03:51:27'),
(14, 1, 4, 24, 'test', 1, '2023-10-13 22:36:00', '2023-10-13 22:36:00'),
(15, 31, 25, 24, 'Hello', 1, '2023-10-17 12:47:53', '2023-10-17 12:47:53'),
(16, 29, 24, 24, 'This is very very cool', 1, '2023-10-18 08:03:50', '2023-10-18 08:03:50'),
(17, 2, 3, 26, 'Nice one boss', 1, '2023-10-18 12:17:11', '2023-10-18 12:17:11'),
(18, 5, 3, 24, 'This is very very cool', 1, '2023-11-02 16:04:39', '2023-11-02 16:04:39'),
(19, 51, 24, 24, 'TestHhhsjsjsh', 1, '2023-11-08 11:45:52', '2023-11-08 11:45:52'),
(20, 51, 24, 24, 'Test hshashs', 1, '2023-11-08 11:46:18', '2023-11-08 11:46:18'),
(21, 37, 24, 24, 'Wow, this is very nice', 1, '2023-11-24 10:57:38', '2023-11-24 10:57:38'),
(22, 60, 28, 28, 'Hi, is this still available', 1, '2024-05-29 22:09:19', '2024-05-29 22:09:19'),
(23, 71, 28, 28, 'Yeah, you can come down to the office for test drive', 1, '2024-05-29 22:22:09', '2024-05-31 03:19:14'),
(24, 71, 28, 28, 'Yeah, you can come down to the office for test drive', 1, '2024-05-30 04:11:58', '2024-05-30 04:11:58'),
(25, 75, 28, 28, 'Hello', 1, '2024-05-31 05:36:33', '2024-05-31 05:36:33'),
(26, 75, 28, 28, 'Can i talk to someone', 1, '2024-05-31 05:38:36', '2024-05-31 05:38:36'),
(27, 75, 28, 28, 'Asking to get more detail on this product', 1, '2024-05-31 05:39:58', '2024-05-31 05:39:58'),
(28, 75, 28, 28, 'Am coming down for inspection', 1, '2024-05-31 05:54:32', '2024-05-31 05:54:32'),
(29, 76, 28, 28, 'I like this', 1, '2024-06-01 01:36:45', '2024-06-01 01:36:45'),
(30, 76, 28, 28, 'Hello', 1, '2024-06-05 01:12:44', '2024-06-05 01:12:44'),
(31, 72, 28, 28, 'Can i talk to someone', 1, '2024-06-05 01:13:40', '2024-06-05 01:13:40'),
(32, 56, 24, 28, 'Can i talk to someone', 1, '2024-06-05 05:08:31', '2024-06-05 05:08:31'),
(33, 56, 24, 28, 'DAV YOU THERE', 1, '2024-06-05 05:09:27', '2024-06-05 05:09:27'),
(34, 98, 28, 28, 'Hi ghklh yukj', 1, '2024-06-09 00:10:35', '2024-06-09 00:10:35'),
(35, 95, 28, 28, 'Bad red car', 1, '2024-06-11 03:08:55', '2024-06-11 03:08:55'),
(36, 74, 28, 28, 'What a nice car', 1, '2024-06-19 21:43:29', '2024-06-19 21:43:29'),
(37, 103, 28, 28, 'Bad Car', 1, '2024-07-03 03:04:10', '2024-07-03 03:04:10'),
(38, 77, 28, 28, 'Lets go driving', 1, '2024-07-03 23:42:31', '2024-07-03 23:42:31'),
(39, 106, 28, 28, 'Great Ride', 1, '2024-07-05 01:41:39', '2024-07-05 01:41:39');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2014_10_12_200000_add_two_factor_columns_to_users_table', 2),
(6, '2022_11_16_165824_create_sessions_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `model`
--

CREATE TABLE `model` (
  `id` int(11) NOT NULL,
  `make_id` int(11) NOT NULL DEFAULT 0,
  `code` varchar(125) NOT NULL DEFAULT '',
  `title` varchar(125) NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model`
--

INSERT INTO `model` (`id`, `make_id`, `code`, `title`, `created_at`, `updated_at`) VALUES
(1, 1, 'CL_MODELS', 'CL Models (4)', '2024-06-09 01:40:10', NULL),
(2, 1, '2.2CL', ' - 2.2CL', '2024-06-09 01:40:10', NULL),
(3, 1, '2.3CL', ' - 2.3CL', '2024-06-09 01:40:10', NULL),
(4, 1, '3.0CL', ' - 3.0CL', '2024-06-09 01:40:10', NULL),
(5, 1, '3.2CL', ' - 3.2CL', '2024-06-09 01:40:10', NULL),
(6, 1, 'ILX', 'ILX', '2024-06-09 01:40:10', NULL),
(7, 1, 'INTEG', 'Integra', '2024-06-09 01:40:10', NULL),
(8, 1, 'LEGEND', 'Legend', '2024-06-09 01:40:10', NULL),
(9, 1, 'MDX', 'MDX', '2024-06-09 01:40:10', NULL),
(10, 1, 'NSX', 'NSX', '2024-06-09 01:40:10', NULL),
(11, 1, 'RDX', 'RDX', '2024-06-09 01:40:10', NULL),
(12, 1, 'RL_MODELS', 'RL Models (2)', '2024-06-09 01:40:10', NULL),
(13, 1, '3.5RL', ' - 3.5 RL', '2024-06-09 01:40:10', NULL),
(14, 1, 'RL', ' - RL', '2024-06-09 01:40:10', NULL),
(15, 1, 'RSX', 'RSX', '2024-06-09 01:40:10', NULL),
(16, 1, 'SLX', 'SLX', '2024-06-09 01:40:10', NULL),
(17, 1, 'TL_MODELS', 'TL Models (3)', '2024-06-09 01:40:10', NULL),
(18, 1, '2.5TL', ' - 2.5TL', '2024-06-09 01:40:10', NULL),
(19, 1, '3.2TL', ' - 3.2TL', '2024-06-09 01:40:10', NULL),
(20, 1, 'TL', ' - TL', '2024-06-09 01:40:10', NULL),
(21, 1, 'TSX', 'TSX', '2024-06-09 01:40:10', NULL),
(22, 1, 'VIGOR', 'Vigor', '2024-06-09 01:40:10', NULL),
(23, 1, 'ZDX', 'ZDX', '2024-06-09 01:40:10', NULL),
(24, 1, 'ACUOTH', 'Other Acura Models', '2024-06-09 01:40:10', NULL),
(25, 2, 'ALFA164', '164', '2024-06-09 01:40:10', NULL),
(26, 2, 'ALFA8C', '8C Competizione', '2024-06-09 01:40:10', NULL),
(27, 2, 'ALFAGT', 'GTV-6', '2024-06-09 01:40:10', NULL),
(28, 2, 'MIL', 'Milano', '2024-06-09 01:40:10', NULL),
(29, 2, 'SPID', 'Spider', '2024-06-09 01:40:10', NULL),
(30, 2, 'ALFAOTH', 'Other Alfa Romeo Models', '2024-06-09 01:40:10', NULL),
(31, 3, 'AMCALLIAN', 'Alliance', '2024-06-09 01:40:10', NULL),
(32, 3, 'CON', 'Concord', '2024-06-09 01:40:10', NULL),
(33, 3, 'EAGLE', 'Eagle', '2024-06-09 01:40:10', NULL),
(34, 3, 'AMCENC', 'Encore', '2024-06-09 01:40:10', NULL),
(35, 3, 'AMCSPIRIT', 'Spirit', '2024-06-09 01:40:10', NULL),
(36, 3, 'AMCOTH', 'Other AMC Models', '2024-06-09 01:40:10', NULL),
(37, 4, 'DB7', 'DB7', '2024-06-09 01:40:10', NULL),
(38, 4, 'DB9', 'DB9', '2024-06-09 01:40:10', NULL),
(39, 4, 'DBS', 'DBS', '2024-06-09 01:40:10', NULL),
(40, 4, 'LAGONDA', 'Lagonda', '2024-06-09 01:40:10', NULL),
(41, 4, 'RAPIDE', 'Rapide', '2024-06-09 01:40:10', NULL),
(42, 4, 'V12VANT', 'V12 Vantage', '2024-06-09 01:40:10', NULL),
(43, 4, 'VANTAGE', 'V8 Vantage', '2024-06-09 01:40:10', NULL),
(44, 4, 'VANQUISH', 'Vanquish', '2024-06-09 01:40:10', NULL),
(45, 4, 'VIRAGE', 'Virage', '2024-06-09 01:40:10', NULL),
(46, 4, 'UNAVAILAST', 'Other Aston Martin Models', '2024-06-09 01:40:10', NULL),
(47, 5, 'AUDI100', '100', '2024-06-09 01:40:10', NULL),
(48, 5, 'AUDI200', '200', '2024-06-09 01:40:10', NULL),
(49, 5, '4000', '4000', '2024-06-09 01:40:10', NULL),
(50, 5, '5000', '5000', '2024-06-09 01:40:10', NULL),
(51, 5, '80', '80', '2024-06-09 01:40:10', NULL),
(52, 5, '90', '90', '2024-06-09 01:40:10', NULL),
(53, 5, 'A3', 'A3', '2024-06-09 01:40:10', NULL),
(54, 5, 'A4', 'A4', '2024-06-09 01:40:10', NULL),
(55, 5, 'A5', 'A5', '2024-06-09 01:40:10', NULL),
(56, 5, 'A6', 'A6', '2024-06-09 01:40:10', NULL),
(57, 5, 'A7', 'A7', '2024-06-09 01:40:10', NULL),
(58, 5, 'A8', 'A8', '2024-06-09 01:40:10', NULL),
(59, 5, 'ALLRDQUA', 'allroad', '2024-06-09 01:40:10', NULL),
(60, 5, 'AUDICABRI', 'Cabriolet', '2024-06-09 01:40:10', NULL),
(61, 5, 'AUDICOUPE', 'Coupe', '2024-06-09 01:40:10', NULL),
(62, 5, 'Q3', 'Q3', '2024-06-09 01:40:10', NULL),
(63, 5, 'Q5', 'Q5', '2024-06-09 01:40:10', NULL),
(64, 5, 'Q7', 'Q7', '2024-06-09 01:40:10', NULL),
(65, 5, 'QUATTR', 'Quattro', '2024-06-09 01:40:10', NULL),
(66, 5, 'R8', 'R8', '2024-06-09 01:40:10', NULL),
(67, 5, 'RS4', 'RS 4', '2024-06-09 01:40:10', NULL),
(68, 5, 'RS5', 'RS 5', '2024-06-09 01:40:10', NULL),
(69, 5, 'RS6', 'RS 6', '2024-06-09 01:40:10', NULL),
(70, 5, 'S4', 'S4', '2024-06-09 01:40:10', NULL),
(71, 5, 'S5', 'S5', '2024-06-09 01:40:10', NULL),
(72, 5, 'S6', 'S6', '2024-06-09 01:40:10', NULL),
(73, 5, 'S7', 'S7', '2024-06-09 01:40:10', NULL),
(74, 5, 'S8', 'S8', '2024-06-09 01:40:10', NULL),
(75, 5, 'TT', 'TT', '2024-06-09 01:40:10', NULL),
(76, 5, 'TTRS', 'TT RS', '2024-06-09 01:40:10', NULL),
(77, 5, 'TTS', 'TTS', '2024-06-09 01:40:10', NULL),
(78, 5, 'V8', 'V8 Quattro', '2024-06-09 01:40:10', NULL),
(79, 5, 'AUDOTH', 'Other Audi Models', '2024-06-09 01:40:10', NULL),
(80, 6, 'CONVERT', 'Convertible', '2024-06-09 01:40:10', NULL),
(81, 6, 'COUPEAVANT', 'Coupe', '2024-06-09 01:40:10', NULL),
(82, 6, 'SEDAN', 'Sedan', '2024-06-09 01:40:10', NULL),
(83, 6, 'UNAVAILAVA', 'Other Avanti Models', '2024-06-09 01:40:10', NULL),
(84, 7, 'ARNAGE', 'Arnage', '2024-06-09 01:40:10', NULL),
(85, 7, 'AZURE', 'Azure', '2024-06-09 01:40:10', NULL),
(86, 7, 'BROOKLANDS', 'Brooklands', '2024-06-09 01:40:10', NULL),
(87, 7, 'BENCONT', 'Continental', '2024-06-09 01:40:10', NULL),
(88, 7, 'CORNICHE', 'Corniche', '2024-06-09 01:40:10', NULL),
(89, 7, 'BENEIGHT', 'Eight', '2024-06-09 01:40:10', NULL),
(90, 7, 'BENMUL', 'Mulsanne', '2024-06-09 01:40:10', NULL),
(91, 7, 'BENTURBO', 'Turbo R', '2024-06-09 01:40:10', NULL),
(92, 7, 'UNAVAILBEN', 'Other Bentley Models', '2024-06-09 01:40:10', NULL),
(93, 8, '1_SERIES', '1 Series (3)', '2024-06-09 01:40:10', NULL),
(94, 8, '128I', ' - 128i', '2024-06-09 01:40:10', NULL),
(95, 8, '135I', ' - 135i', '2024-06-09 01:40:10', NULL),
(96, 8, '135IS', ' - 135is', '2024-06-09 01:40:10', NULL),
(97, 8, '3_SERIES', '3 Series (29)', '2024-06-09 01:40:10', NULL),
(98, 8, '318I', ' - 318i', '2024-06-09 01:40:10', NULL),
(99, 8, '318IC', ' - 318iC', '2024-06-09 01:40:10', NULL),
(100, 8, '318IS', ' - 318iS', '2024-06-09 01:40:10', NULL),
(101, 8, '318TI', ' - 318ti', '2024-06-09 01:40:10', NULL),
(102, 8, '320I', ' - 320i', '2024-06-09 01:40:10', NULL),
(103, 8, '323CI', ' - 323ci', '2024-06-09 01:40:10', NULL),
(104, 8, '323I', ' - 323i', '2024-06-09 01:40:10', NULL),
(105, 8, '323IS', ' - 323is', '2024-06-09 01:40:10', NULL),
(106, 8, '323IT', ' - 323iT', '2024-06-09 01:40:10', NULL),
(107, 8, '325CI', ' - 325Ci', '2024-06-09 01:40:10', NULL),
(108, 8, '325E', ' - 325e', '2024-06-09 01:40:10', NULL),
(109, 8, '325ES', ' - 325es', '2024-06-09 01:40:10', NULL),
(110, 8, '325I', ' - 325i', '2024-06-09 01:40:10', NULL),
(111, 8, '325IS', ' - 325is', '2024-06-09 01:40:10', NULL),
(112, 8, '325IX', ' - 325iX', '2024-06-09 01:40:10', NULL),
(113, 8, '325XI', ' - 325xi', '2024-06-09 01:40:10', NULL),
(114, 8, '328CI', ' - 328Ci', '2024-06-09 01:40:10', NULL),
(115, 8, '328I', ' - 328i', '2024-06-09 01:40:10', NULL),
(116, 8, '328IS', ' - 328iS', '2024-06-09 01:40:10', NULL),
(117, 8, '328XI', ' - 328xi', '2024-06-09 01:40:10', NULL),
(118, 8, '330CI', ' - 330Ci', '2024-06-09 01:40:10', NULL),
(119, 8, '330I', ' - 330i', '2024-06-09 01:40:10', NULL),
(120, 8, '330XI', ' - 330xi', '2024-06-09 01:40:10', NULL),
(121, 8, '335D', ' - 335d', '2024-06-09 01:40:10', NULL),
(122, 8, '335I', ' - 335i', '2024-06-09 01:40:10', NULL),
(123, 8, '335IS', ' - 335is', '2024-06-09 01:40:10', NULL),
(124, 8, '335XI', ' - 335xi', '2024-06-09 01:40:10', NULL),
(125, 8, 'ACTIVE3', ' - ActiveHybrid 3', '2024-06-09 01:40:10', NULL),
(126, 8, 'BMW325', ' - 325', '2024-06-09 01:40:10', NULL),
(127, 8, '5_SERIES', '5 Series (19)', '2024-06-09 01:40:10', NULL),
(128, 8, '524TD', ' - 524td', '2024-06-09 01:40:10', NULL),
(129, 8, '525I', ' - 525i', '2024-06-09 01:40:10', NULL),
(130, 8, '525XI', ' - 525xi', '2024-06-09 01:40:10', NULL),
(131, 8, '528E', ' - 528e', '2024-06-09 01:40:10', NULL),
(132, 8, '528I', ' - 528i', '2024-06-09 01:40:10', NULL),
(133, 8, '528IT', ' - 528iT', '2024-06-09 01:40:10', NULL),
(134, 8, '528XI', ' - 528xi', '2024-06-09 01:40:10', NULL),
(135, 8, '530I', ' - 530i', '2024-06-09 01:40:10', NULL),
(136, 8, '530IT', ' - 530iT', '2024-06-09 01:40:10', NULL),
(137, 8, '530XI', ' - 530xi', '2024-06-09 01:40:10', NULL),
(138, 8, '533I', ' - 533i', '2024-06-09 01:40:10', NULL),
(139, 8, '535I', ' - 535i', '2024-06-09 01:40:10', NULL),
(140, 8, '535IGT', ' - 535i Gran Turismo', '2024-06-09 01:40:10', NULL),
(141, 8, '535XI', ' - 535xi', '2024-06-09 01:40:10', NULL),
(142, 8, '540I', ' - 540i', '2024-06-09 01:40:10', NULL),
(143, 8, '545I', ' - 545i', '2024-06-09 01:40:10', NULL),
(144, 8, '550I', ' - 550i', '2024-06-09 01:40:10', NULL),
(145, 8, '550IGT', ' - 550i Gran Turismo', '2024-06-09 01:40:10', NULL),
(146, 8, 'ACTIVE5', ' - ActiveHybrid 5', '2024-06-09 01:40:10', NULL),
(147, 8, '6_SERIES', '6 Series (8)', '2024-06-09 01:40:10', NULL),
(148, 8, '633CSI', ' - 633CSi', '2024-06-09 01:40:10', NULL),
(149, 8, '635CSI', ' - 635CSi', '2024-06-09 01:40:10', NULL),
(150, 8, '640I', ' - 640i', '2024-06-09 01:40:10', NULL),
(151, 8, '640IGC', ' - 640i Gran Coupe', '2024-06-09 01:40:10', NULL),
(152, 8, '645CI', ' - 645Ci', '2024-06-09 01:40:10', NULL),
(153, 8, '650I', ' - 650i', '2024-06-09 01:40:10', NULL),
(154, 8, '650IGC', ' - 650i Gran Coupe', '2024-06-09 01:40:10', NULL),
(155, 8, 'L6', ' - L6', '2024-06-09 01:40:10', NULL),
(156, 8, '7_SERIES', '7 Series (15)', '2024-06-09 01:40:10', NULL),
(157, 8, '733I', ' - 733i', '2024-06-09 01:40:10', NULL),
(158, 8, '735I', ' - 735i', '2024-06-09 01:40:10', NULL),
(159, 8, '735IL', ' - 735iL', '2024-06-09 01:40:10', NULL),
(160, 8, '740I', ' - 740i', '2024-06-09 01:40:10', NULL),
(161, 8, '740IL', ' - 740iL', '2024-06-09 01:40:10', NULL),
(162, 8, '740LI', ' - 740Li', '2024-06-09 01:40:10', NULL),
(163, 8, '745I', ' - 745i', '2024-06-09 01:40:10', NULL),
(164, 8, '745LI', ' - 745Li', '2024-06-09 01:40:10', NULL),
(165, 8, '750I', ' - 750i', '2024-06-09 01:40:10', NULL),
(166, 8, '750IL', ' - 750iL', '2024-06-09 01:40:10', NULL),
(167, 8, '750LI', ' - 750Li', '2024-06-09 01:40:10', NULL),
(168, 8, '760I', ' - 760i', '2024-06-09 01:40:10', NULL),
(169, 8, '760LI', ' - 760Li', '2024-06-09 01:40:10', NULL),
(170, 8, 'ACTIVE7', ' - ActiveHybrid 7', '2024-06-09 01:40:10', NULL),
(171, 8, 'ALPINAB7', ' - Alpina B7', '2024-06-09 01:40:10', NULL),
(172, 8, '8_SERIES', '8 Series (4)', '2024-06-09 01:40:10', NULL),
(173, 8, '840CI', ' - 840Ci', '2024-06-09 01:40:10', NULL),
(174, 8, '850CI', ' - 850Ci', '2024-06-09 01:40:10', NULL),
(175, 8, '850CSI', ' - 850CSi', '2024-06-09 01:40:10', NULL),
(176, 8, '850I', ' - 850i', '2024-06-09 01:40:10', NULL),
(177, 8, 'L_SERIES', 'L Series (1)', '2024-06-09 01:40:10', NULL),
(178, 8, 'L7', ' - L7', '2024-06-09 01:40:10', NULL),
(179, 8, 'M_SERIES', 'M Series (8)', '2024-06-09 01:40:10', NULL),
(180, 8, '1SERIESM', ' - 1 Series M', '2024-06-09 01:40:10', NULL),
(181, 8, 'BMWMCOUPE', ' - M Coupe', '2024-06-09 01:40:10', NULL),
(182, 8, 'BMWROAD', ' - M Roadster', '2024-06-09 01:40:10', NULL),
(183, 8, 'M3', ' - M3', '2024-06-09 01:40:10', NULL),
(184, 8, 'M5', ' - M5', '2024-06-09 01:40:10', NULL),
(185, 8, 'M6', ' - M6', '2024-06-09 01:40:10', NULL),
(186, 8, 'X5M', ' - X5 M', '2024-06-09 01:40:10', NULL),
(187, 8, 'X6M', ' - X6 M', '2024-06-09 01:40:10', NULL),
(188, 8, 'X_SERIES', 'X Series (5)', '2024-06-09 01:40:10', NULL),
(189, 8, 'ACTIVEX6', ' - ActiveHybrid X6', '2024-06-09 01:40:10', NULL),
(190, 8, 'X1', ' - X1', '2024-06-09 01:40:10', NULL),
(191, 8, 'X3', ' - X3', '2024-06-09 01:40:10', NULL),
(192, 8, 'X5', ' - X5', '2024-06-09 01:40:10', NULL),
(193, 8, 'X6', ' - X6', '2024-06-09 01:40:10', NULL),
(194, 8, 'Z_SERIES', 'Z Series (3)', '2024-06-09 01:40:10', NULL),
(195, 8, 'Z3', ' - Z3', '2024-06-09 01:40:10', NULL),
(196, 8, 'Z4', ' - Z4', '2024-06-09 01:40:10', NULL),
(197, 8, 'Z8', ' - Z8', '2024-06-09 01:40:10', NULL),
(198, 8, 'BMWOTH', 'Other BMW Models', '2024-06-09 01:40:10', NULL),
(199, 9, 'CENT', 'Century', '2024-06-09 01:40:10', NULL),
(200, 9, 'ELEC', 'Electra', '2024-06-09 01:40:10', NULL),
(201, 9, 'ENCLAVE', 'Enclave', '2024-06-09 01:40:10', NULL),
(202, 9, 'BUIENC', 'Encore', '2024-06-09 01:40:10', NULL),
(203, 9, 'LACROSSE', 'LaCrosse', '2024-06-09 01:40:10', NULL),
(204, 9, 'LESA', 'Le Sabre', '2024-06-09 01:40:10', NULL),
(205, 9, 'LUCERNE', 'Lucerne', '2024-06-09 01:40:10', NULL),
(206, 9, 'PARK', 'Park Avenue', '2024-06-09 01:40:10', NULL),
(207, 9, 'RAINIER', 'Rainier', '2024-06-09 01:40:10', NULL),
(208, 9, 'REATTA', 'Reatta', '2024-06-09 01:40:10', NULL),
(209, 9, 'REG', 'Regal', '2024-06-09 01:40:10', NULL),
(210, 9, 'RENDEZVOUS', 'Rendezvous', '2024-06-09 01:40:10', NULL),
(211, 9, 'RIV', 'Riviera', '2024-06-09 01:40:10', NULL),
(212, 9, 'BUICKROAD', 'Roadmaster', '2024-06-09 01:40:10', NULL),
(213, 9, 'SKYH', 'Skyhawk', '2024-06-09 01:40:10', NULL),
(214, 9, 'SKYL', 'Skylark', '2024-06-09 01:40:10', NULL),
(215, 9, 'SOMER', 'Somerset', '2024-06-09 01:40:10', NULL),
(216, 9, 'TERRAZA', 'Terraza', '2024-06-09 01:40:10', NULL),
(217, 9, 'BUVERANO', 'Verano', '2024-06-09 01:40:10', NULL),
(218, 9, 'BUOTH', 'Other Buick Models', '2024-06-09 01:40:10', NULL),
(219, 10, 'ALLANT', 'Allante', '2024-06-09 01:40:10', NULL),
(220, 10, 'ATS', 'ATS', '2024-06-09 01:40:10', NULL),
(221, 10, 'BROUGH', 'Brougham', '2024-06-09 01:40:10', NULL),
(222, 10, 'CATERA', 'Catera', '2024-06-09 01:40:10', NULL),
(223, 10, 'CIMA', 'Cimarron', '2024-06-09 01:40:10', NULL),
(224, 10, 'CTS', 'CTS', '2024-06-09 01:40:10', NULL),
(225, 10, 'DEV', 'De Ville', '2024-06-09 01:40:10', NULL),
(226, 10, 'DTS', 'DTS', '2024-06-09 01:40:10', NULL),
(227, 10, 'ELDO', 'Eldorado', '2024-06-09 01:40:10', NULL),
(228, 10, 'ESCALA', 'Escalade', '2024-06-09 01:40:10', NULL),
(229, 10, 'ESCALAESV', 'Escalade ESV', '2024-06-09 01:40:10', NULL),
(230, 10, 'EXT', 'Escalade EXT', '2024-06-09 01:40:10', NULL),
(231, 10, 'FLEE', 'Fleetwood', '2024-06-09 01:40:10', NULL),
(232, 10, 'SEV', 'Seville', '2024-06-09 01:40:10', NULL),
(233, 10, 'SRX', 'SRX', '2024-06-09 01:40:10', NULL),
(234, 10, 'STS', 'STS', '2024-06-09 01:40:10', NULL),
(235, 10, 'XLR', 'XLR', '2024-06-09 01:40:10', NULL),
(236, 10, 'XTS', 'XTS', '2024-06-09 01:40:10', NULL),
(237, 10, 'CADOTH', 'Other Cadillac Models', '2024-06-09 01:40:10', NULL),
(238, 11, 'ASTRO', 'Astro', '2024-06-09 01:40:10', NULL),
(239, 11, 'AVALNCH', 'Avalanche', '2024-06-09 01:40:10', NULL),
(240, 11, 'AVEO', 'Aveo', '2024-06-09 01:40:10', NULL),
(241, 11, 'AVEO5', 'Aveo5', '2024-06-09 01:40:10', NULL),
(242, 11, 'BERETT', 'Beretta', '2024-06-09 01:40:10', NULL),
(243, 11, 'BLAZER', 'Blazer', '2024-06-09 01:40:10', NULL),
(244, 11, 'CAM', 'Camaro', '2024-06-09 01:40:10', NULL),
(245, 11, 'CAP', 'Caprice', '2024-06-09 01:40:10', NULL),
(246, 11, 'CHECAPS', 'Captiva Sport', '2024-06-09 01:40:10', NULL),
(247, 11, 'CAV', 'Cavalier', '2024-06-09 01:40:10', NULL),
(248, 11, 'CELE', 'Celebrity', '2024-06-09 01:40:10', NULL),
(249, 11, 'CHEVETTE', 'Chevette', '2024-06-09 01:40:10', NULL),
(250, 11, 'CITATION', 'Citation', '2024-06-09 01:40:10', NULL),
(251, 11, 'COBALT', 'Cobalt', '2024-06-09 01:40:10', NULL),
(252, 11, 'COLORADO', 'Colorado', '2024-06-09 01:40:10', NULL),
(253, 11, 'CORSI', 'Corsica', '2024-06-09 01:40:10', NULL),
(254, 11, 'CORV', 'Corvette', '2024-06-09 01:40:10', NULL),
(255, 11, 'CRUZE', 'Cruze', '2024-06-09 01:40:10', NULL),
(256, 11, 'ELCAM', 'El Camino', '2024-06-09 01:40:10', NULL),
(257, 11, 'EQUINOX', 'Equinox', '2024-06-09 01:40:10', NULL),
(258, 11, 'G15EXP', 'Express Van', '2024-06-09 01:40:10', NULL),
(259, 11, 'G10', 'G Van', '2024-06-09 01:40:10', NULL),
(260, 11, 'HHR', 'HHR', '2024-06-09 01:40:10', NULL),
(261, 11, 'CHEVIMP', 'Impala', '2024-06-09 01:40:10', NULL),
(262, 11, 'KODC4500', 'Kodiak C4500', '2024-06-09 01:40:10', NULL),
(263, 11, 'LUMINA', 'Lumina', '2024-06-09 01:40:10', NULL),
(264, 11, 'LAPV', 'Lumina APV', '2024-06-09 01:40:10', NULL),
(265, 11, 'LUV', 'LUV', '2024-06-09 01:40:10', NULL),
(266, 11, 'MALI', 'Malibu', '2024-06-09 01:40:10', NULL),
(267, 11, 'CHVMETR', 'Metro', '2024-06-09 01:40:10', NULL),
(268, 11, 'CHEVMONT', 'Monte Carlo', '2024-06-09 01:40:10', NULL),
(269, 11, 'NOVA', 'Nova', '2024-06-09 01:40:10', NULL),
(270, 11, 'CHEVPRIZM', 'Prizm', '2024-06-09 01:40:10', NULL),
(271, 11, 'CHVST', 'S10 Blazer', '2024-06-09 01:40:10', NULL),
(272, 11, 'S10PICKUP', 'S10 Pickup', '2024-06-09 01:40:10', NULL),
(273, 11, 'CHEV150', 'Silverado and other C/K1500', '2024-06-09 01:40:10', NULL),
(274, 11, 'CHEVC25', 'Silverado and other C/K2500', '2024-06-09 01:40:10', NULL),
(275, 11, 'CH3500PU', 'Silverado and other C/K3500', '2024-06-09 01:40:10', NULL),
(276, 11, 'SONIC', 'Sonic', '2024-06-09 01:40:10', NULL),
(277, 11, 'SPARK', 'Spark', '2024-06-09 01:40:10', NULL),
(278, 11, 'CHEVSPEC', 'Spectrum', '2024-06-09 01:40:10', NULL),
(279, 11, 'CHSPRINT', 'Sprint', '2024-06-09 01:40:10', NULL),
(280, 11, 'SSR', 'SSR', '2024-06-09 01:40:10', NULL),
(281, 11, 'CHEVSUB', 'Suburban', '2024-06-09 01:40:10', NULL),
(282, 11, 'TAHOE', 'Tahoe', '2024-06-09 01:40:10', NULL),
(283, 11, 'TRACKE', 'Tracker', '2024-06-09 01:40:10', NULL),
(284, 11, 'TRAILBLZ', 'TrailBlazer', '2024-06-09 01:40:10', NULL),
(285, 11, 'TRAILBZEXT', 'TrailBlazer EXT', '2024-06-09 01:40:10', NULL),
(286, 11, 'TRAVERSE', 'Traverse', '2024-06-09 01:40:10', NULL),
(287, 11, 'UPLANDER', 'Uplander', '2024-06-09 01:40:10', NULL),
(288, 11, 'VENTUR', 'Venture', '2024-06-09 01:40:10', NULL),
(289, 11, 'VOLT', 'Volt', '2024-06-09 01:40:10', NULL),
(290, 11, 'CHEOTH', 'Other Chevrolet Models', '2024-06-09 01:40:10', NULL),
(291, 12, 'CHRYS200', '200', '2024-06-09 01:40:10', NULL),
(292, 12, '300', '300', '2024-06-09 01:40:10', NULL),
(293, 12, 'CHRY300', '300M', '2024-06-09 01:40:10', NULL),
(294, 12, 'ASPEN', 'Aspen', '2024-06-09 01:40:10', NULL),
(295, 12, 'CARAVAN', 'Caravan', '2024-06-09 01:40:10', NULL),
(296, 12, 'CIRRUS', 'Cirrus', '2024-06-09 01:40:10', NULL),
(297, 12, 'CONC', 'Concorde', '2024-06-09 01:40:10', NULL),
(298, 12, 'CHRYCONQ', 'Conquest', '2024-06-09 01:40:10', NULL),
(299, 12, 'CORDOBA', 'Cordoba', '2024-06-09 01:40:10', NULL),
(300, 12, 'CROSSFIRE', 'Crossfire', '2024-06-09 01:40:10', NULL),
(301, 12, 'ECLASS', 'E Class', '2024-06-09 01:40:10', NULL),
(302, 12, 'FIFTH', 'Fifth Avenue', '2024-06-09 01:40:10', NULL),
(303, 12, 'CHRYGRANDV', 'Grand Voyager', '2024-06-09 01:40:10', NULL),
(304, 12, 'IMPE', 'Imperial', '2024-06-09 01:40:10', NULL),
(305, 12, 'INTREPID', 'Intrepid', '2024-06-09 01:40:10', NULL),
(306, 12, 'CHRYLAS', 'Laser', '2024-06-09 01:40:10', NULL),
(307, 12, 'LEBA', 'LeBaron', '2024-06-09 01:40:10', NULL),
(308, 12, 'LHS', 'LHS', '2024-06-09 01:40:10', NULL),
(309, 12, 'CHRYNEON', 'Neon', '2024-06-09 01:40:10', NULL),
(310, 12, 'NY', 'New Yorker', '2024-06-09 01:40:10', NULL),
(311, 12, 'NEWPORT', 'Newport', '2024-06-09 01:40:10', NULL),
(312, 12, 'PACIFICA', 'Pacifica', '2024-06-09 01:40:10', NULL),
(313, 12, 'CHPROWLE', 'Prowler', '2024-06-09 01:40:10', NULL),
(314, 12, 'PTCRUIS', 'PT Cruiser', '2024-06-09 01:40:10', NULL),
(315, 12, 'CHRYSEB', 'Sebring', '2024-06-09 01:40:10', NULL),
(316, 12, 'CHRYTC', 'TC by Maserati', '2024-06-09 01:40:10', NULL),
(317, 12, 'TANDC', 'Town & Country', '2024-06-09 01:40:10', NULL),
(318, 12, 'VOYAGER', 'Voyager', '2024-06-09 01:40:10', NULL),
(319, 12, 'CHOTH', 'Other Chrysler Models', '2024-06-09 01:40:10', NULL),
(320, 13, 'LANOS', 'Lanos', '2024-06-09 01:40:10', NULL),
(321, 13, 'LEGANZA', 'Leganza', '2024-06-09 01:40:10', NULL),
(322, 13, 'NUBIRA', 'Nubira', '2024-06-09 01:40:10', NULL),
(323, 13, 'DAEOTH', 'Other Daewoo Models', '2024-06-09 01:40:10', NULL),
(324, 14, 'CHAR', 'Charade', '2024-06-09 01:40:10', NULL),
(325, 14, 'ROCKY', 'Rocky', '2024-06-09 01:40:10', NULL),
(326, 14, 'DAIHOTH', 'Other Daihatsu Models', '2024-06-09 01:40:10', NULL),
(327, 15, 'DAT200SX', '200SX', '2024-06-09 01:40:10', NULL),
(328, 15, 'DAT210', '210', '2024-06-09 01:40:10', NULL),
(329, 15, '280Z', '280ZX', '2024-06-09 01:40:10', NULL),
(330, 15, '300ZX', '300ZX', '2024-06-09 01:40:10', NULL),
(331, 15, '310', '310', '2024-06-09 01:40:10', NULL),
(332, 15, '510', '510', '2024-06-09 01:40:10', NULL),
(333, 15, '720', '720', '2024-06-09 01:40:10', NULL),
(334, 15, '810', '810', '2024-06-09 01:40:10', NULL),
(335, 15, 'DATMAX', 'Maxima', '2024-06-09 01:40:10', NULL),
(336, 15, 'DATPU', 'Pickup', '2024-06-09 01:40:10', NULL),
(337, 15, 'PUL', 'Pulsar', '2024-06-09 01:40:10', NULL),
(338, 15, 'DATSENT', 'Sentra', '2024-06-09 01:40:10', NULL),
(339, 15, 'STAN', 'Stanza', '2024-06-09 01:40:10', NULL),
(340, 15, 'DATOTH', 'Other Datsun Models', '2024-06-09 01:40:10', NULL),
(341, 16, 'DMC12', 'DMC-12', '2024-06-09 01:40:10', NULL),
(342, 17, '400', '400', '2024-06-09 01:40:10', NULL),
(343, 17, 'DOD600', '600', '2024-06-09 01:40:10', NULL),
(344, 17, 'ARI', 'Aries', '2024-06-09 01:40:10', NULL),
(345, 17, 'AVENGR', 'Avenger', '2024-06-09 01:40:10', NULL),
(346, 17, 'CALIBER', 'Caliber', '2024-06-09 01:40:10', NULL),
(347, 17, 'DODCARA', 'Caravan', '2024-06-09 01:40:10', NULL),
(348, 17, 'CHALLENGER', 'Challenger', '2024-06-09 01:40:10', NULL),
(349, 17, 'DODCHAR', 'Charger', '2024-06-09 01:40:10', NULL),
(350, 17, 'DODCOLT', 'Colt', '2024-06-09 01:40:10', NULL),
(351, 17, 'DODCONQ', 'Conquest', '2024-06-09 01:40:10', NULL),
(352, 17, 'DODDW', 'D/W Truck', '2024-06-09 01:40:10', NULL),
(353, 17, 'DAKOTA', 'Dakota', '2024-06-09 01:40:10', NULL),
(354, 17, 'DODDART', 'Dart', '2024-06-09 01:40:10', NULL),
(355, 17, 'DAY', 'Daytona', '2024-06-09 01:40:10', NULL),
(356, 17, 'DIPLOMA', 'Diplomat', '2024-06-09 01:40:10', NULL),
(357, 17, 'DURANG', 'Durango', '2024-06-09 01:40:10', NULL),
(358, 17, 'DODDYNA', 'Dynasty', '2024-06-09 01:40:10', NULL),
(359, 17, 'GRANDCARAV', 'Grand Caravan', '2024-06-09 01:40:10', NULL),
(360, 17, 'INTRE', 'Intrepid', '2024-06-09 01:40:10', NULL),
(361, 17, 'JOURNEY', 'Journey', '2024-06-09 01:40:10', NULL),
(362, 17, 'LANCERDODG', 'Lancer', '2024-06-09 01:40:10', NULL),
(363, 17, 'MAGNUM', 'Magnum', '2024-06-09 01:40:10', NULL),
(364, 17, 'MIRADA', 'Mirada', '2024-06-09 01:40:10', NULL),
(365, 17, 'MONACO', 'Monaco', '2024-06-09 01:40:10', NULL),
(366, 17, 'DODNEON', 'Neon', '2024-06-09 01:40:10', NULL),
(367, 17, 'NITRO', 'Nitro', '2024-06-09 01:40:10', NULL),
(368, 17, 'OMNI', 'Omni', '2024-06-09 01:40:10', NULL),
(369, 17, 'RAIDER', 'Raider', '2024-06-09 01:40:10', NULL),
(370, 17, 'RAM1504WD', 'Ram 1500 Truck', '2024-06-09 01:40:10', NULL),
(371, 17, 'RAM25002WD', 'Ram 2500 Truck', '2024-06-09 01:40:10', NULL),
(372, 17, 'RAM3502WD', 'Ram 3500 Truck', '2024-06-09 01:40:10', NULL),
(373, 17, 'RAM4500', 'Ram 4500 Truck', '2024-06-09 01:40:10', NULL),
(374, 17, 'DODD50', 'Ram 50 Truck', '2024-06-09 01:40:10', NULL),
(375, 17, 'CV', 'RAM C/V', '2024-06-09 01:40:10', NULL),
(376, 17, 'RAMSRT10', 'Ram SRT-10', '2024-06-09 01:40:10', NULL),
(377, 17, 'RAMVANV8', 'Ram Van', '2024-06-09 01:40:10', NULL),
(378, 17, 'RAMWAGON', 'Ram Wagon', '2024-06-09 01:40:10', NULL),
(379, 17, 'RAMCGR', 'Ramcharger', '2024-06-09 01:40:10', NULL),
(380, 17, 'RAMPAGE', 'Rampage', '2024-06-09 01:40:10', NULL),
(381, 17, 'DODSHAD', 'Shadow', '2024-06-09 01:40:10', NULL),
(382, 17, 'DODSPIR', 'Spirit', '2024-06-09 01:40:10', NULL),
(383, 17, 'SPRINTER', 'Sprinter', '2024-06-09 01:40:10', NULL),
(384, 17, 'SRT4', 'SRT-4', '2024-06-09 01:40:10', NULL),
(385, 17, 'STREGIS', 'St. Regis', '2024-06-09 01:40:10', NULL),
(386, 17, 'STEAL', 'Stealth', '2024-06-09 01:40:10', NULL),
(387, 17, 'STRATU', 'Stratus', '2024-06-09 01:40:10', NULL),
(388, 17, 'VIPER', 'Viper', '2024-06-09 01:40:10', NULL),
(389, 17, 'DOOTH', 'Other Dodge Models', '2024-06-09 01:40:10', NULL),
(390, 18, 'EAGLEMED', 'Medallion', '2024-06-09 01:40:10', NULL),
(391, 18, 'EAGLEPREM', 'Premier', '2024-06-09 01:40:10', NULL),
(392, 18, 'SUMMIT', 'Summit', '2024-06-09 01:40:10', NULL),
(393, 18, 'TALON', 'Talon', '2024-06-09 01:40:10', NULL),
(394, 18, 'VISION', 'Vision', '2024-06-09 01:40:10', NULL),
(395, 18, 'EAGOTH', 'Other Eagle Models', '2024-06-09 01:40:10', NULL),
(396, 19, '308GTB', '308 GTB Quattrovalvole', '2024-06-09 01:40:10', NULL),
(397, 19, '308TBI', '308 GTBI', '2024-06-09 01:40:10', NULL),
(398, 19, '308GTS', '308 GTS Quattrovalvole', '2024-06-09 01:40:10', NULL),
(399, 19, '308TSI', '308 GTSI', '2024-06-09 01:40:10', NULL),
(400, 19, '328GTB', '328 GTB', '2024-06-09 01:40:10', NULL),
(401, 19, '328GTS', '328 GTS', '2024-06-09 01:40:10', NULL),
(402, 19, '348GTB', '348 GTB', '2024-06-09 01:40:10', NULL),
(403, 19, '348GTS', '348 GTS', '2024-06-09 01:40:10', NULL),
(404, 19, '348SPI', '348 Spider', '2024-06-09 01:40:10', NULL),
(405, 19, '348TB', '348 TB', '2024-06-09 01:40:10', NULL),
(406, 19, '348TS', '348 TS', '2024-06-09 01:40:10', NULL),
(407, 19, '360', '360', '2024-06-09 01:40:10', NULL),
(408, 19, '456GT', '456 GT', '2024-06-09 01:40:10', NULL),
(409, 19, '456MGT', '456M GT', '2024-06-09 01:40:10', NULL),
(410, 19, '458ITALIA', '458 Italia', '2024-06-09 01:40:10', NULL),
(411, 19, '512BBI', '512 BBi', '2024-06-09 01:40:10', NULL),
(412, 19, '512M', '512M', '2024-06-09 01:40:10', NULL),
(413, 19, '512TR', '512TR', '2024-06-09 01:40:10', NULL),
(414, 19, '550M', '550 Maranello', '2024-06-09 01:40:10', NULL),
(415, 19, '575M', '575M Maranello', '2024-06-09 01:40:10', NULL),
(416, 19, '599GTB', '599 GTB Fiorano', '2024-06-09 01:40:10', NULL),
(417, 19, '599GTO', '599 GTO', '2024-06-09 01:40:10', NULL),
(418, 19, '612SCAGLIE', '612 Scaglietti', '2024-06-09 01:40:10', NULL),
(419, 19, 'FERCALIF', 'California', '2024-06-09 01:40:10', NULL),
(420, 19, 'ENZO', 'Enzo', '2024-06-09 01:40:10', NULL),
(421, 19, 'F355', 'F355', '2024-06-09 01:40:10', NULL),
(422, 19, 'F40', 'F40', '2024-06-09 01:40:10', NULL),
(423, 19, 'F430', 'F430', '2024-06-09 01:40:10', NULL),
(424, 19, 'F50', 'F50', '2024-06-09 01:40:10', NULL),
(425, 19, 'FERFF', 'FF', '2024-06-09 01:40:10', NULL),
(426, 19, 'MOND', 'Mondial', '2024-06-09 01:40:10', NULL),
(427, 19, 'TEST', 'Testarossa', '2024-06-09 01:40:10', NULL),
(428, 19, 'UNAVAILFER', 'Other Ferrari Models', '2024-06-09 01:40:10', NULL),
(429, 20, '2000', '2000 Spider', '2024-06-09 01:40:10', NULL),
(430, 20, 'FIAT500', '500', '2024-06-09 01:40:10', NULL),
(431, 20, 'BERTON', 'Bertone X1/9', '2024-06-09 01:40:10', NULL),
(432, 20, 'BRAVA', 'Brava', '2024-06-09 01:40:10', NULL),
(433, 20, 'PININ', 'Pininfarina Spider', '2024-06-09 01:40:10', NULL),
(434, 20, 'STRADA', 'Strada', '2024-06-09 01:40:10', NULL),
(435, 20, 'FIATX19', 'X1/9', '2024-06-09 01:40:10', NULL),
(436, 20, 'UNAVAILFIA', 'Other Fiat Models', '2024-06-09 01:40:10', NULL),
(437, 21, 'KARMA', 'Karma', '2024-06-09 01:40:10', NULL),
(438, 22, 'AERO', 'Aerostar', '2024-06-09 01:40:10', NULL),
(439, 22, 'ASPIRE', 'Aspire', '2024-06-09 01:40:10', NULL),
(440, 22, 'BRON', 'Bronco', '2024-06-09 01:40:10', NULL),
(441, 22, 'B2', 'Bronco II', '2024-06-09 01:40:10', NULL),
(442, 22, 'FOCMAX', 'C-MAX', '2024-06-09 01:40:10', NULL),
(443, 22, 'FORDCLUB', 'Club Wagon', '2024-06-09 01:40:10', NULL),
(444, 22, 'CONTOUR', 'Contour', '2024-06-09 01:40:10', NULL),
(445, 22, 'COURIER', 'Courier', '2024-06-09 01:40:10', NULL),
(446, 22, 'CROWNVIC', 'Crown Victoria', '2024-06-09 01:40:10', NULL),
(447, 22, 'E150ECON', 'E-150 and Econoline 150', '2024-06-09 01:40:10', NULL),
(448, 22, 'E250ECON', 'E-250 and Econoline 250', '2024-06-09 01:40:10', NULL),
(449, 22, 'E350ECON', 'E-350 and Econoline 350', '2024-06-09 01:40:10', NULL),
(450, 22, 'EDGE', 'Edge', '2024-06-09 01:40:10', NULL),
(451, 22, 'ESCAPE', 'Escape', '2024-06-09 01:40:10', NULL),
(452, 22, 'ESCO', 'Escort', '2024-06-09 01:40:10', NULL),
(453, 22, 'EXCURSION', 'Excursion', '2024-06-09 01:40:10', NULL),
(454, 22, 'EXP', 'EXP', '2024-06-09 01:40:10', NULL),
(455, 22, 'EXPEDI', 'Expedition', '2024-06-09 01:40:10', NULL),
(456, 22, 'EXPEDIEL', 'Expedition EL', '2024-06-09 01:40:10', NULL),
(457, 22, 'EXPLOR', 'Explorer', '2024-06-09 01:40:10', NULL),
(458, 22, 'SPORTTRAC', 'Explorer Sport Trac', '2024-06-09 01:40:10', NULL),
(459, 22, 'F100', 'F100', '2024-06-09 01:40:10', NULL),
(460, 22, 'F150PICKUP', 'F150', '2024-06-09 01:40:10', NULL),
(461, 22, 'F250', 'F250', '2024-06-09 01:40:10', NULL),
(462, 22, 'F350', 'F350', '2024-06-09 01:40:10', NULL),
(463, 22, 'F450', 'F450', '2024-06-09 01:40:10', NULL),
(464, 22, 'FAIRM', 'Fairmont', '2024-06-09 01:40:10', NULL),
(465, 22, 'FESTIV', 'Festiva', '2024-06-09 01:40:10', NULL),
(466, 22, 'FIESTA', 'Fiesta', '2024-06-09 01:40:10', NULL),
(467, 22, 'FIVEHUNDRE', 'Five Hundred', '2024-06-09 01:40:10', NULL),
(468, 22, 'FLEX', 'Flex', '2024-06-09 01:40:10', NULL),
(469, 22, 'FOCUS', 'Focus', '2024-06-09 01:40:10', NULL),
(470, 22, 'FREESTAR', 'Freestar', '2024-06-09 01:40:10', NULL),
(471, 22, 'FREESTYLE', 'Freestyle', '2024-06-09 01:40:10', NULL),
(472, 22, 'FUSION', 'Fusion', '2024-06-09 01:40:10', NULL),
(473, 22, 'GRANADA', 'Granada', '2024-06-09 01:40:10', NULL),
(474, 22, 'GT', 'GT', '2024-06-09 01:40:10', NULL),
(475, 22, 'LTD', 'LTD', '2024-06-09 01:40:10', NULL),
(476, 22, 'MUST', 'Mustang', '2024-06-09 01:40:10', NULL),
(477, 22, 'PROBE', 'Probe', '2024-06-09 01:40:10', NULL),
(478, 22, 'RANGER', 'Ranger', '2024-06-09 01:40:10', NULL),
(479, 22, 'TAURUS', 'Taurus', '2024-06-09 01:40:10', NULL),
(480, 22, 'TAURUSX', 'Taurus X', '2024-06-09 01:40:10', NULL),
(481, 22, 'TEMPO', 'Tempo', '2024-06-09 01:40:10', NULL),
(482, 22, 'TBIRD', 'Thunderbird', '2024-06-09 01:40:10', NULL),
(483, 22, 'TRANSCONN', 'Transit Connect', '2024-06-09 01:40:10', NULL),
(484, 22, 'WINDST', 'Windstar', '2024-06-09 01:40:10', NULL),
(485, 22, 'FORDZX2', 'ZX2 Escort', '2024-06-09 01:40:10', NULL),
(486, 22, 'FOOTH', 'Other Ford Models', '2024-06-09 01:40:10', NULL),
(487, 23, 'FRESPRINT', 'Sprinter', '2024-06-09 01:40:10', NULL),
(488, 24, 'GEOMETRO', 'Metro', '2024-06-09 01:40:10', NULL),
(489, 24, 'GEOPRIZM', 'Prizm', '2024-06-09 01:40:10', NULL),
(490, 24, 'SPECT', 'Spectrum', '2024-06-09 01:40:10', NULL),
(491, 24, 'STORM', 'Storm', '2024-06-09 01:40:10', NULL),
(492, 24, 'GEOTRACK', 'Tracker', '2024-06-09 01:40:10', NULL),
(493, 24, 'GEOOTH', 'Other Geo Models', '2024-06-09 01:40:10', NULL),
(494, 25, 'ACADIA', 'Acadia', '2024-06-09 01:40:10', NULL),
(495, 25, 'CABALLERO', 'Caballero', '2024-06-09 01:40:10', NULL),
(496, 25, 'CANYON', 'Canyon', '2024-06-09 01:40:10', NULL),
(497, 25, 'ENVOY', 'Envoy', '2024-06-09 01:40:10', NULL),
(498, 25, 'ENVOYXL', 'Envoy XL', '2024-06-09 01:40:10', NULL),
(499, 25, 'ENVOYXUV', 'Envoy XUV', '2024-06-09 01:40:10', NULL),
(500, 25, 'JIM', 'Jimmy', '2024-06-09 01:40:10', NULL),
(501, 25, 'RALLYWAG', 'Rally Wagon', '2024-06-09 01:40:10', NULL),
(502, 25, 'GMCS15', 'S15 Jimmy', '2024-06-09 01:40:10', NULL),
(503, 25, 'S15', 'S15 Pickup', '2024-06-09 01:40:10', NULL),
(504, 25, 'SAFARIGMC', 'Safari', '2024-06-09 01:40:10', NULL),
(505, 25, 'GMCSAVANA', 'Savana', '2024-06-09 01:40:10', NULL),
(506, 25, '15SIPU4WD', 'Sierra C/K1500', '2024-06-09 01:40:10', NULL),
(507, 25, 'GMCC25PU', 'Sierra C/K2500', '2024-06-09 01:40:10', NULL),
(508, 25, 'GMC3500PU', 'Sierra C/K3500', '2024-06-09 01:40:10', NULL),
(509, 25, 'SONOMA', 'Sonoma', '2024-06-09 01:40:10', NULL),
(510, 25, 'SUB', 'Suburban', '2024-06-09 01:40:10', NULL),
(511, 25, 'GMCSYCLON', 'Syclone', '2024-06-09 01:40:10', NULL),
(512, 25, 'TERRAIN', 'Terrain', '2024-06-09 01:40:10', NULL),
(513, 25, 'TOPC4500', 'TopKick C4500', '2024-06-09 01:40:10', NULL),
(514, 25, 'TYPH', 'Typhoon', '2024-06-09 01:40:10', NULL),
(515, 25, 'GMCVANDUR', 'Vandura', '2024-06-09 01:40:10', NULL),
(516, 25, 'YUKON', 'Yukon', '2024-06-09 01:40:10', NULL),
(517, 25, 'YUKONXL', 'Yukon XL', '2024-06-09 01:40:10', NULL),
(518, 25, 'GMCOTH', 'Other GMC Models', '2024-06-09 01:40:10', NULL),
(519, 26, 'ACCORD', 'Accord', '2024-06-09 01:40:10', NULL),
(520, 26, 'CIVIC', 'Civic', '2024-06-09 01:40:10', NULL),
(521, 26, 'CRV', 'CR-V', '2024-06-09 01:40:10', NULL),
(522, 26, 'CRZ', 'CR-Z', '2024-06-09 01:40:10', NULL),
(523, 26, 'CRX', 'CRX', '2024-06-09 01:40:10', NULL),
(524, 26, 'CROSSTOUR_MODELS', 'Crosstour and Accord Crosstour Models (2)', '2024-06-09 01:40:10', NULL),
(525, 26, 'CROSSTOUR', ' - Accord Crosstour', '2024-06-09 01:40:10', NULL),
(526, 26, 'HONCROSS', ' - Crosstour', '2024-06-09 01:40:10', NULL),
(527, 26, 'HONDELSOL', 'Del Sol', '2024-06-09 01:40:10', NULL),
(528, 26, 'ELEMENT', 'Element', '2024-06-09 01:40:10', NULL),
(529, 26, 'FIT', 'Fit', '2024-06-09 01:40:10', NULL),
(530, 26, 'INSIGHT', 'Insight', '2024-06-09 01:40:10', NULL),
(531, 26, 'ODYSSEY', 'Odyssey', '2024-06-09 01:40:10', NULL),
(532, 26, 'PASSPO', 'Passport', '2024-06-09 01:40:10', NULL),
(533, 26, 'PILOT', 'Pilot', '2024-06-09 01:40:10', NULL),
(534, 26, 'PRE', 'Prelude', '2024-06-09 01:40:10', NULL),
(535, 26, 'RIDGELINE', 'Ridgeline', '2024-06-09 01:40:10', NULL),
(536, 26, 'S2000', 'S2000', '2024-06-09 01:40:10', NULL),
(537, 26, 'HONOTH', 'Other Honda Models', '2024-06-09 01:40:10', NULL),
(538, 27, 'HUMMER', 'H1', '2024-06-09 01:40:10', NULL),
(539, 27, 'H2', 'H2', '2024-06-09 01:40:10', NULL),
(540, 27, 'H3', 'H3', '2024-06-09 01:40:10', NULL),
(541, 27, 'H3T', 'H3T', '2024-06-09 01:40:10', NULL),
(542, 27, 'AMGOTH', 'Other Hummer Models', '2024-06-09 01:40:10', NULL),
(543, 28, 'ACCENT', 'Accent', '2024-06-09 01:40:10', NULL),
(544, 28, 'AZERA', 'Azera', '2024-06-09 01:40:10', NULL),
(545, 28, 'ELANTR', 'Elantra', '2024-06-09 01:40:10', NULL),
(546, 28, 'HYUELANCPE', 'Elantra Coupe', '2024-06-09 01:40:10', NULL),
(547, 28, 'ELANTOUR', 'Elantra Touring', '2024-06-09 01:40:10', NULL),
(548, 28, 'ENTOURAGE', 'Entourage', '2024-06-09 01:40:10', NULL),
(549, 28, 'EQUUS', 'Equus', '2024-06-09 01:40:10', NULL),
(550, 28, 'HYUEXCEL', 'Excel', '2024-06-09 01:40:10', NULL),
(551, 28, 'GENESIS', 'Genesis', '2024-06-09 01:40:10', NULL),
(552, 28, 'GENESISCPE', 'Genesis Coupe', '2024-06-09 01:40:10', NULL),
(553, 28, 'SANTAFE', 'Santa Fe', '2024-06-09 01:40:10', NULL),
(554, 28, 'SCOUPE', 'Scoupe', '2024-06-09 01:40:10', NULL),
(555, 28, 'SONATA', 'Sonata', '2024-06-09 01:40:10', NULL),
(556, 28, 'TIBURO', 'Tiburon', '2024-06-09 01:40:10', NULL),
(557, 28, 'TUCSON', 'Tucson', '2024-06-09 01:40:10', NULL),
(558, 28, 'VELOSTER', 'Veloster', '2024-06-09 01:40:10', NULL),
(559, 28, 'VERACRUZ', 'Veracruz', '2024-06-09 01:40:10', NULL),
(560, 28, 'XG300', 'XG300', '2024-06-09 01:40:10', NULL),
(561, 28, 'XG350', 'XG350', '2024-06-09 01:40:10', NULL),
(562, 28, 'HYUOTH', 'Other Hyundai Models', '2024-06-09 01:40:10', NULL),
(563, 29, 'EX_MODELS', 'EX Models (2)', '2024-06-09 01:40:10', NULL),
(564, 29, 'EX35', ' - EX35', '2024-06-09 01:40:10', NULL),
(565, 29, 'EX37', ' - EX37', '2024-06-09 01:40:10', NULL),
(566, 29, 'FX_MODELS', 'FX Models (4)', '2024-06-09 01:40:10', NULL),
(567, 29, 'FX35', ' - FX35', '2024-06-09 01:40:10', NULL),
(568, 29, 'FX37', ' - FX37', '2024-06-09 01:40:10', NULL),
(569, 29, 'FX45', ' - FX45', '2024-06-09 01:40:10', NULL),
(570, 29, 'FX50', ' - FX50', '2024-06-09 01:40:10', NULL),
(571, 29, 'G_MODELS', 'G Models (4)', '2024-06-09 01:40:10', NULL),
(572, 29, 'G20', ' - G20', '2024-06-09 01:40:10', NULL),
(573, 29, 'G25', ' - G25', '2024-06-09 01:40:10', NULL),
(574, 29, 'G35', ' - G35', '2024-06-09 01:40:10', NULL),
(575, 29, 'G37', ' - G37', '2024-06-09 01:40:10', NULL),
(576, 29, 'I_MODELS', 'I Models (2)', '2024-06-09 01:40:10', NULL),
(577, 29, 'I30', ' - I30', '2024-06-09 01:40:10', NULL),
(578, 29, 'I35', ' - I35', '2024-06-09 01:40:10', NULL),
(579, 29, 'J_MODELS', 'J Models (1)', '2024-06-09 01:40:10', NULL),
(580, 29, 'J30', ' - J30', '2024-06-09 01:40:10', NULL),
(581, 29, 'JX_MODELS', 'JX Models (1)', '2024-06-09 01:40:10', NULL),
(582, 29, 'JX35', ' - JX35', '2024-06-09 01:40:10', NULL),
(583, 29, 'M_MODELS', 'M Models (6)', '2024-06-09 01:40:10', NULL),
(584, 29, 'M30', ' - M30', '2024-06-09 01:40:10', NULL),
(585, 29, 'M35', ' - M35', '2024-06-09 01:40:10', NULL),
(586, 29, 'M35HYBRID', ' - M35h', '2024-06-09 01:40:10', NULL),
(587, 29, 'M37', ' - M37', '2024-06-09 01:40:10', NULL),
(588, 29, 'M45', ' - M45', '2024-06-09 01:40:10', NULL),
(589, 29, 'M56', ' - M56', '2024-06-09 01:40:10', NULL),
(590, 29, 'Q_MODELS', 'Q Models (1)', '2024-06-09 01:40:10', NULL),
(591, 29, 'Q45', ' - Q45', '2024-06-09 01:40:10', NULL),
(592, 29, 'QX_MODELS', 'QX Models (2)', '2024-06-09 01:40:10', NULL),
(593, 29, 'QX4', ' - QX4', '2024-06-09 01:40:10', NULL),
(594, 29, 'QX56', ' - QX56', '2024-06-09 01:40:10', NULL),
(595, 29, 'INFOTH', 'Other Infiniti Models', '2024-06-09 01:40:10', NULL),
(596, 30, 'AMIGO', 'Amigo', '2024-06-09 01:40:10', NULL),
(597, 30, 'ASCENDER', 'Ascender', '2024-06-09 01:40:10', NULL),
(598, 30, 'AXIOM', 'Axiom', '2024-06-09 01:40:10', NULL),
(599, 30, 'HOMBRE', 'Hombre', '2024-06-09 01:40:10', NULL),
(600, 30, 'I280', 'i-280', '2024-06-09 01:40:10', NULL),
(601, 30, 'I290', 'i-290', '2024-06-09 01:40:10', NULL),
(602, 30, 'I350', 'i-350', '2024-06-09 01:40:10', NULL),
(603, 30, 'I370', 'i-370', '2024-06-09 01:40:10', NULL),
(604, 30, 'ISUMARK', 'I-Mark', '2024-06-09 01:40:10', NULL),
(605, 30, 'ISUIMP', 'Impulse', '2024-06-09 01:40:10', NULL),
(606, 30, 'OASIS', 'Oasis', '2024-06-09 01:40:10', NULL),
(607, 30, 'ISUPU', 'Pickup', '2024-06-09 01:40:10', NULL),
(608, 30, 'RODEO', 'Rodeo', '2024-06-09 01:40:10', NULL),
(609, 30, 'STYLUS', 'Stylus', '2024-06-09 01:40:10', NULL),
(610, 30, 'TROOP', 'Trooper', '2024-06-09 01:40:10', NULL),
(611, 30, 'TRP2', 'Trooper II', '2024-06-09 01:40:10', NULL),
(612, 30, 'VEHICROSS', 'VehiCROSS', '2024-06-09 01:40:10', NULL),
(613, 30, 'ISUOTH', 'Other Isuzu Models', '2024-06-09 01:40:10', NULL),
(614, 31, 'STYPE', 'S-Type', '2024-06-09 01:40:10', NULL),
(615, 31, 'XTYPE', 'X-Type', '2024-06-09 01:40:10', NULL),
(616, 31, 'XF', 'XF', '2024-06-09 01:40:10', NULL),
(617, 31, 'XJ_SERIES', 'XJ Series (10)', '2024-06-09 01:40:10', NULL),
(618, 31, 'JAGXJ12', ' - XJ12', '2024-06-09 01:40:10', NULL),
(619, 31, 'JAGXJ6', ' - XJ6', '2024-06-09 01:40:10', NULL),
(620, 31, 'JAGXJR', ' - XJR', '2024-06-09 01:40:10', NULL),
(621, 31, 'JAGXJRS', ' - XJR-S', '2024-06-09 01:40:10', NULL),
(622, 31, 'JAGXJS', ' - XJS', '2024-06-09 01:40:10', NULL),
(623, 31, 'VANDEN', ' - XJ Vanden Plas', '2024-06-09 01:40:10', NULL),
(624, 31, 'XJ', ' - XJ', '2024-06-09 01:40:10', NULL),
(625, 31, 'XJ8', ' - XJ8', '2024-06-09 01:40:10', NULL),
(626, 31, 'XJ8L', ' - XJ8 L', '2024-06-09 01:40:10', NULL),
(627, 31, 'XJSPORT', ' - XJ Sport', '2024-06-09 01:40:10', NULL),
(628, 31, 'XK_SERIES', 'XK Series (3)', '2024-06-09 01:40:10', NULL),
(629, 31, 'JAGXK8', ' - XK8', '2024-06-09 01:40:10', NULL),
(630, 31, 'XK', ' - XK', '2024-06-09 01:40:10', NULL),
(631, 31, 'XKR', ' - XKR', '2024-06-09 01:40:10', NULL),
(632, 31, 'JAGOTH', 'Other Jaguar Models', '2024-06-09 01:40:10', NULL),
(633, 32, 'CHER', 'Cherokee', '2024-06-09 01:40:10', NULL),
(634, 32, 'JEEPCJ', 'CJ', '2024-06-09 01:40:10', NULL),
(635, 32, 'COMANC', 'Comanche', '2024-06-09 01:40:10', NULL),
(636, 32, 'COMMANDER', 'Commander', '2024-06-09 01:40:10', NULL),
(637, 32, 'COMPASS', 'Compass', '2024-06-09 01:40:10', NULL),
(638, 32, 'JEEPGRAND', 'Grand Cherokee', '2024-06-09 01:40:10', NULL),
(639, 32, 'GRWAG', 'Grand Wagoneer', '2024-06-09 01:40:10', NULL),
(640, 32, 'LIBERTY', 'Liberty', '2024-06-09 01:40:10', NULL),
(641, 32, 'PATRIOT', 'Patriot', '2024-06-09 01:40:10', NULL),
(642, 32, 'JEEPPU', 'Pickup', '2024-06-09 01:40:10', NULL),
(643, 32, 'SCRAMBLE', 'Scrambler', '2024-06-09 01:40:10', NULL),
(644, 32, 'WAGONE', 'Wagoneer', '2024-06-09 01:40:10', NULL),
(645, 32, 'WRANGLER', 'Wrangler', '2024-06-09 01:40:10', NULL),
(646, 32, 'JEOTH', 'Other Jeep Models', '2024-06-09 01:40:10', NULL),
(647, 33, 'AMANTI', 'Amanti', '2024-06-09 01:40:10', NULL),
(648, 33, 'BORREGO', 'Borrego', '2024-06-09 01:40:10', NULL),
(649, 33, 'FORTE', 'Forte', '2024-06-09 01:40:10', NULL),
(650, 33, 'FORTEKOUP', 'Forte Koup', '2024-06-09 01:40:10', NULL),
(651, 33, 'OPTIMA', 'Optima', '2024-06-09 01:40:10', NULL),
(652, 33, 'RIO', 'Rio', '2024-06-09 01:40:10', NULL),
(653, 33, 'RIO5', 'Rio5', '2024-06-09 01:40:10', NULL),
(654, 33, 'RONDO', 'Rondo', '2024-06-09 01:40:10', NULL),
(655, 33, 'SEDONA', 'Sedona', '2024-06-09 01:40:10', NULL),
(656, 33, 'SEPHIA', 'Sephia', '2024-06-09 01:40:10', NULL),
(657, 33, 'SORENTO', 'Sorento', '2024-06-09 01:40:10', NULL),
(658, 33, 'SOUL', 'Soul', '2024-06-09 01:40:10', NULL),
(659, 33, 'SPECTRA', 'Spectra', '2024-06-09 01:40:10', NULL),
(660, 33, 'SPECTRA5', 'Spectra5', '2024-06-09 01:40:10', NULL),
(661, 33, 'SPORTA', 'Sportage', '2024-06-09 01:40:10', NULL),
(662, 33, 'KIAOTH', 'Other Kia Models', '2024-06-09 01:40:10', NULL),
(663, 34, 'AVENT', 'Aventador', '2024-06-09 01:40:10', NULL),
(664, 34, 'COUNT', 'Countach', '2024-06-09 01:40:10', NULL),
(665, 34, 'DIABLO', 'Diablo', '2024-06-09 01:40:10', NULL),
(666, 34, 'GALLARDO', 'Gallardo', '2024-06-09 01:40:10', NULL),
(667, 34, 'JALPA', 'Jalpa', '2024-06-09 01:40:10', NULL),
(668, 34, 'LM002', 'LM002', '2024-06-09 01:40:10', NULL),
(669, 34, 'MURCIELAGO', 'Murcielago', '2024-06-09 01:40:10', NULL),
(670, 34, 'UNAVAILLAM', 'Other Lamborghini Models', '2024-06-09 01:40:10', NULL),
(671, 35, 'BETA', 'Beta', '2024-06-09 01:40:10', NULL),
(672, 35, 'ZAGATO', 'Zagato', '2024-06-09 01:40:10', NULL),
(673, 35, 'UNAVAILLAN', 'Other Lancia Models', '2024-06-09 01:40:10', NULL),
(674, 36, 'DEFEND', 'Defender', '2024-06-09 01:40:10', NULL),
(675, 36, 'DISCOV', 'Discovery', '2024-06-09 01:40:10', NULL),
(676, 36, 'FRELNDR', 'Freelander', '2024-06-09 01:40:10', NULL),
(677, 36, 'LR2', 'LR2', '2024-06-09 01:40:10', NULL),
(678, 36, 'LR3', 'LR3', '2024-06-09 01:40:10', NULL),
(679, 36, 'LR4', 'LR4', '2024-06-09 01:40:10', NULL),
(680, 36, 'RANGE', 'Range Rover', '2024-06-09 01:40:10', NULL),
(681, 36, 'EVOQUE', 'Range Rover Evoque', '2024-06-09 01:40:10', NULL),
(682, 36, 'RANGESPORT', 'Range Rover Sport', '2024-06-09 01:40:10', NULL),
(683, 36, 'ROVOTH', 'Other Land Rover Models', '2024-06-09 01:40:10', NULL),
(684, 37, 'CT_MODELS', 'CT Models (1)', '2024-06-09 01:40:10', NULL),
(685, 37, 'CT200H', ' - CT 200h', '2024-06-09 01:40:10', NULL),
(686, 37, 'ES_MODELS', 'ES Models (5)', '2024-06-09 01:40:10', NULL),
(687, 37, 'ES250', ' - ES 250', '2024-06-09 01:40:10', NULL),
(688, 37, 'ES300', ' - ES 300', '2024-06-09 01:40:10', NULL),
(689, 37, 'ES300H', ' - ES 300h', '2024-06-09 01:40:10', NULL),
(690, 37, 'ES330', ' - ES 330', '2024-06-09 01:40:10', NULL),
(691, 37, 'ES350', ' - ES 350', '2024-06-09 01:40:10', NULL),
(692, 37, 'GS_MODELS', 'GS Models (6)', '2024-06-09 01:40:10', NULL),
(693, 37, 'GS300', ' - GS 300', '2024-06-09 01:40:10', NULL),
(694, 37, 'GS350', ' - GS 350', '2024-06-09 01:40:10', NULL),
(695, 37, 'GS400', ' - GS 400', '2024-06-09 01:40:10', NULL),
(696, 37, 'GS430', ' - GS 430', '2024-06-09 01:40:10', NULL),
(697, 37, 'GS450H', ' - GS 450h', '2024-06-09 01:40:10', NULL),
(698, 37, 'GS460', ' - GS 460', '2024-06-09 01:40:10', NULL),
(699, 37, 'GX_MODELS', 'GX Models (2)', '2024-06-09 01:40:10', NULL),
(700, 37, 'GX460', ' - GX 460', '2024-06-09 01:40:10', NULL),
(701, 37, 'GX470', ' - GX 470', '2024-06-09 01:40:10', NULL),
(702, 37, 'HS_MODELS', 'HS Models (1)', '2024-06-09 01:40:10', NULL),
(703, 37, 'HS250H', ' - HS 250h', '2024-06-09 01:40:10', NULL),
(704, 37, 'IS_MODELS', 'IS Models (6)', '2024-06-09 01:40:10', NULL),
(705, 37, 'IS250', ' - IS 250', '2024-06-09 01:40:10', NULL),
(706, 37, 'IS250C', ' - IS 250C', '2024-06-09 01:40:10', NULL),
(707, 37, 'IS300', ' - IS 300', '2024-06-09 01:40:10', NULL),
(708, 37, 'IS350', ' - IS 350', '2024-06-09 01:40:10', NULL),
(709, 37, 'IS350C', ' - IS 350C', '2024-06-09 01:40:10', NULL),
(710, 37, 'ISF', ' - IS F', '2024-06-09 01:40:10', NULL),
(711, 37, 'LEXLFA', 'LFA', '2024-06-09 01:40:10', NULL),
(712, 37, 'LS_MODELS', 'LS Models (4)', '2024-06-09 01:40:10', NULL),
(713, 37, 'LS400', ' - LS 400', '2024-06-09 01:40:10', NULL),
(714, 37, 'LS430', ' - LS 430', '2024-06-09 01:40:10', NULL),
(715, 37, 'LS460', ' - LS 460', '2024-06-09 01:40:10', NULL),
(716, 37, 'LS600H', ' - LS 600h', '2024-06-09 01:40:10', NULL),
(717, 37, 'LX_MODELS', 'LX Models (3)', '2024-06-09 01:40:10', NULL),
(718, 37, 'LX450', ' - LX 450', '2024-06-09 01:40:10', NULL),
(719, 37, 'LX470', ' - LX 470', '2024-06-09 01:40:10', NULL),
(720, 37, 'LX570', ' - LX 570', '2024-06-09 01:40:10', NULL),
(721, 37, 'RX_MODELS', 'RX Models (5)', '2024-06-09 01:40:10', NULL),
(722, 37, 'RX300', ' - RX 300', '2024-06-09 01:40:10', NULL),
(723, 37, 'RX330', ' - RX 330', '2024-06-09 01:40:10', NULL),
(724, 37, 'RX350', ' - RX 350', '2024-06-09 01:40:10', NULL),
(725, 37, 'RX400H', ' - RX 400h', '2024-06-09 01:40:10', NULL),
(726, 37, 'RX450H', ' - RX 450h', '2024-06-09 01:40:10', NULL),
(727, 37, 'SC_MODELS', 'SC Models (3)', '2024-06-09 01:40:10', NULL),
(728, 37, 'SC300', ' - SC 300', '2024-06-09 01:40:10', NULL),
(729, 37, 'SC400', ' - SC 400', '2024-06-09 01:40:10', NULL),
(730, 37, 'SC430', ' - SC 430', '2024-06-09 01:40:10', NULL),
(731, 37, 'LEXOTH', 'Other Lexus Models', '2024-06-09 01:40:10', NULL),
(732, 38, 'AVIATOR', 'Aviator', '2024-06-09 01:40:10', NULL),
(733, 38, 'BLKWOOD', 'Blackwood', '2024-06-09 01:40:10', NULL),
(734, 38, 'CONT', 'Continental', '2024-06-09 01:40:10', NULL),
(735, 38, 'LSLINCOLN', 'LS', '2024-06-09 01:40:10', NULL),
(736, 38, 'MARKLT', 'Mark LT', '2024-06-09 01:40:10', NULL),
(737, 38, 'MARK6', 'Mark VI', '2024-06-09 01:40:10', NULL),
(738, 38, 'MARK7', 'Mark VII', '2024-06-09 01:40:10', NULL),
(739, 38, 'MARK8', 'Mark VIII', '2024-06-09 01:40:10', NULL),
(740, 38, 'MKS', 'MKS', '2024-06-09 01:40:10', NULL),
(741, 38, 'MKT', 'MKT', '2024-06-09 01:40:10', NULL),
(742, 38, 'MKX', 'MKX', '2024-06-09 01:40:10', NULL),
(743, 38, 'MKZ', 'MKZ', '2024-06-09 01:40:10', NULL),
(744, 38, 'NAVIGA', 'Navigator', '2024-06-09 01:40:10', NULL),
(745, 38, 'NAVIGAL', 'Navigator L', '2024-06-09 01:40:10', NULL),
(746, 38, 'LINCTC', 'Town Car', '2024-06-09 01:40:10', NULL),
(747, 38, 'ZEPHYR', 'Zephyr', '2024-06-09 01:40:10', NULL),
(748, 38, 'LINOTH', 'Other Lincoln Models', '2024-06-09 01:40:10', NULL),
(749, 39, 'ELAN', 'Elan', '2024-06-09 01:40:10', NULL),
(750, 39, 'LOTELISE', 'Elise', '2024-06-09 01:40:10', NULL),
(751, 39, 'ESPRIT', 'Esprit', '2024-06-09 01:40:10', NULL),
(752, 39, 'EVORA', 'Evora', '2024-06-09 01:40:10', NULL),
(753, 39, 'EXIGE', 'Exige', '2024-06-09 01:40:10', NULL),
(754, 39, 'UNAVAILLOT', 'Other Lotus Models', '2024-06-09 01:40:10', NULL),
(755, 40, '430', '430', '2024-06-09 01:40:10', NULL),
(756, 40, 'BITRBO', 'Biturbo', '2024-06-09 01:40:10', NULL),
(757, 40, 'COUPEMAS', 'Coupe', '2024-06-09 01:40:10', NULL),
(758, 40, 'GRANSPORT', 'GranSport', '2024-06-09 01:40:10', NULL),
(759, 40, 'GRANTURISM', 'GranTurismo', '2024-06-09 01:40:10', NULL),
(760, 40, 'QP', 'Quattroporte', '2024-06-09 01:40:10', NULL),
(761, 40, 'SPYDER', 'Spyder', '2024-06-09 01:40:10', NULL),
(762, 40, 'UNAVAILMAS', 'Other Maserati Models', '2024-06-09 01:40:10', NULL),
(763, 41, '57MAYBACH', '57', '2024-06-09 01:40:10', NULL),
(764, 41, '62MAYBACH', '62', '2024-06-09 01:40:10', NULL),
(765, 41, 'UNAVAILMAY', 'Other Maybach Models', '2024-06-09 01:40:10', NULL),
(766, 42, 'MAZDA323', '323', '2024-06-09 01:40:10', NULL),
(767, 42, 'MAZDA626', '626', '2024-06-09 01:40:10', NULL),
(768, 42, '929', '929', '2024-06-09 01:40:10', NULL),
(769, 42, 'B-SERIES', 'B-Series Pickup', '2024-06-09 01:40:10', NULL),
(770, 42, 'CX-5', 'CX-5', '2024-06-09 01:40:10', NULL),
(771, 42, 'CX-7', 'CX-7', '2024-06-09 01:40:10', NULL),
(772, 42, 'CX-9', 'CX-9', '2024-06-09 01:40:10', NULL),
(773, 42, 'GLC', 'GLC', '2024-06-09 01:40:10', NULL),
(774, 42, 'MAZDA2', 'MAZDA2', '2024-06-09 01:40:10', NULL),
(775, 42, 'MAZDA3', 'MAZDA3', '2024-06-09 01:40:10', NULL),
(776, 42, 'MAZDA5', 'MAZDA5', '2024-06-09 01:40:10', NULL),
(777, 42, 'MAZDA6', 'MAZDA6', '2024-06-09 01:40:10', NULL),
(778, 42, 'MAZDASPD3', 'MAZDASPEED3', '2024-06-09 01:40:10', NULL),
(779, 42, 'MAZDASPD6', 'MAZDASPEED6', '2024-06-09 01:40:10', NULL),
(780, 42, 'MIATA', 'Miata MX5', '2024-06-09 01:40:10', NULL),
(781, 42, 'MILL', 'Millenia', '2024-06-09 01:40:10', NULL),
(782, 42, 'MPV', 'MPV', '2024-06-09 01:40:10', NULL),
(783, 42, 'MX3', 'MX3', '2024-06-09 01:40:10', NULL),
(784, 42, 'MX6', 'MX6', '2024-06-09 01:40:10', NULL),
(785, 42, 'NAVAJO', 'Navajo', '2024-06-09 01:40:10', NULL),
(786, 42, 'PROTE', 'Protege', '2024-06-09 01:40:10', NULL),
(787, 42, 'PROTE5', 'Protege5', '2024-06-09 01:40:10', NULL),
(788, 42, 'RX7', 'RX-7', '2024-06-09 01:40:10', NULL),
(789, 42, 'RX8', 'RX-8', '2024-06-09 01:40:10', NULL),
(790, 42, 'TRIBUTE', 'Tribute', '2024-06-09 01:40:10', NULL),
(791, 42, 'MAZOTH', 'Other Mazda Models', '2024-06-09 01:40:10', NULL),
(792, 43, 'MP4', 'MP4-12C', '2024-06-09 01:40:10', NULL),
(793, 44, '190_CLASS', '190 Class (2)', '2024-06-09 01:40:10', NULL),
(794, 44, '190D', ' - 190D', '2024-06-09 01:40:10', NULL),
(795, 44, '190E', ' - 190E', '2024-06-09 01:40:10', NULL),
(796, 44, '240_CLASS', '240 Class (1)', '2024-06-09 01:40:10', NULL),
(797, 44, '240D', ' - 240D', '2024-06-09 01:40:10', NULL),
(798, 44, '300_CLASS_E_CLASS', '300 Class / E Class (6)', '2024-06-09 01:40:10', NULL),
(799, 44, '300CD', ' - 300CD', '2024-06-09 01:40:10', NULL),
(800, 44, '300CE', ' - 300CE', '2024-06-09 01:40:10', NULL),
(801, 44, '300D', ' - 300D', '2024-06-09 01:40:10', NULL),
(802, 44, '300E', ' - 300E', '2024-06-09 01:40:10', NULL),
(803, 44, '300TD', ' - 300TD', '2024-06-09 01:40:10', NULL),
(804, 44, '300TE', ' - 300TE', '2024-06-09 01:40:10', NULL),
(805, 44, 'C_CLASS', 'C Class (13)', '2024-06-09 01:40:10', NULL),
(806, 44, 'C220', ' - C220', '2024-06-09 01:40:10', NULL),
(807, 44, 'C230', ' - C230', '2024-06-09 01:40:10', NULL),
(808, 44, 'C240', ' - C240', '2024-06-09 01:40:10', NULL),
(809, 44, 'C250', ' - C250', '2024-06-09 01:40:10', NULL),
(810, 44, 'C280', ' - C280', '2024-06-09 01:40:10', NULL),
(811, 44, 'C300', ' - C300', '2024-06-09 01:40:10', NULL),
(812, 44, 'C320', ' - C320', '2024-06-09 01:40:10', NULL),
(813, 44, 'C32AMG', ' - C32 AMG', '2024-06-09 01:40:10', NULL),
(814, 44, 'C350', ' - C350', '2024-06-09 01:40:10', NULL),
(815, 44, 'C36AMG', ' - C36 AMG', '2024-06-09 01:40:10', NULL),
(816, 44, 'C43AMG', ' - C43 AMG', '2024-06-09 01:40:10', NULL),
(817, 44, 'C55AMG', ' - C55 AMG', '2024-06-09 01:40:10', NULL),
(818, 44, 'C63AMG', ' - C63 AMG', '2024-06-09 01:40:10', NULL),
(819, 44, 'CL_CLASS', 'CL Class (6)', '2024-06-09 01:40:10', NULL),
(820, 44, 'CL500', ' - CL500', '2024-06-09 01:40:10', NULL),
(821, 44, 'CL550', ' - CL550', '2024-06-09 01:40:10', NULL),
(822, 44, 'CL55AMG', ' - CL55 AMG', '2024-06-09 01:40:10', NULL),
(823, 44, 'CL600', ' - CL600', '2024-06-09 01:40:10', NULL),
(824, 44, 'CL63AMG', ' - CL63 AMG', '2024-06-09 01:40:10', NULL),
(825, 44, 'CL65AMG', ' - CL65 AMG', '2024-06-09 01:40:10', NULL),
(826, 44, 'CLK_CLASS', 'CLK Class (7)', '2024-06-09 01:40:10', NULL),
(827, 44, 'CLK320', ' - CLK320', '2024-06-09 01:40:10', NULL),
(828, 44, 'CLK350', ' - CLK350', '2024-06-09 01:40:10', NULL),
(829, 44, 'CLK430', ' - CLK430', '2024-06-09 01:40:10', NULL),
(830, 44, 'CLK500', ' - CLK500', '2024-06-09 01:40:10', NULL),
(831, 44, 'CLK550', ' - CLK550', '2024-06-09 01:40:10', NULL),
(832, 44, 'CLK55AMG', ' - CLK55 AMG', '2024-06-09 01:40:10', NULL),
(833, 44, 'CLK63AMG', ' - CLK63 AMG', '2024-06-09 01:40:10', NULL),
(834, 44, 'CLS_CLASS', 'CLS Class (4)', '2024-06-09 01:40:10', NULL),
(835, 44, 'CLS500', ' - CLS500', '2024-06-09 01:40:10', NULL),
(836, 44, 'CLS550', ' - CLS550', '2024-06-09 01:40:10', NULL),
(837, 44, 'CLS55AMG', ' - CLS55 AMG', '2024-06-09 01:40:10', NULL),
(838, 44, 'CLS63AMG', ' - CLS63 AMG', '2024-06-09 01:40:10', NULL),
(839, 44, 'E_CLASS', 'E Class (18)', '2024-06-09 01:40:10', NULL);
INSERT INTO `model` (`id`, `make_id`, `code`, `title`, `created_at`, `updated_at`) VALUES
(840, 44, '260E', ' - 260E', '2024-06-09 01:40:10', NULL),
(841, 44, '280CE', ' - 280CE', '2024-06-09 01:40:10', NULL),
(842, 44, '280E', ' - 280E', '2024-06-09 01:40:10', NULL),
(843, 44, '400E', ' - 400E', '2024-06-09 01:40:10', NULL),
(844, 44, '500E', ' - 500E', '2024-06-09 01:40:10', NULL),
(845, 44, 'E300', ' - E300', '2024-06-09 01:40:10', NULL),
(846, 44, 'E320', ' - E320', '2024-06-09 01:40:10', NULL),
(847, 44, 'E320BLUE', ' - E320 Bluetec', '2024-06-09 01:40:10', NULL),
(848, 44, 'E320CDI', ' - E320 CDI', '2024-06-09 01:40:10', NULL),
(849, 44, 'E350', ' - E350', '2024-06-09 01:40:10', NULL),
(850, 44, 'E350BLUE', ' - E350 Bluetec', '2024-06-09 01:40:10', NULL),
(851, 44, 'E400', ' - E400 Hybrid', '2024-06-09 01:40:10', NULL),
(852, 44, 'E420', ' - E420', '2024-06-09 01:40:10', NULL),
(853, 44, 'E430', ' - E430', '2024-06-09 01:40:10', NULL),
(854, 44, 'E500', ' - E500', '2024-06-09 01:40:10', NULL),
(855, 44, 'E550', ' - E550', '2024-06-09 01:40:10', NULL),
(856, 44, 'E55AMG', ' - E55 AMG', '2024-06-09 01:40:10', NULL),
(857, 44, 'E63AMG', ' - E63 AMG', '2024-06-09 01:40:10', NULL),
(858, 44, 'G_CLASS', 'G Class (4)', '2024-06-09 01:40:10', NULL),
(859, 44, 'G500', ' - G500', '2024-06-09 01:40:10', NULL),
(860, 44, 'G550', ' - G550', '2024-06-09 01:40:10', NULL),
(861, 44, 'G55AMG', ' - G55 AMG', '2024-06-09 01:40:10', NULL),
(862, 44, 'G63AMG', ' - G63 AMG', '2024-06-09 01:40:10', NULL),
(863, 44, 'GL_CLASS', 'GL Class (5)', '2024-06-09 01:40:10', NULL),
(864, 44, 'GL320BLUE', ' - GL320 Bluetec', '2024-06-09 01:40:10', NULL),
(865, 44, 'GL320CDI', ' - GL320 CDI', '2024-06-09 01:40:10', NULL),
(866, 44, 'GL350BLUE', ' - GL350 Bluetec', '2024-06-09 01:40:10', NULL),
(867, 44, 'GL450', ' - GL450', '2024-06-09 01:40:10', NULL),
(868, 44, 'GL550', ' - GL550', '2024-06-09 01:40:10', NULL),
(869, 44, 'GLK_CLASS', 'GLK Class (1)', '2024-06-09 01:40:10', NULL),
(870, 44, 'GLK350', ' - GLK350', '2024-06-09 01:40:10', NULL),
(871, 44, 'M_CLASS', 'M Class (11)', '2024-06-09 01:40:10', NULL),
(872, 44, 'ML320', ' - ML320', '2024-06-09 01:40:10', NULL),
(873, 44, 'ML320BLUE', ' - ML320 Bluetec', '2024-06-09 01:40:10', NULL),
(874, 44, 'ML320CDI', ' - ML320 CDI', '2024-06-09 01:40:10', NULL),
(875, 44, 'ML350', ' - ML350', '2024-06-09 01:40:10', NULL),
(876, 44, 'ML350BLUE', ' - ML350 Bluetec', '2024-06-09 01:40:10', NULL),
(877, 44, 'ML430', ' - ML430', '2024-06-09 01:40:10', NULL),
(878, 44, 'ML450HY', ' - ML450 Hybrid', '2024-06-09 01:40:10', NULL),
(879, 44, 'ML500', ' - ML500', '2024-06-09 01:40:10', NULL),
(880, 44, 'ML550', ' - ML550', '2024-06-09 01:40:10', NULL),
(881, 44, 'ML55AMG', ' - ML55 AMG', '2024-06-09 01:40:10', NULL),
(882, 44, 'ML63AMG', ' - ML63 AMG', '2024-06-09 01:40:10', NULL),
(883, 44, 'R_CLASS', 'R Class (6)', '2024-06-09 01:40:10', NULL),
(884, 44, 'R320BLUE', ' - R320 Bluetec', '2024-06-09 01:40:10', NULL),
(885, 44, 'R320CDI', ' - R320 CDI', '2024-06-09 01:40:10', NULL),
(886, 44, 'R350', ' - R350', '2024-06-09 01:40:10', NULL),
(887, 44, 'R350BLUE', ' - R350 Bluetec', '2024-06-09 01:40:10', NULL),
(888, 44, 'R500', ' - R500', '2024-06-09 01:40:10', NULL),
(889, 44, 'R63AMG', ' - R63 AMG', '2024-06-09 01:40:10', NULL),
(890, 44, 'S_CLASS', 'S Class (30)', '2024-06-09 01:40:10', NULL),
(891, 44, '300SD', ' - 300SD', '2024-06-09 01:40:10', NULL),
(892, 44, '300SDL', ' - 300SDL', '2024-06-09 01:40:10', NULL),
(893, 44, '300SE', ' - 300SE', '2024-06-09 01:40:10', NULL),
(894, 44, '300SEL', ' - 300SEL', '2024-06-09 01:40:10', NULL),
(895, 44, '350SD', ' - 350SD', '2024-06-09 01:40:10', NULL),
(896, 44, '350SDL', ' - 350SDL', '2024-06-09 01:40:10', NULL),
(897, 44, '380SE', ' - 380SE', '2024-06-09 01:40:10', NULL),
(898, 44, '380SEC', ' - 380SEC', '2024-06-09 01:40:10', NULL),
(899, 44, '380SEL', ' - 380SEL', '2024-06-09 01:40:10', NULL),
(900, 44, '400SE', ' - 400SE', '2024-06-09 01:40:10', NULL),
(901, 44, '400SEL', ' - 400SEL', '2024-06-09 01:40:10', NULL),
(902, 44, '420SEL', ' - 420SEL', '2024-06-09 01:40:10', NULL),
(903, 44, '500SEC', ' - 500SEC', '2024-06-09 01:40:10', NULL),
(904, 44, '500SEL', ' - 500SEL', '2024-06-09 01:40:10', NULL),
(905, 44, '560SEC', ' - 560SEC', '2024-06-09 01:40:10', NULL),
(906, 44, '560SEL', ' - 560SEL', '2024-06-09 01:40:10', NULL),
(907, 44, '600SEC', ' - 600SEC', '2024-06-09 01:40:10', NULL),
(908, 44, '600SEL', ' - 600SEL', '2024-06-09 01:40:10', NULL),
(909, 44, 'S320', ' - S320', '2024-06-09 01:40:10', NULL),
(910, 44, 'S350', ' - S350', '2024-06-09 01:40:10', NULL),
(911, 44, 'S350BLUE', ' - S350 Bluetec', '2024-06-09 01:40:10', NULL),
(912, 44, 'S400HY', ' - S400 Hybrid', '2024-06-09 01:40:10', NULL),
(913, 44, 'S420', ' - S420', '2024-06-09 01:40:10', NULL),
(914, 44, 'S430', ' - S430', '2024-06-09 01:40:10', NULL),
(915, 44, 'S500', ' - S500', '2024-06-09 01:40:10', NULL),
(916, 44, 'S550', ' - S550', '2024-06-09 01:40:10', NULL),
(917, 44, 'S55AMG', ' - S55 AMG', '2024-06-09 01:40:10', NULL),
(918, 44, 'S600', ' - S600', '2024-06-09 01:40:10', NULL),
(919, 44, 'S63AMG', ' - S63 AMG', '2024-06-09 01:40:10', NULL),
(920, 44, 'S65AMG', ' - S65 AMG', '2024-06-09 01:40:10', NULL),
(921, 44, 'SL_CLASS', 'SL Class (13)', '2024-06-09 01:40:10', NULL),
(922, 44, '300SL', ' - 300SL', '2024-06-09 01:40:10', NULL),
(923, 44, '380SL', ' - 380SL', '2024-06-09 01:40:10', NULL),
(924, 44, '380SLC', ' - 380SLC', '2024-06-09 01:40:10', NULL),
(925, 44, '500SL', ' - 500SL', '2024-06-09 01:40:10', NULL),
(926, 44, '560SL', ' - 560SL', '2024-06-09 01:40:10', NULL),
(927, 44, '600SL', ' - 600SL', '2024-06-09 01:40:10', NULL),
(928, 44, 'SL320', ' - SL320', '2024-06-09 01:40:10', NULL),
(929, 44, 'SL500', ' - SL500', '2024-06-09 01:40:10', NULL),
(930, 44, 'SL550', ' - SL550', '2024-06-09 01:40:10', NULL),
(931, 44, 'SL55AMG', ' - SL55 AMG', '2024-06-09 01:40:10', NULL),
(932, 44, 'SL600', ' - SL600', '2024-06-09 01:40:10', NULL),
(933, 44, 'SL63AMG', ' - SL63 AMG', '2024-06-09 01:40:10', NULL),
(934, 44, 'SL65AMG', ' - SL65 AMG', '2024-06-09 01:40:10', NULL),
(935, 44, 'SLK_CLASS', 'SLK Class (8)', '2024-06-09 01:40:10', NULL),
(936, 44, 'SLK230', ' - SLK230', '2024-06-09 01:40:10', NULL),
(937, 44, 'SLK250', ' - SLK250', '2024-06-09 01:40:10', NULL),
(938, 44, 'SLK280', ' - SLK280', '2024-06-09 01:40:10', NULL),
(939, 44, 'SLK300', ' - SLK300', '2024-06-09 01:40:10', NULL),
(940, 44, 'SLK320', ' - SLK320', '2024-06-09 01:40:10', NULL),
(941, 44, 'SLK32AMG', ' - SLK32 AMG', '2024-06-09 01:40:10', NULL),
(942, 44, 'SLK350', ' - SLK350', '2024-06-09 01:40:10', NULL),
(943, 44, 'SLK55AMG', ' - SLK55 AMG', '2024-06-09 01:40:10', NULL),
(944, 44, 'SLR_CLASS', 'SLR Class (1)', '2024-06-09 01:40:10', NULL),
(945, 44, 'SLR', ' - SLR', '2024-06-09 01:40:10', NULL),
(946, 44, 'SLS_CLASS', 'SLS Class (1)', '2024-06-09 01:40:10', NULL),
(947, 44, 'SLSAMG', ' - SLS AMG', '2024-06-09 01:40:10', NULL),
(948, 44, 'SPRINTER_CLASS', 'Sprinter Class (1)', '2024-06-09 01:40:10', NULL),
(949, 44, 'MBSPRINTER', ' - Sprinter', '2024-06-09 01:40:10', NULL),
(950, 44, 'MBOTH', 'Other Mercedes-Benz Models', '2024-06-09 01:40:10', NULL),
(951, 45, 'CAPRI', 'Capri', '2024-06-09 01:40:10', NULL),
(952, 45, 'COUGAR', 'Cougar', '2024-06-09 01:40:10', NULL),
(953, 45, 'MERCGRAND', 'Grand Marquis', '2024-06-09 01:40:10', NULL),
(954, 45, 'LYNX', 'Lynx', '2024-06-09 01:40:10', NULL),
(955, 45, 'MARAUDER', 'Marauder', '2024-06-09 01:40:10', NULL),
(956, 45, 'MARINER', 'Mariner', '2024-06-09 01:40:10', NULL),
(957, 45, 'MARQ', 'Marquis', '2024-06-09 01:40:10', NULL),
(958, 45, 'MILAN', 'Milan', '2024-06-09 01:40:10', NULL),
(959, 45, 'MONTEGO', 'Montego', '2024-06-09 01:40:10', NULL),
(960, 45, 'MONTEREY', 'Monterey', '2024-06-09 01:40:10', NULL),
(961, 45, 'MOUNTA', 'Mountaineer', '2024-06-09 01:40:10', NULL),
(962, 45, 'MYSTIQ', 'Mystique', '2024-06-09 01:40:10', NULL),
(963, 45, 'SABLE', 'Sable', '2024-06-09 01:40:10', NULL),
(964, 45, 'TOPAZ', 'Topaz', '2024-06-09 01:40:10', NULL),
(965, 45, 'TRACER', 'Tracer', '2024-06-09 01:40:10', NULL),
(966, 45, 'VILLA', 'Villager', '2024-06-09 01:40:10', NULL),
(967, 45, 'MERCZEP', 'Zephyr', '2024-06-09 01:40:10', NULL),
(968, 45, 'MEOTH', 'Other Mercury Models', '2024-06-09 01:40:10', NULL),
(969, 46, 'SCORP', 'Scorpio', '2024-06-09 01:40:10', NULL),
(970, 46, 'XR4TI', 'XR4Ti', '2024-06-09 01:40:10', NULL),
(971, 46, 'MEROTH', 'Other Merkur Models', '2024-06-09 01:40:10', NULL),
(972, 47, 'COOPRCLUB_MODELS', 'Cooper Clubman Models (2)', '2024-06-09 01:40:10', NULL),
(973, 47, 'COOPERCLUB', ' - Cooper Clubman', '2024-06-09 01:40:10', NULL),
(974, 47, 'COOPRCLUBS', ' - Cooper S Clubman', '2024-06-09 01:40:10', NULL),
(975, 47, 'COOPCOUNTRY_MODELS', 'Cooper Countryman Models (2)', '2024-06-09 01:40:10', NULL),
(976, 47, 'COUNTRYMAN', ' - Cooper Countryman', '2024-06-09 01:40:10', NULL),
(977, 47, 'COUNTRYMNS', ' - Cooper S Countryman', '2024-06-09 01:40:10', NULL),
(978, 47, 'COOPCOUP_MODELS', 'Cooper Coupe Models (2)', '2024-06-09 01:40:10', NULL),
(979, 47, 'MINICOUPE', ' - Cooper Coupe', '2024-06-09 01:40:10', NULL),
(980, 47, 'MINISCOUPE', ' - Cooper S Coupe', '2024-06-09 01:40:10', NULL),
(981, 47, 'COOPER_MODELS', 'Cooper Models (2)', '2024-06-09 01:40:10', NULL),
(982, 47, 'COOPER', ' - Cooper', '2024-06-09 01:40:10', NULL),
(983, 47, 'COOPERS', ' - Cooper S', '2024-06-09 01:40:10', NULL),
(984, 47, 'COOPRROAD_MODELS', 'Cooper Roadster Models (2)', '2024-06-09 01:40:10', NULL),
(985, 47, 'COOPERROAD', ' - Cooper Roadster', '2024-06-09 01:40:10', NULL),
(986, 47, 'COOPERSRD', ' - Cooper S Roadster', '2024-06-09 01:40:10', NULL),
(987, 48, '3000GT', '3000GT', '2024-06-09 01:40:10', NULL),
(988, 48, 'CORD', 'Cordia', '2024-06-09 01:40:10', NULL),
(989, 48, 'DIAMAN', 'Diamante', '2024-06-09 01:40:10', NULL),
(990, 48, 'ECLIP', 'Eclipse', '2024-06-09 01:40:10', NULL),
(991, 48, 'ENDEAVOR', 'Endeavor', '2024-06-09 01:40:10', NULL),
(992, 48, 'MITEXP', 'Expo', '2024-06-09 01:40:10', NULL),
(993, 48, 'GALANT', 'Galant', '2024-06-09 01:40:10', NULL),
(994, 48, 'MITI', 'i', '2024-06-09 01:40:10', NULL),
(995, 48, 'LANCERMITS', 'Lancer', '2024-06-09 01:40:10', NULL),
(996, 48, 'LANCEREVO', 'Lancer Evolution', '2024-06-09 01:40:10', NULL),
(997, 48, 'MITPU', 'Mighty Max', '2024-06-09 01:40:10', NULL),
(998, 48, 'MIRAGE', 'Mirage', '2024-06-09 01:40:10', NULL),
(999, 48, 'MONT', 'Montero', '2024-06-09 01:40:10', NULL),
(1000, 48, 'MONTSPORT', 'Montero Sport', '2024-06-09 01:40:10', NULL),
(1001, 48, 'OUTLANDER', 'Outlander', '2024-06-09 01:40:10', NULL),
(1002, 48, 'OUTLANDSPT', 'Outlander Sport', '2024-06-09 01:40:10', NULL),
(1003, 48, 'PRECIS', 'Precis', '2024-06-09 01:40:10', NULL),
(1004, 48, 'RAIDERMITS', 'Raider', '2024-06-09 01:40:10', NULL),
(1005, 48, 'SIGMA', 'Sigma', '2024-06-09 01:40:10', NULL),
(1006, 48, 'MITSTAR', 'Starion', '2024-06-09 01:40:10', NULL),
(1007, 48, 'TRED', 'Tredia', '2024-06-09 01:40:10', NULL),
(1008, 48, 'MITVAN', 'Van', '2024-06-09 01:40:10', NULL),
(1009, 48, 'MITOTH', 'Other Mitsubishi Models', '2024-06-09 01:40:10', NULL),
(1010, 49, 'NIS200SX', '200SX', '2024-06-09 01:40:10', NULL),
(1011, 49, '240SX', '240SX', '2024-06-09 01:40:10', NULL),
(1012, 49, '300ZXTURBO', '300ZX', '2024-06-09 01:40:10', NULL),
(1013, 49, '350Z', '350Z', '2024-06-09 01:40:10', NULL),
(1014, 49, '370Z', '370Z', '2024-06-09 01:40:10', NULL),
(1015, 49, 'ALTIMA', 'Altima', '2024-06-09 01:40:10', NULL),
(1016, 49, 'PATHARMADA', 'Armada', '2024-06-09 01:40:10', NULL),
(1017, 49, 'AXXESS', 'Axxess', '2024-06-09 01:40:10', NULL),
(1018, 49, 'CUBE', 'Cube', '2024-06-09 01:40:10', NULL),
(1019, 49, 'FRONTI', 'Frontier', '2024-06-09 01:40:10', NULL),
(1020, 49, 'GT-R', 'GT-R', '2024-06-09 01:40:10', NULL),
(1021, 49, 'JUKE', 'Juke', '2024-06-09 01:40:10', NULL),
(1022, 49, 'LEAF', 'Leaf', '2024-06-09 01:40:10', NULL),
(1023, 49, 'MAX', 'Maxima', '2024-06-09 01:40:10', NULL),
(1024, 49, 'MURANO', 'Murano', '2024-06-09 01:40:10', NULL),
(1025, 49, 'MURANOCROS', 'Murano CrossCabriolet', '2024-06-09 01:40:10', NULL),
(1026, 49, 'NV', 'NV', '2024-06-09 01:40:10', NULL),
(1027, 49, 'NX', 'NX', '2024-06-09 01:40:10', NULL),
(1028, 49, 'PATH', 'Pathfinder', '2024-06-09 01:40:10', NULL),
(1029, 49, 'NISPU', 'Pickup', '2024-06-09 01:40:10', NULL),
(1030, 49, 'PULSAR', 'Pulsar', '2024-06-09 01:40:10', NULL),
(1031, 49, 'QUEST', 'Quest', '2024-06-09 01:40:10', NULL),
(1032, 49, 'ROGUE', 'Rogue', '2024-06-09 01:40:10', NULL),
(1033, 49, 'SENTRA', 'Sentra', '2024-06-09 01:40:10', NULL),
(1034, 49, 'STANZA', 'Stanza', '2024-06-09 01:40:10', NULL),
(1035, 49, 'TITAN', 'Titan', '2024-06-09 01:40:10', NULL),
(1036, 49, 'NISVAN', 'Van', '2024-06-09 01:40:10', NULL),
(1037, 49, 'VERSA', 'Versa', '2024-06-09 01:40:10', NULL),
(1038, 49, 'XTERRA', 'Xterra', '2024-06-09 01:40:10', NULL),
(1039, 49, 'NISSOTH', 'Other Nissan Models', '2024-06-09 01:40:10', NULL),
(1040, 50, '88', '88', '2024-06-09 01:40:10', NULL),
(1041, 50, 'ACHIEV', 'Achieva', '2024-06-09 01:40:10', NULL),
(1042, 50, 'ALERO', 'Alero', '2024-06-09 01:40:10', NULL),
(1043, 50, 'AURORA', 'Aurora', '2024-06-09 01:40:10', NULL),
(1044, 50, 'BRAV', 'Bravada', '2024-06-09 01:40:10', NULL),
(1045, 50, 'CUCR', 'Custom Cruiser', '2024-06-09 01:40:10', NULL),
(1046, 50, 'OLDCUS', 'Cutlass', '2024-06-09 01:40:10', NULL),
(1047, 50, 'OLDCALAIS', 'Cutlass Calais', '2024-06-09 01:40:10', NULL),
(1048, 50, 'CIERA', 'Cutlass Ciera', '2024-06-09 01:40:10', NULL),
(1049, 50, 'CSUPR', 'Cutlass Supreme', '2024-06-09 01:40:10', NULL),
(1050, 50, 'OLDSFIR', 'Firenza', '2024-06-09 01:40:10', NULL),
(1051, 50, 'INTRIG', 'Intrigue', '2024-06-09 01:40:10', NULL),
(1052, 50, '98', 'Ninety-Eight', '2024-06-09 01:40:10', NULL),
(1053, 50, 'OMEG', 'Omega', '2024-06-09 01:40:10', NULL),
(1054, 50, 'REGEN', 'Regency', '2024-06-09 01:40:10', NULL),
(1055, 50, 'SILHO', 'Silhouette', '2024-06-09 01:40:10', NULL),
(1056, 50, 'TORO', 'Toronado', '2024-06-09 01:40:10', NULL),
(1057, 50, 'OLDOTH', 'Other Oldsmobile Models', '2024-06-09 01:40:10', NULL),
(1058, 51, '405', '405', '2024-06-09 01:40:10', NULL),
(1059, 51, '504', '504', '2024-06-09 01:40:10', NULL),
(1060, 51, '505', '505', '2024-06-09 01:40:10', NULL),
(1061, 51, '604', '604', '2024-06-09 01:40:10', NULL),
(1062, 51, 'UNAVAILPEU', 'Other Peugeot Models', '2024-06-09 01:40:10', NULL),
(1063, 52, 'ACC', 'Acclaim', '2024-06-09 01:40:10', NULL),
(1064, 52, 'ARROW', 'Arrow', '2024-06-09 01:40:10', NULL),
(1065, 52, 'BREEZE', 'Breeze', '2024-06-09 01:40:10', NULL),
(1066, 52, 'CARAVE', 'Caravelle', '2024-06-09 01:40:10', NULL),
(1067, 52, 'CHAMP', 'Champ', '2024-06-09 01:40:10', NULL),
(1068, 52, 'COLT', 'Colt', '2024-06-09 01:40:10', NULL),
(1069, 52, 'PLYMCONQ', 'Conquest', '2024-06-09 01:40:10', NULL),
(1070, 52, 'GRANFURY', 'Gran Fury', '2024-06-09 01:40:10', NULL),
(1071, 52, 'PLYMGRANV', 'Grand Voyager', '2024-06-09 01:40:10', NULL),
(1072, 52, 'HORI', 'Horizon', '2024-06-09 01:40:10', NULL),
(1073, 52, 'LASER', 'Laser', '2024-06-09 01:40:10', NULL),
(1074, 52, 'NEON', 'Neon', '2024-06-09 01:40:10', NULL),
(1075, 52, 'PROWLE', 'Prowler', '2024-06-09 01:40:10', NULL),
(1076, 52, 'RELI', 'Reliant', '2024-06-09 01:40:10', NULL),
(1077, 52, 'SAPPOROPLY', 'Sapporo', '2024-06-09 01:40:10', NULL),
(1078, 52, 'SCAMP', 'Scamp', '2024-06-09 01:40:10', NULL),
(1079, 52, 'SUNDAN', 'Sundance', '2024-06-09 01:40:10', NULL),
(1080, 52, 'TRAILDUST', 'Trailduster', '2024-06-09 01:40:10', NULL),
(1081, 52, 'VOYA', 'Voyager', '2024-06-09 01:40:10', NULL),
(1082, 52, 'PLYOTH', 'Other Plymouth Models', '2024-06-09 01:40:10', NULL),
(1083, 53, 'T-1000', '1000', '2024-06-09 01:40:10', NULL),
(1084, 53, '6000', '6000', '2024-06-09 01:40:10', NULL),
(1085, 53, 'AZTEK', 'Aztek', '2024-06-09 01:40:10', NULL),
(1086, 53, 'BON', 'Bonneville', '2024-06-09 01:40:10', NULL),
(1087, 53, 'CATALINA', 'Catalina', '2024-06-09 01:40:10', NULL),
(1088, 53, 'FIERO', 'Fiero', '2024-06-09 01:40:10', NULL),
(1089, 53, 'FBIRD', 'Firebird', '2024-06-09 01:40:10', NULL),
(1090, 53, 'G3', 'G3', '2024-06-09 01:40:10', NULL),
(1091, 53, 'G5', 'G5', '2024-06-09 01:40:10', NULL),
(1092, 53, 'G6', 'G6', '2024-06-09 01:40:10', NULL),
(1093, 53, 'G8', 'G8', '2024-06-09 01:40:10', NULL),
(1094, 53, 'GRNDAM', 'Grand Am', '2024-06-09 01:40:10', NULL),
(1095, 53, 'GP', 'Grand Prix', '2024-06-09 01:40:10', NULL),
(1096, 53, 'GTO', 'GTO', '2024-06-09 01:40:10', NULL),
(1097, 53, 'J2000', 'J2000', '2024-06-09 01:40:10', NULL),
(1098, 53, 'LEMANS', 'Le Mans', '2024-06-09 01:40:10', NULL),
(1099, 53, 'MONTANA', 'Montana', '2024-06-09 01:40:10', NULL),
(1100, 53, 'PARISI', 'Parisienne', '2024-06-09 01:40:10', NULL),
(1101, 53, 'PHOENIX', 'Phoenix', '2024-06-09 01:40:10', NULL),
(1102, 53, 'SAFARIPONT', 'Safari', '2024-06-09 01:40:10', NULL),
(1103, 53, 'SOLSTICE', 'Solstice', '2024-06-09 01:40:10', NULL),
(1104, 53, 'SUNBIR', 'Sunbird', '2024-06-09 01:40:10', NULL),
(1105, 53, 'SUNFIR', 'Sunfire', '2024-06-09 01:40:10', NULL),
(1106, 53, 'TORRENT', 'Torrent', '2024-06-09 01:40:10', NULL),
(1107, 53, 'TS', 'Trans Sport', '2024-06-09 01:40:10', NULL),
(1108, 53, 'VIBE', 'Vibe', '2024-06-09 01:40:10', NULL),
(1109, 53, 'PONOTH', 'Other Pontiac Models', '2024-06-09 01:40:10', NULL),
(1110, 54, '911', '911', '2024-06-09 01:40:10', NULL),
(1111, 54, '924', '924', '2024-06-09 01:40:10', NULL),
(1112, 54, '928', '928', '2024-06-09 01:40:10', NULL),
(1113, 54, '944', '944', '2024-06-09 01:40:10', NULL),
(1114, 54, '968', '968', '2024-06-09 01:40:10', NULL),
(1115, 54, 'BOXSTE', 'Boxster', '2024-06-09 01:40:10', NULL),
(1116, 54, 'CARRERAGT', 'Carrera GT', '2024-06-09 01:40:10', NULL),
(1117, 54, 'CAYENNE', 'Cayenne', '2024-06-09 01:40:10', NULL),
(1118, 54, 'CAYMAN', 'Cayman', '2024-06-09 01:40:10', NULL),
(1119, 54, 'PANAMERA', 'Panamera', '2024-06-09 01:40:10', NULL),
(1120, 54, 'POROTH', 'Other Porsche Models', '2024-06-09 01:40:10', NULL),
(1121, 55, 'RAM1504WD', '1500', '2024-06-09 01:40:10', NULL),
(1122, 55, 'RAM25002WD', '2500', '2024-06-09 01:40:10', NULL),
(1123, 55, 'RAM3502WD', '3500', '2024-06-09 01:40:10', NULL),
(1124, 55, 'RAM4500', '4500', '2024-06-09 01:40:10', NULL),
(1125, 56, '18I', '18i', '2024-06-09 01:40:10', NULL),
(1126, 56, 'FU', 'Fuego', '2024-06-09 01:40:10', NULL),
(1127, 56, 'LECAR', 'Le Car', '2024-06-09 01:40:10', NULL),
(1128, 56, 'R18', 'R18', '2024-06-09 01:40:10', NULL),
(1129, 56, 'RENSPORT', 'Sportwagon', '2024-06-09 01:40:10', NULL),
(1130, 56, 'UNAVAILREN', 'Other Renault Models', '2024-06-09 01:40:10', NULL),
(1131, 57, 'CAMAR', 'Camargue', '2024-06-09 01:40:10', NULL),
(1132, 57, 'CORN', 'Corniche', '2024-06-09 01:40:10', NULL),
(1133, 57, 'GHOST', 'Ghost', '2024-06-09 01:40:10', NULL),
(1134, 57, 'PARKWARD', 'Park Ward', '2024-06-09 01:40:10', NULL),
(1135, 57, 'PHANT', 'Phantom', '2024-06-09 01:40:10', NULL),
(1136, 57, 'DAWN', 'Silver Dawn', '2024-06-09 01:40:10', NULL),
(1137, 57, 'SILSERAPH', 'Silver Seraph', '2024-06-09 01:40:10', NULL),
(1138, 57, 'RRSPIR', 'Silver Spirit', '2024-06-09 01:40:10', NULL),
(1139, 57, 'SPUR', 'Silver Spur', '2024-06-09 01:40:10', NULL),
(1140, 57, 'UNAVAILRR', 'Other Rolls-Royce Models', '2024-06-09 01:40:10', NULL),
(1141, 58, '9-2X', '9-2X', '2024-06-09 01:40:10', NULL),
(1142, 58, '9-3', '9-3', '2024-06-09 01:40:10', NULL),
(1143, 58, '9-4X', '9-4X', '2024-06-09 01:40:10', NULL),
(1144, 58, '9-5', '9-5', '2024-06-09 01:40:10', NULL),
(1145, 58, '97X', '9-7X', '2024-06-09 01:40:10', NULL),
(1146, 58, '900', '900', '2024-06-09 01:40:10', NULL),
(1147, 58, '9000', '9000', '2024-06-09 01:40:10', NULL),
(1148, 58, 'SAOTH', 'Other Saab Models', '2024-06-09 01:40:10', NULL),
(1149, 59, 'ASTRA', 'Astra', '2024-06-09 01:40:10', NULL),
(1150, 59, 'AURA', 'Aura', '2024-06-09 01:40:10', NULL),
(1151, 59, 'ION', 'ION', '2024-06-09 01:40:10', NULL),
(1152, 59, 'L_SERIES', 'L Series (3)', '2024-06-09 01:40:10', NULL),
(1153, 59, 'L100', ' - L100', '2024-06-09 01:40:10', NULL),
(1154, 59, 'L200', ' - L200', '2024-06-09 01:40:10', NULL),
(1155, 59, 'L300', ' - L300', '2024-06-09 01:40:10', NULL),
(1156, 59, 'LSSATURN', 'LS', '2024-06-09 01:40:10', NULL),
(1157, 59, 'LW_SERIES', 'LW Series (4)', '2024-06-09 01:40:10', NULL),
(1158, 59, 'LW', ' - LW1', '2024-06-09 01:40:10', NULL),
(1159, 59, 'LW2', ' - LW2', '2024-06-09 01:40:10', NULL),
(1160, 59, 'LW200', ' - LW200', '2024-06-09 01:40:10', NULL),
(1161, 59, 'LW300', ' - LW300', '2024-06-09 01:40:10', NULL),
(1162, 59, 'OUTLOOK', 'Outlook', '2024-06-09 01:40:10', NULL),
(1163, 59, 'RELAY', 'Relay', '2024-06-09 01:40:10', NULL),
(1164, 59, 'SC_SERIES', 'SC Series (2)', '2024-06-09 01:40:10', NULL),
(1165, 59, 'SC1', ' - SC1', '2024-06-09 01:40:10', NULL),
(1166, 59, 'SC2', ' - SC2', '2024-06-09 01:40:10', NULL),
(1167, 59, 'SKY', 'Sky', '2024-06-09 01:40:10', NULL),
(1168, 59, 'SL_SERIES', 'SL Series (3)', '2024-06-09 01:40:10', NULL),
(1169, 59, 'SL', ' - SL', '2024-06-09 01:40:10', NULL),
(1170, 59, 'SL1', ' - SL1', '2024-06-09 01:40:10', NULL),
(1171, 59, 'SL2', ' - SL2', '2024-06-09 01:40:10', NULL),
(1172, 59, 'SW_SERIES', 'SW Series (2)', '2024-06-09 01:40:10', NULL),
(1173, 59, 'SW1', ' - SW1', '2024-06-09 01:40:10', NULL),
(1174, 59, 'SW2', ' - SW2', '2024-06-09 01:40:10', NULL),
(1175, 59, 'VUE', 'Vue', '2024-06-09 01:40:10', NULL),
(1176, 59, 'SATOTH', 'Other Saturn Models', '2024-06-09 01:40:10', NULL),
(1177, 60, 'SCIFRS', 'FR-S', '2024-06-09 01:40:10', NULL),
(1178, 60, 'IQ', 'iQ', '2024-06-09 01:40:10', NULL),
(1179, 60, 'TC', 'tC', '2024-06-09 01:40:10', NULL),
(1180, 60, 'XA', 'xA', '2024-06-09 01:40:10', NULL),
(1181, 60, 'XB', 'xB', '2024-06-09 01:40:10', NULL),
(1182, 60, 'XD', 'xD', '2024-06-09 01:40:10', NULL),
(1183, 61, 'FORTWO', 'fortwo', '2024-06-09 01:40:10', NULL),
(1184, 61, 'SMOTH', 'Other smart Models', '2024-06-09 01:40:10', NULL),
(1185, 62, 'SRTVIPER', 'Viper', '2024-06-09 01:40:10', NULL),
(1186, 63, '825', '825', '2024-06-09 01:40:10', NULL),
(1187, 63, '827', '827', '2024-06-09 01:40:10', NULL),
(1188, 63, 'UNAVAILSTE', 'Other Sterling Models', '2024-06-09 01:40:10', NULL),
(1189, 64, 'BAJA', 'Baja', '2024-06-09 01:40:10', NULL),
(1190, 64, 'BRAT', 'Brat', '2024-06-09 01:40:10', NULL),
(1191, 64, 'SUBBRZ', 'BRZ', '2024-06-09 01:40:10', NULL),
(1192, 64, 'FOREST', 'Forester', '2024-06-09 01:40:10', NULL),
(1193, 64, 'IMPREZ', 'Impreza', '2024-06-09 01:40:10', NULL),
(1194, 64, 'IMPWRX', 'Impreza WRX', '2024-06-09 01:40:10', NULL),
(1195, 64, 'JUSTY', 'Justy', '2024-06-09 01:40:10', NULL),
(1196, 64, 'SUBL', 'L Series', '2024-06-09 01:40:10', NULL),
(1197, 64, 'LEGACY', 'Legacy', '2024-06-09 01:40:10', NULL),
(1198, 64, 'LOYALE', 'Loyale', '2024-06-09 01:40:10', NULL),
(1199, 64, 'SUBOUTBK', 'Outback', '2024-06-09 01:40:10', NULL),
(1200, 64, 'SVX', 'SVX', '2024-06-09 01:40:10', NULL),
(1201, 64, 'B9TRIBECA', 'Tribeca', '2024-06-09 01:40:10', NULL),
(1202, 64, 'XT', 'XT', '2024-06-09 01:40:10', NULL),
(1203, 64, 'XVCRSSTREK', 'XV Crosstrek', '2024-06-09 01:40:10', NULL),
(1204, 64, 'SUBOTH', 'Other Subaru Models', '2024-06-09 01:40:10', NULL),
(1205, 65, 'AERIO', 'Aerio', '2024-06-09 01:40:10', NULL),
(1206, 65, 'EQUATOR', 'Equator', '2024-06-09 01:40:10', NULL),
(1207, 65, 'ESTEEM', 'Esteem', '2024-06-09 01:40:10', NULL),
(1208, 65, 'FORENZA', 'Forenza', '2024-06-09 01:40:10', NULL),
(1209, 65, 'GRANDV', 'Grand Vitara', '2024-06-09 01:40:10', NULL),
(1210, 65, 'KIZASHI', 'Kizashi', '2024-06-09 01:40:10', NULL),
(1211, 65, 'RENO', 'Reno', '2024-06-09 01:40:10', NULL),
(1212, 65, 'SAMUR', 'Samurai', '2024-06-09 01:40:10', NULL),
(1213, 65, 'SIDE', 'Sidekick', '2024-06-09 01:40:10', NULL),
(1214, 65, 'SWIFT', 'Swift', '2024-06-09 01:40:10', NULL),
(1215, 65, 'SX4', 'SX4', '2024-06-09 01:40:10', NULL),
(1216, 65, 'VERONA', 'Verona', '2024-06-09 01:40:10', NULL),
(1217, 65, 'VITARA', 'Vitara', '2024-06-09 01:40:10', NULL),
(1218, 65, 'X90', 'X-90', '2024-06-09 01:40:10', NULL),
(1219, 65, 'XL7', 'XL7', '2024-06-09 01:40:10', NULL),
(1220, 65, 'SUZOTH', 'Other Suzuki Models', '2024-06-09 01:40:10', NULL),
(1221, 66, 'ROADSTER', 'Roadster', '2024-06-09 01:40:10', NULL),
(1222, 67, '4RUN', '4Runner', '2024-06-09 01:40:10', NULL),
(1223, 67, 'AVALON', 'Avalon', '2024-06-09 01:40:10', NULL),
(1224, 67, 'CAMRY', 'Camry', '2024-06-09 01:40:10', NULL),
(1225, 67, 'CELICA', 'Celica', '2024-06-09 01:40:10', NULL),
(1226, 67, 'COROL', 'Corolla', '2024-06-09 01:40:10', NULL),
(1227, 67, 'CORONA', 'Corona', '2024-06-09 01:40:10', NULL),
(1228, 67, 'CRESS', 'Cressida', '2024-06-09 01:40:10', NULL),
(1229, 67, 'ECHO', 'Echo', '2024-06-09 01:40:10', NULL),
(1230, 67, 'FJCRUIS', 'FJ Cruiser', '2024-06-09 01:40:10', NULL),
(1231, 67, 'HIGHLANDER', 'Highlander', '2024-06-09 01:40:10', NULL),
(1232, 67, 'LC', 'Land Cruiser', '2024-06-09 01:40:10', NULL),
(1233, 67, 'MATRIX', 'Matrix', '2024-06-09 01:40:10', NULL),
(1234, 67, 'MR2', 'MR2', '2024-06-09 01:40:10', NULL),
(1235, 67, 'MR2SPYDR', 'MR2 Spyder', '2024-06-09 01:40:10', NULL),
(1236, 67, 'PASEO', 'Paseo', '2024-06-09 01:40:10', NULL),
(1237, 67, 'PICKUP', 'Pickup', '2024-06-09 01:40:10', NULL),
(1238, 67, 'PREVIA', 'Previa', '2024-06-09 01:40:10', NULL),
(1239, 67, 'PRIUS', 'Prius', '2024-06-09 01:40:10', NULL),
(1240, 67, 'PRIUSC', 'Prius C', '2024-06-09 01:40:10', NULL),
(1241, 67, 'PRIUSV', 'Prius V', '2024-06-09 01:40:10', NULL),
(1242, 67, 'RAV4', 'RAV4', '2024-06-09 01:40:10', NULL),
(1243, 67, 'SEQUOIA', 'Sequoia', '2024-06-09 01:40:10', NULL),
(1244, 67, 'SIENNA', 'Sienna', '2024-06-09 01:40:10', NULL),
(1245, 67, 'SOLARA', 'Solara', '2024-06-09 01:40:10', NULL),
(1246, 67, 'STARLET', 'Starlet', '2024-06-09 01:40:10', NULL),
(1247, 67, 'SUPRA', 'Supra', '2024-06-09 01:40:10', NULL),
(1248, 67, 'T100', 'T100', '2024-06-09 01:40:10', NULL),
(1249, 67, 'TACOMA', 'Tacoma', '2024-06-09 01:40:10', NULL),
(1250, 67, 'TERCEL', 'Tercel', '2024-06-09 01:40:10', NULL),
(1251, 67, 'TUNDRA', 'Tundra', '2024-06-09 01:40:10', NULL),
(1252, 67, 'TOYVAN', 'Van', '2024-06-09 01:40:10', NULL),
(1253, 67, 'VENZA', 'Venza', '2024-06-09 01:40:10', NULL),
(1254, 67, 'YARIS', 'Yaris', '2024-06-09 01:40:10', NULL),
(1255, 67, 'TOYOTH', 'Other Toyota Models', '2024-06-09 01:40:10', NULL),
(1256, 68, 'TR7', 'TR7', '2024-06-09 01:40:10', NULL),
(1257, 68, 'TR8', 'TR8', '2024-06-09 01:40:10', NULL),
(1258, 68, 'TRIOTH', 'Other Triumph Models', '2024-06-09 01:40:10', NULL),
(1259, 69, 'BEETLE', 'Beetle', '2024-06-09 01:40:10', NULL),
(1260, 69, 'VOLKSCAB', 'Cabrio', '2024-06-09 01:40:10', NULL),
(1261, 69, 'CAB', 'Cabriolet', '2024-06-09 01:40:10', NULL),
(1262, 69, 'CC', 'CC', '2024-06-09 01:40:10', NULL),
(1263, 69, 'CORR', 'Corrado', '2024-06-09 01:40:10', NULL),
(1264, 69, 'DASHER', 'Dasher', '2024-06-09 01:40:10', NULL),
(1265, 69, 'EOS', 'Eos', '2024-06-09 01:40:10', NULL),
(1266, 69, 'EUROVAN', 'Eurovan', '2024-06-09 01:40:10', NULL),
(1267, 69, 'VOLKSFOX', 'Fox', '2024-06-09 01:40:10', NULL),
(1268, 69, 'GLI', 'GLI', '2024-06-09 01:40:10', NULL),
(1269, 69, 'GOLFR', 'Golf R', '2024-06-09 01:40:10', NULL),
(1270, 69, 'GTI', 'GTI', '2024-06-09 01:40:10', NULL),
(1271, 69, 'GOLFANDRABBITMODELS', 'Golf and Rabbit Models (2)', '2024-06-09 01:40:10', NULL),
(1272, 69, 'GOLF', ' - Golf', '2024-06-09 01:40:10', NULL),
(1273, 69, 'RABBIT', ' - Rabbit', '2024-06-09 01:40:10', NULL),
(1274, 69, 'JET', 'Jetta', '2024-06-09 01:40:10', NULL),
(1275, 69, 'PASS', 'Passat', '2024-06-09 01:40:10', NULL),
(1276, 69, 'PHAETON', 'Phaeton', '2024-06-09 01:40:10', NULL),
(1277, 69, 'RABBITPU', 'Pickup', '2024-06-09 01:40:10', NULL),
(1278, 69, 'QUAN', 'Quantum', '2024-06-09 01:40:10', NULL),
(1279, 69, 'R32', 'R32', '2024-06-09 01:40:10', NULL),
(1280, 69, 'ROUTAN', 'Routan', '2024-06-09 01:40:10', NULL),
(1281, 69, 'SCIR', 'Scirocco', '2024-06-09 01:40:10', NULL),
(1282, 69, 'TIGUAN', 'Tiguan', '2024-06-09 01:40:10', NULL),
(1283, 69, 'TOUAREG', 'Touareg', '2024-06-09 01:40:10', NULL),
(1284, 69, 'VANAG', 'Vanagon', '2024-06-09 01:40:10', NULL),
(1285, 69, 'VWOTH', 'Other Volkswagen Models', '2024-06-09 01:40:10', NULL),
(1286, 70, '240', '240', '2024-06-09 01:40:10', NULL),
(1287, 70, '260', '260', '2024-06-09 01:40:10', NULL),
(1288, 70, '740', '740', '2024-06-09 01:40:10', NULL),
(1289, 70, '760', '760', '2024-06-09 01:40:10', NULL),
(1290, 70, '780', '780', '2024-06-09 01:40:10', NULL),
(1291, 70, '850', '850', '2024-06-09 01:40:10', NULL),
(1292, 70, '940', '940', '2024-06-09 01:40:10', NULL),
(1293, 70, '960', '960', '2024-06-09 01:40:10', NULL),
(1294, 70, 'C30', 'C30', '2024-06-09 01:40:10', NULL),
(1295, 70, 'C70', 'C70', '2024-06-09 01:40:10', NULL),
(1296, 70, 'S40', 'S40', '2024-06-09 01:40:10', NULL),
(1297, 70, 'S60', 'S60', '2024-06-09 01:40:10', NULL),
(1298, 70, 'S70', 'S70', '2024-06-09 01:40:10', NULL),
(1299, 70, 'S80', 'S80', '2024-06-09 01:40:10', NULL),
(1300, 70, 'S90', 'S90', '2024-06-09 01:40:10', NULL),
(1301, 70, 'V40', 'V40', '2024-06-09 01:40:10', NULL),
(1302, 70, 'V50', 'V50', '2024-06-09 01:40:10', NULL),
(1303, 70, 'V70', 'V70', '2024-06-09 01:40:10', NULL),
(1304, 70, 'V90', 'V90', '2024-06-09 01:40:10', NULL),
(1305, 70, 'XC60', 'XC60', '2024-06-09 01:40:10', NULL),
(1306, 70, 'XC', 'XC70', '2024-06-09 01:40:10', NULL),
(1307, 70, 'XC90', 'XC90', '2024-06-09 01:40:10', NULL),
(1308, 70, 'VOLOTH', 'Other Volvo Models', '2024-06-09 01:40:10', NULL),
(1309, 71, 'GV', 'GV', '2024-06-09 01:40:10', NULL),
(1310, 71, 'GVC', 'GVC', '2024-06-09 01:40:10', NULL),
(1311, 71, 'GVL', 'GVL', '2024-06-09 01:40:10', NULL),
(1312, 71, 'GVS', 'GVS', '2024-06-09 01:40:10', NULL),
(1313, 71, 'GVX', 'GVX', '2024-06-09 01:40:10', NULL),
(1314, 71, 'YUOTH', 'Other Yugo Models', '2024-06-09 01:40:10', NULL),
(1315, 73, 'mymy', 'mymy', '2024-06-09 01:40:18', '2024-06-09 01:40:18');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('2756b50b-4483-4caf-8aec-c5e47d183b08', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 3, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-03-14 18:14:23', '2023-03-14 18:14:23'),
('f4e204b9-2ac9-451e-8f99-9d675cb42ae3', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 10, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-04-12 19:41:25', '2023-04-12 19:41:25'),
('04341573-6ae2-41af-b11c-a79b374c208c', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 10, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-04-12 19:46:47', '2023-04-12 19:46:47'),
('66d2506f-1e9c-4cde-9ae0-0b5fd3240a15', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 3, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-04-17 12:27:57', '2023-04-17 12:27:57'),
('7cdc208e-26ee-4050-9337-8c5544d1b3a6', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 3, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-04-24 05:39:11', '2023-04-24 05:39:11'),
('007c6b71-51e3-4054-800d-696b4236cb14', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 3, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-04-25 21:48:30', '2023-04-25 21:48:30'),
('88e1ab20-7a7d-4768-b655-be21114b4b98', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 3, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-04-25 21:54:25', '2023-04-25 21:54:25'),
('99e9e62d-9a21-4547-a0f1-7f07dfe5c79b', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 3, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-04-25 22:03:42', '2023-04-25 22:03:42'),
('6dc58402-1d33-4adc-ab14-5c8de15aa5a3', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 3, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-04-25 22:05:40', '2023-04-25 22:05:40'),
('a763c31d-b58b-4d5f-9f9f-811aba2e0e69', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 3, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-04-25 22:07:48', '2023-04-25 22:07:48'),
('ea1a57ca-1fd4-4060-8274-e598ecb0b4fd', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 3, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-04-29 15:52:40', '2023-04-29 15:52:40'),
('864429df-76be-409b-978b-3da20ef850d2', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 3, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-04-29 16:02:38', '2023-04-29 16:02:38'),
('77ffdaa0-2283-431a-89f2-6e2d00685a39', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 3, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-04-29 16:03:34', '2023-04-29 16:03:34'),
('b29855b7-fd1a-4ea0-97f1-cf6f78b128c9', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 3, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-04-29 16:04:20', '2023-04-29 16:04:20'),
('e42e087a-2d07-4efc-913b-28435f50d7ee', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 3, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-04-29 16:05:14', '2023-04-29 16:05:14'),
('0ff99b10-9e26-4c95-9f16-9ddc83d4566d', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 3, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-04-29 16:06:53', '2023-04-29 16:06:53'),
('9c344473-f365-4445-8485-f62b48db72e0', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 3, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-04-30 16:18:12', '2023-04-30 16:18:12'),
('eb6d4fda-a1f4-4706-88e0-017f233c2cc2', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 3, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-05-15 05:36:46', '2023-05-15 05:36:46'),
('1ae9be8a-f2bd-4e84-b848-a72eb135c61f', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 13, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-05-17 03:23:35', '2023-05-17 03:23:35'),
('4b520c19-d502-4726-adf8-b5553fcbc7ba', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 13, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-05-17 03:29:27', '2023-05-17 03:29:27'),
('621db24e-23d7-4c1d-bc7a-ffef5db26794', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 13, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-05-17 03:53:34', '2023-05-17 03:53:34'),
('42e8a944-8e40-456e-9a60-5282164a5f26', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 3, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-05-17 13:13:36', '2023-05-17 13:13:36'),
('72d6d947-778c-43d1-9592-68ce845443e6', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 15, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-05-18 16:53:08', '2023-05-18 16:53:08'),
('cdf96a29-0b7c-4c33-92ea-8333b8265c2f', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 3, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-05-20 23:02:17', '2023-05-20 23:02:17'),
('3b681d29-46bb-42f0-be70-824ade9a2c6a', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 20, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-05-24 18:04:22', '2023-05-24 18:04:22'),
('38366d39-48ef-4489-b4cc-08f147d2d36e', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 21, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-07-09 10:08:25', '2023-07-09 10:08:25'),
('5896305d-aeac-490c-b77f-68c8b5b4af97', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 21, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-07-31 13:01:23', '2023-07-31 13:01:23'),
('781d4d71-4536-4357-9d72-63b0b0ce567c', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 21, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-08-07 07:29:53', '2023-08-07 07:29:53'),
('34b01271-98b4-4cdf-bf3e-69089fa863aa', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 21, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-08-07 07:38:27', '2023-08-07 07:38:27'),
('bd549d9a-b1ec-406e-b2b5-dc38fc327c35', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 21, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-08-07 07:42:25', '2023-08-07 07:42:25'),
('7f62fc12-18a0-4ac6-8f0e-74bc0aa739d1', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 24, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-10-12 08:25:11', '2023-10-12 08:25:11'),
('a68ab16f-32f9-41b7-8c88-8b98b572c967', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 24, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-10-12 10:05:38', '2023-10-12 10:05:38'),
('ef17625a-d9cf-4cc9-93f7-4208cefd916a', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 24, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-10-12 10:09:14', '2023-10-12 10:09:14'),
('25d23883-90db-48f4-a07a-6d07c57ba525', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 24, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-10-15 15:19:46', '2023-10-15 15:19:46'),
('e6866979-1eac-4a36-b040-ad2e9a0ee4f1', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 25, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-10-15 16:38:46', '2023-10-15 16:38:46'),
('97638497-103f-46a9-b62b-ec2740ad7954', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 24, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-10-17 15:26:20', '2023-10-17 15:26:20'),
('c9b77fc0-876c-403a-ae29-7a3128b4b6dc', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 24, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-10-18 09:50:14', '2023-10-18 09:50:14'),
('2360c1a7-8383-4647-9449-e78190a8ac9e', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 13, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-10-18 13:03:44', '2023-10-18 13:03:44'),
('fac0d4f0-081f-412d-84fe-b4d16f9834f7', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 13, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-10-18 13:06:38', '2023-10-18 13:06:38'),
('9603a65e-9eb1-408e-9b22-cb080c5c281b', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 24, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-10-18 13:29:18', '2023-10-18 13:29:18'),
('a4c801ee-275f-4a60-9ed6-8b84781214df', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 24, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-10-18 13:31:13', '2023-10-18 13:31:13'),
('1b96b8f5-429d-4c23-9d8b-78b265e93e63', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 13, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-10-18 13:33:21', '2023-10-18 13:33:21'),
('bd36a15b-97c6-4515-b0e9-d04d00aa7eec', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 24, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-10-18 13:44:15', '2023-10-18 13:44:15'),
('ab68e68a-7ef2-4f57-8a36-2412a0ede243', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 24, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-10-18 13:48:43', '2023-10-18 13:48:43'),
('554bbf48-7c4a-4cdb-9f9e-091f58440544', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 24, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-11-02 16:07:45', '2023-11-02 16:07:45'),
('bd13b4bc-e17a-43b7-aba6-62f333fcabbb', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 24, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-11-05 16:00:18', '2023-11-05 16:00:18'),
('37711671-491a-441a-8f75-0ff424ac4423', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 24, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-11-05 16:02:12', '2023-11-05 16:02:12'),
('ba7fcf9c-5a2d-4e93-9a6c-7e240188d08e', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 24, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-11-05 16:24:32', '2023-11-05 16:24:32'),
('2973ecd6-201a-44ce-a70e-c06eb56c3da8', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 24, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-11-05 17:52:17', '2023-11-05 17:52:17'),
('f35b60d6-2158-44f9-b40a-8ae25eae3489', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 13, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-11-05 18:13:42', '2023-11-05 18:13:42'),
('39fac046-65ac-4382-8400-37771b6affcb', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 24, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-11-06 09:28:01', '2023-11-06 09:28:01'),
('3b236032-8ec5-43ee-a413-83cf2d4fd0fb', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 24, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-11-06 10:11:22', '2023-11-06 10:11:22'),
('69c158f3-ce51-4337-afb9-cf891db834e7', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 24, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-11-06 10:29:35', '2023-11-06 10:29:35'),
('932c6a12-c4f1-494f-bf33-dc74a4e23822', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 24, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-11-06 12:02:10', '2023-11-06 12:02:10'),
('928dd0f9-13ce-4a01-832c-01d3aff4168b', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 24, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-11-08 11:43:39', '2023-11-08 11:43:39'),
('07a0359b-24bf-407e-bf2d-5e9b79948213', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 24, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-11-08 11:44:32', '2023-11-08 11:44:32'),
('d17a32bb-1967-4077-b7a0-5dd0cbfe6edb', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 24, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-11-22 10:20:26', '2023-11-22 10:20:26'),
('1be9a69f-5a83-4248-a6da-f825ab79e9b0', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 24, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-11-24 12:14:10', '2023-11-24 12:14:10'),
('e3fd94f1-b29f-4021-b0fc-ff1d45e96d26', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 24, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-11-24 12:52:52', '2023-11-24 12:52:52'),
('2dada1f8-0042-4d90-abe9-191bdf3b8adf', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 24, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-11-24 12:55:56', '2023-11-24 12:55:56'),
('91d18322-c9d0-4f5e-836b-3e19a9c55552', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 24, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2023-11-24 13:00:27', '2023-11-24 13:00:27'),
('7d92678f-23c0-400e-b26c-085074acea62', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 28, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-05-29 05:00:47', '2024-05-29 05:00:47'),
('af9d2dd4-9efa-44e2-937d-8d085a050bef', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 28, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-05-29 23:19:49', '2024-05-29 23:19:49'),
('0d74a919-dd88-4dd3-87da-f52efe9e065b', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 28, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-05-29 23:19:51', '2024-05-29 23:19:51'),
('315ea839-fc52-4f0a-8cbd-bd0bf278e959', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 28, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-05-30 02:23:55', '2024-05-30 02:23:55'),
('38fab336-5c75-4e10-9207-b64469b51047', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 28, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-05-30 02:30:44', '2024-05-30 02:30:44'),
('db236f5d-e1ec-4707-a90e-246b8e2d9ad5', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 28, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-05-30 02:33:23', '2024-05-30 02:33:23'),
('5632ad00-e470-4ecd-a374-e7470bd88ad1', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 28, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-05-30 03:44:01', '2024-05-30 03:44:01'),
('a531787f-ede9-49ac-937a-e391f9cbe8f4', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 28, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-05-30 03:46:51', '2024-05-30 03:46:51'),
('3f59a60d-4bde-43b5-80ee-25ec3b1c6489', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 28, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-05-30 03:51:57', '2024-05-30 03:51:57'),
('6d2fea73-830b-4880-ac18-8eb9fa796e8a', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 28, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-05-30 03:55:24', '2024-05-30 03:55:24'),
('d9c53a0f-2a6f-4abb-8056-a2080d852054', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 28, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-05-30 04:05:28', '2024-05-30 04:05:28'),
('058459fc-e481-45b4-bdca-be5580368d9c', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 28, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-05-30 04:09:18', '2024-05-30 04:09:18'),
('49d1ba35-aa92-49ef-abb0-e99095e8225d', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 28, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-05-30 04:36:44', '2024-05-30 04:36:44'),
('e3e468bc-60f7-4c15-a022-688203a071d3', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 28, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-05-30 22:49:31', '2024-05-30 22:49:31'),
('6fb24315-c870-4f0a-a093-da2fa8219928', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 28, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-05-31 00:13:24', '2024-05-31 00:13:24'),
('a86be6f2-e42e-45db-8427-1c3c51358631', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 28, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-05-31 03:45:53', '2024-05-31 03:45:53'),
('1c672846-3076-444e-8db6-04bff1593ea7', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 28, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-06-01 01:34:42', '2024-06-01 01:34:42'),
('eb4fb4f0-51c1-43e1-a9a9-091e9ce17cb3', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 28, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-06-05 04:45:26', '2024-06-05 04:45:26'),
('4fe34178-877c-401c-ae92-f2c5928f66bc', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 28, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-06-05 04:46:50', '2024-06-05 04:46:50'),
('ca60f5b3-962c-497e-86c3-3fa016554cd1', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 28, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-06-06 03:32:39', '2024-06-06 03:32:39'),
('6dd60920-a283-42dd-858c-c10ce3700c14', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 28, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-06-06 03:58:31', '2024-06-06 03:58:31'),
('54584035-0fa0-4511-bdb9-ed079e43d664', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 28, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-06-06 04:14:12', '2024-06-06 04:14:12'),
('87c3fb48-6521-459e-bd76-79767d610489', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 28, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-06-07 02:23:55', '2024-06-07 02:23:55'),
('f4e4f384-fef5-4fb9-b8cb-436ac07c043c', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 28, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-06-08 22:45:33', '2024-06-08 22:45:33'),
('b549c242-4bb5-443d-b713-7ddf7e2dcbb5', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 28, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-06-08 22:49:26', '2024-06-08 22:49:26'),
('56ffe49e-e50d-46bd-8a72-27e1b1049cec', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 28, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-06-08 22:53:32', '2024-06-08 22:53:32'),
('ec260022-7445-4b3f-b2f4-0f657895cea8', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 28, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-06-08 22:54:45', '2024-06-08 22:54:45'),
('8e69557d-2ee4-48b2-8e0f-dacac4288bd2', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 28, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-06-08 22:56:02', '2024-06-08 22:56:02'),
('0fd64715-479d-49e0-84b6-4cd700c93650', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 28, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-06-08 22:57:15', '2024-06-08 22:57:15'),
('e60e158d-af02-41c1-933a-697a542979f4', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 28, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-06-08 22:59:22', '2024-06-08 22:59:22'),
('65616aa6-ba01-40a8-81a7-9d97f28720f7', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 28, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-06-08 23:00:34', '2024-06-08 23:00:34'),
('b32e6941-97dd-45d6-a1df-11fcca8e4d9c', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 28, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-06-08 23:03:28', '2024-06-08 23:03:28'),
('766855dc-1b01-46e7-aab7-691651019629', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 28, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-06-08 23:04:18', '2024-06-08 23:04:18'),
('ad26c47e-f5bb-4d27-be6a-6a0c24e8d62b', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 28, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-06-08 23:06:45', '2024-06-08 23:06:45'),
('af6cd91e-86aa-4f40-b64e-2407ec215aa4', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 28, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-06-08 23:13:22', '2024-06-08 23:13:22'),
('9f22e07a-06a5-493b-9e6a-a429625a15ec', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 28, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-06-08 23:36:56', '2024-06-08 23:36:56'),
('f4e53d19-d975-4836-949a-d0bc967bd626', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 28, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-06-09 00:02:21', '2024-06-09 00:02:21'),
('a791bc07-7ffc-4b12-b367-4b111d28c07b', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 28, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-06-09 00:03:01', '2024-06-09 00:03:01'),
('dd08271d-9f83-4f9c-bf26-7cf51404b77f', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 28, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-06-09 01:40:18', '2024-06-09 01:40:18'),
('e3d89c1e-3c84-4966-a740-cc97490d3939', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 28, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-06-15 05:16:36', '2024-06-15 05:16:36'),
('e18c82db-b97d-4b26-8304-2c31ab7ad8ea', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 28, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-06-15 05:16:37', '2024-06-15 05:16:37'),
('c10d5322-c9b8-409d-b03f-c03d624647d8', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 28, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-06-25 01:27:46', '2024-06-25 01:27:46'),
('04a174ec-a3ef-4596-ac97-c06e88ccc06f', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 28, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-06-25 01:27:47', '2024-06-25 01:27:47'),
('b7f91dc0-86eb-497e-b341-4a69cfbfff19', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 28, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-07-04 22:18:11', '2024-07-04 22:18:11'),
('83e2df00-a625-443e-bc22-32e82d6aaf65', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 28, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-07-05 01:39:03', '2024-07-05 01:39:03'),
('868ca1c4-7acb-424e-8478-dad3ba8c899f', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 63, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-07-09 00:45:19', '2024-07-09 00:45:19'),
('d2fddc70-1589-44f6-ad6a-4d931ee4ac91', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 62, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-07-09 04:10:21', '2024-07-09 04:10:21'),
('b5ad7600-366d-42d6-a9fa-ea9611fbddb0', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 62, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-07-17 20:36:08', '2024-07-17 20:36:08'),
('9b5ae8b8-6c9d-4a0d-b6b8-924e09a04862', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 62, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-07-17 20:42:02', '2024-07-17 20:42:02'),
('be0aeefc-05a5-4daa-8d0e-9713f48fe4f1', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 62, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-07-17 20:44:16', '2024-07-17 20:44:16'),
('c207427c-fedc-4bd0-a24b-35cc504b65ce', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 62, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-07-17 20:50:02', '2024-07-17 20:50:02'),
('984db416-2874-40d1-8e21-eccfda803292', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 62, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-07-17 21:07:08', '2024-07-17 21:07:08'),
('0c2edf25-2396-4875-a9de-a001f33d0a49', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 62, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-07-17 21:10:02', '2024-07-17 21:10:02'),
('1b036233-7bf6-4caf-9d3d-47b779f563a7', 'App\\Notifications\\notifyUser', 'App\\Models\\User', 62, '{\"sender\":\"Autohub\",\"message\":\"Your post has been submitted successfully and you will be notified when approved\"}', NULL, '2024-07-18 02:09:10', '2024-07-18 02:09:10');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`id`, `email`, `token`, `created_at`) VALUES
(1, 'samji2@gmail.com', '5556', '2023-05-15 00:44:09'),
(2, 'samji2@gmail.com', '3447', '2023-05-15 00:46:16'),
(3, 'samji2@gmail.com', '2499', '2023-05-15 00:46:48'),
(4, 'samji2@gmail.com', '9555', '2023-05-15 00:47:14'),
(5, 'toluxsys@gmail.com', '5394', '2023-05-17 03:15:51'),
(6, 'autohubnigeria@gmail.com', '6283', '2023-05-18 15:09:54'),
(7, 'autohubnigeria@gmail.com', '1708', '2023-05-18 15:19:32'),
(8, 'devdoctor001@gmail.com', '1871', '2023-10-18 11:33:56'),
(9, 'jomoney@yahoo.com', '1221', '2023-12-05 15:13:54');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `reference` varchar(100) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `provider` varchar(100) NOT NULL,
  `data` text NOT NULL,
  `webhook` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `user_id`, `product_id`, `plan_id`, `reference`, `status`, `provider`, `data`, `webhook`, `created_at`, `updated_at`) VALUES
(1, 4, 3, 2, '6442a620308e3_644bb9ff72d2a', 0, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Samji\",\"account_number\":\"5006000064\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-sazyddobsjcnfo1vjtexv\",\"reference\":\"6442a620308e3_644bb9ff72d2a\",\"accountExpiry\":\"2023-04-30T04:20:25.968033Z\"}', NULL, '2023-04-28 12:20:16', '2023-04-28 12:20:16'),
(2, 4, 3, 2, '6442a620308e3_644bbb25a7e9b', 0, 'Paylony', '\"{\\\"success\\\":true,\\\"status\\\":\\\"00\\\",\\\"message\\\":\\\"Dynamic Account Generated\\\",\\\"amount\\\":\\\"35000\\\",\\\"fee\\\":350,\\\"totalAmount\\\":\\\"35000\\\",\\\"account_name\\\":\\\"AutoHub\\\\\\/PlanPayment\\\\\\/Samji\\\",\\\"account_number\\\":\\\"5006000071\\\",\\\"bank_name\\\":\\\"VFD Microfinance Bank\\\",\\\"transactionRef\\\":\\\"Paylony-ae2bud2rmbkc7gzsnaxpe\\\",\\\"reference\\\":\\\"6442a620308e3_644bbb25a7e9b\\\",\\\"accountExpiry\\\":\\\"2023-04-30T04:25:20.396566Z\\\"}\"', NULL, '2023-04-28 12:25:10', '2023-04-28 12:25:10'),
(3, 3, 12, 2, '644d86edbdff9_644d86efa7057', 0, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Samji\",\"account_number\":\"5006000088\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-mvtfefclzrsejpnejgajd\",\"reference\":\"644d86edbdff9_644d86efa7057\",\"accountExpiry\":\"2023-05-01T13:06:57.050100Z\"}', NULL, '2023-04-29 16:06:57', '2023-04-29 16:06:57'),
(4, 3, 13, 2, '644edb136124a_644edb15eaed0', 1, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Samji\",\"account_number\":\"5006000095\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-ljav3fylj5amfiz1pbhk5\",\"reference\":\"644edb136124a_644edb15eaed0\",\"accountExpiry\":\"2023-05-02T13:18:15.776634Z\"}', NULL, '2023-04-30 16:18:15', '2023-04-30 21:24:55'),
(5, 3, 13, 2, '644edb136124a_644f6c2f5cc38', 0, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Samji\",\"account_number\":\"5006000105\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-rnwapgqmbdmpw8adbbjbb\",\"reference\":\"644edb136124a_644f6c2f5cc38\",\"accountExpiry\":\"2023-05-02T23:37:20.545859Z\"}', NULL, '2023-05-01 02:37:20', '2023-05-01 02:37:20'),
(6, 3, 13, 2, '644edb136124a_644f6c75c0bb1', 1, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Samji\",\"account_number\":\"5006000112\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-s1mprckoovzax0gojpt3q\",\"reference\":\"644edb136124a_644f6c75c0bb1\",\"accountExpiry\":\"2023-05-02T23:38:30.407073Z\"}', NULL, '2023-05-01 02:38:30', '2023-05-01 07:39:11'),
(7, 13, 16, 2, '646490676431d_6464906af27e0', 0, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Tolulope\",\"account_number\":\"5006000129\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-buunj6ss9u0hdp0dwl0yi\",\"reference\":\"646490676431d_6464906af27e0\",\"accountExpiry\":\"2023-05-19T00:29:33.248564Z\"}', NULL, '2023-05-17 03:29:33', '2023-05-17 03:29:33'),
(8, 13, 17, 2, '6464960e18c07_6464960fed839', 0, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Tolulope\",\"account_number\":\"5006000136\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-voswcyptpynbuc81k5zqw\",\"reference\":\"6464960e18c07_6464960fed839\",\"accountExpiry\":\"2023-05-19T00:53:37.099690Z\"}', NULL, '2023-05-17 03:53:37', '2023-05-17 03:53:37'),
(9, 3, 18, 2, '6465195026929_646519521b2d0', 0, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Samji\",\"account_number\":\"5006000143\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-vhcokdjsxkb875llm5ala\",\"reference\":\"6465195026929_646519521b2d0\",\"accountExpiry\":\"2023-05-19T10:13:39.402367Z\"}', NULL, '2023-05-17 13:13:39', '2023-05-17 13:13:39'),
(10, 24, 3, 2, '64489261e5c62_652fe8a1a3187', 0, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Dev Doctor\",\"account_number\":\"6005003807\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-osavsaao0doahbizbgl9q\",\"reference\":\"64489261e5c62_652fe8a1a3187\",\"accountExpiry\":\"2023-10-20T06:16:03.300499Z\"}', NULL, '2023-10-18 13:16:03', '2023-10-18 13:16:03'),
(11, 24, 36, 2, '652febbeeccf6_652febbfbb1e0', 0, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Dev Doctor\",\"account_number\":\"6005003948\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-j5l208wjzo8ksusnu4enx\",\"reference\":\"652febbeeccf6_652febbfbb1e0\",\"accountExpiry\":\"2023-10-20T06:29:20.659146Z\"}', NULL, '2023-10-18 13:29:20', '2023-10-18 13:29:20'),
(12, 13, 38, 2, '652fecb148e06_652fecb1efff4', 1, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Tolulope\",\"account_number\":\"6005003955\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-ep1slsskqlb9pi30n0wfv\",\"reference\":\"652fecb148e06_652fecb1efff4\",\"accountExpiry\":\"2023-10-20T06:33:22.939217Z\"}', NULL, '2023-10-18 13:33:22', '2023-10-18 14:39:13'),
(13, 24, 3, 2, '64489261e5c62_652ff14a3ca04', 0, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Dev Doctor\",\"account_number\":\"6005004079\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-aft23l64vefuuxfihpuwy\",\"reference\":\"64489261e5c62_652ff14a3ca04\",\"accountExpiry\":\"2023-10-20T06:52:59.643015Z\"}', NULL, '2023-10-18 13:52:59', '2023-10-18 13:52:59'),
(14, 24, 42, 2, '6547bc12e5990_6547bdcca2281', 0, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Dev Doctor\",\"account_number\":\"6005034551\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-hnpkzpqvy33f8odvtzg56\",\"reference\":\"6547bc12e5990_6547bdcca2281\",\"accountExpiry\":\"2023-11-07T08:07:41.595668Z\"}', NULL, '2023-11-05 16:07:41', '2023-11-05 16:07:41'),
(15, 24, 44, 2, '6547c1c06ccfd_6547c1c0e4119', 0, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Dev Doctor\",\"account_number\":\"6005034609\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-2cseg4rxjptiemsnbaekk\",\"reference\":\"6547c1c06ccfd_6547c1c0e4119\",\"accountExpiry\":\"2023-11-07T08:24:33.484208Z\"}', NULL, '2023-11-05 16:24:33', '2023-11-05 16:24:33'),
(16, 24, 44, 2, '6547c1c06ccfd_6547c1d2002d8', 0, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Dev Doctor\",\"account_number\":\"6005034616\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-x1t8ljc35aobzp17p6if9\",\"reference\":\"6547c1c06ccfd_6547c1d2002d8\",\"accountExpiry\":\"2023-11-07T08:24:50.522405Z\"}', NULL, '2023-11-05 16:24:50', '2023-11-05 16:24:50'),
(17, 24, 44, 2, '6547c1c06ccfd_6547c1e7150be', 0, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Dev Doctor\",\"account_number\":\"6005034623\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-sbm0gguwg7arbmrjoefau\",\"reference\":\"6547c1c06ccfd_6547c1e7150be\",\"accountExpiry\":\"2023-11-07T08:25:11.594639Z\"}', NULL, '2023-11-05 16:25:11', '2023-11-05 16:25:11'),
(18, 24, 44, 2, '6547c1c06ccfd_6547c205c9bd2', 0, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Dev Doctor\",\"account_number\":\"6005034630\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-bwfzxmcfdn58zsjclvn4i\",\"reference\":\"6547c1c06ccfd_6547c205c9bd2\",\"accountExpiry\":\"2023-11-07T08:25:42.315883Z\"}', NULL, '2023-11-05 16:25:42', '2023-11-05 16:25:42'),
(19, 24, 44, 2, '6547c1c06ccfd_6547c252797cb', 0, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Dev Doctor\",\"account_number\":\"6005034647\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-z7u3huu0bz19chpdozauc\",\"reference\":\"6547c1c06ccfd_6547c252797cb\",\"accountExpiry\":\"2023-11-07T08:26:59.021843Z\"}', NULL, '2023-11-05 16:26:59', '2023-11-05 16:26:59'),
(20, 24, 44, 2, '6547c1c06ccfd_6547c272ce932', 0, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Dev Doctor\",\"account_number\":\"6005034654\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-kjlxqj6tfpgolszfl5otk\",\"reference\":\"6547c1c06ccfd_6547c272ce932\",\"accountExpiry\":\"2023-11-07T08:27:31.388767Z\"}', NULL, '2023-11-05 16:27:31', '2023-11-05 16:27:31'),
(21, 24, 44, 2, '6547c1c06ccfd_6547c2848da02', 0, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Dev Doctor\",\"account_number\":\"6005034661\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-bk0cthibkakexlx7c1on2\",\"reference\":\"6547c1c06ccfd_6547c2848da02\",\"accountExpiry\":\"2023-11-07T08:27:49.077986Z\"}', NULL, '2023-11-05 16:27:49', '2023-11-05 16:27:49'),
(22, 24, 44, 2, '6547c1c06ccfd_6547c28f8ca9e', 0, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Dev Doctor\",\"account_number\":\"6005034678\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-ja462qjewevwwfaaqispt\",\"reference\":\"6547c1c06ccfd_6547c28f8ca9e\",\"accountExpiry\":\"2023-11-07T08:28:00.090346Z\"}', NULL, '2023-11-05 16:28:00', '2023-11-05 16:28:00'),
(23, 24, 44, 2, '6547c1c06ccfd_6547c29850bd1', 0, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Dev Doctor\",\"account_number\":\"6005034685\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-gi65binw9esfuquefspes\",\"reference\":\"6547c1c06ccfd_6547c29850bd1\",\"accountExpiry\":\"2023-11-07T08:28:08.840237Z\"}', NULL, '2023-11-05 16:28:08', '2023-11-05 16:28:08'),
(24, 24, 44, 2, '6547c1c06ccfd_6547c2a2842a5', 0, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Dev Doctor\",\"account_number\":\"6005034692\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-8ygg0bj61xeidtk6ejnn6\",\"reference\":\"6547c1c06ccfd_6547c2a2842a5\",\"accountExpiry\":\"2023-11-07T08:28:19.023508Z\"}', NULL, '2023-11-05 16:28:19', '2023-11-05 16:28:19'),
(25, 24, 44, 2, '6547c1c06ccfd_6547c2aa62a41', 0, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Dev Doctor\",\"account_number\":\"6005034702\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-7gn6kgvnoistcu4qszmhb\",\"reference\":\"6547c1c06ccfd_6547c2aa62a41\",\"accountExpiry\":\"2023-11-07T08:28:26.893931Z\"}', NULL, '2023-11-05 16:28:26', '2023-11-05 16:28:26'),
(26, 24, 44, 2, '6547c1c06ccfd_6547c2b0b36af', 0, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Dev Doctor\",\"account_number\":\"6005034719\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-scnnnxp8jzc4jj8ldqugs\",\"reference\":\"6547c1c06ccfd_6547c2b0b36af\",\"accountExpiry\":\"2023-11-07T08:28:33.229929Z\"}', NULL, '2023-11-05 16:28:33', '2023-11-05 16:28:33'),
(27, 24, 44, 2, '6547c1c06ccfd_6547c2dbd7091', 0, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Dev Doctor\",\"account_number\":\"6005034726\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-csmbywjznvfaummodtqct\",\"reference\":\"6547c1c06ccfd_6547c2dbd7091\",\"accountExpiry\":\"2023-11-07T08:29:16.396567Z\"}', NULL, '2023-11-05 16:29:16', '2023-11-05 16:29:16'),
(28, 24, 44, 2, '6547c1c06ccfd_6547c311afc16', 0, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Dev Doctor\",\"account_number\":\"6005034733\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-jjcgwzgpdwclh8sfjsgsa\",\"reference\":\"6547c1c06ccfd_6547c311afc16\",\"accountExpiry\":\"2023-11-07T08:30:11.301447Z\"}', NULL, '2023-11-05 16:30:11', '2023-11-05 16:30:11'),
(29, 24, 44, 2, '6547c1c06ccfd_6547c3238f9c8', 0, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Dev Doctor\",\"account_number\":\"6005034740\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-onbdrukp6ltjcswwl1ql9\",\"reference\":\"6547c1c06ccfd_6547c3238f9c8\",\"accountExpiry\":\"2023-11-07T08:30:28.207448Z\"}', NULL, '2023-11-05 16:30:28', '2023-11-05 16:30:28'),
(30, 24, 44, 2, '6547c1c06ccfd_6547c32a5453d', 0, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Dev Doctor\",\"account_number\":\"6005034757\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-5kkhqcda1ajprzug2tq33\",\"reference\":\"6547c1c06ccfd_6547c32a5453d\",\"accountExpiry\":\"2023-11-07T08:30:34.852672Z\"}', NULL, '2023-11-05 16:30:34', '2023-11-05 16:30:34'),
(31, 24, 44, 2, '6547c1c06ccfd_6547c33541a6f', 0, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Dev Doctor\",\"account_number\":\"6005034764\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-maie5wbjibfylpay0bmj2\",\"reference\":\"6547c1c06ccfd_6547c33541a6f\",\"accountExpiry\":\"2023-11-07T08:30:45.768503Z\"}', NULL, '2023-11-05 16:30:45', '2023-11-05 16:30:45'),
(32, 24, 44, 2, '6547c1c06ccfd_6547c35962f28', 0, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Dev Doctor\",\"account_number\":\"6005034771\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-bzqh8efnwlex0v0qd2lur\",\"reference\":\"6547c1c06ccfd_6547c35962f28\",\"accountExpiry\":\"2023-11-07T08:31:21.897753Z\"}', NULL, '2023-11-05 16:31:21', '2023-11-05 16:31:21'),
(33, 24, 44, 2, '6547c1c06ccfd_6547c3621afef', 0, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Dev Doctor\",\"account_number\":\"6005034788\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-uwidt81as6ysvpp33yjj7\",\"reference\":\"6547c1c06ccfd_6547c3621afef\",\"accountExpiry\":\"2023-11-07T08:31:30.605971Z\"}', NULL, '2023-11-05 16:31:30', '2023-11-05 16:31:30'),
(34, 24, 44, 2, '6547c1c06ccfd_6547c366d617b', 0, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Dev Doctor\",\"account_number\":\"6005034795\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-rxzrjubqerjdgmlpz458o\",\"reference\":\"6547c1c06ccfd_6547c366d617b\",\"accountExpiry\":\"2023-11-07T08:31:35.397740Z\"}', NULL, '2023-11-05 16:31:35', '2023-11-05 16:31:35'),
(35, 24, 44, 2, '6547c1c06ccfd_6547c37d44262', 0, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Dev Doctor\",\"account_number\":\"6005034805\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-fhmtmo0thqwh1jwncmq4r\",\"reference\":\"6547c1c06ccfd_6547c37d44262\",\"accountExpiry\":\"2023-11-07T08:31:57.874764Z\"}', NULL, '2023-11-05 16:31:57', '2023-11-05 16:31:57'),
(36, 24, 44, 2, '6547c1c06ccfd_6547c38330f4a', 0, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Dev Doctor\",\"account_number\":\"6005034812\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-cehyang1zdjdhwafkbo3c\",\"reference\":\"6547c1c06ccfd_6547c38330f4a\",\"accountExpiry\":\"2023-11-07T08:32:03.712897Z\"}', NULL, '2023-11-05 16:32:03', '2023-11-05 16:32:03'),
(37, 24, 45, 2, '6547d651d1e15_6547d652505bf', 0, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Dev Doctor\",\"account_number\":\"6005034829\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-1zrotteefs8hlgxwqjom7\",\"reference\":\"6547d651d1e15_6547d652505bf\",\"accountExpiry\":\"2023-11-07T09:52:19.114228Z\"}', NULL, '2023-11-05 17:52:19', '2023-11-05 17:52:19'),
(38, 13, 46, 2, '6547db56cac24_6547db5841365', 0, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Tolulope\",\"account_number\":\"6005034836\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-uswftatv5ezhonwdhqxst\",\"reference\":\"6547db56cac24_6547db5841365\",\"accountExpiry\":\"2023-11-07T10:13:44.919464Z\"}', NULL, '2023-11-05 18:13:44', '2023-11-05 18:13:44'),
(39, 24, 47, 2, '6548b1a153ee0_6548b1a1e3f27', 0, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Dev Doctor\",\"account_number\":\"6005035235\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-byuhm5yqdqkfk2rpb0sgm\",\"reference\":\"6548b1a153ee0_6548b1a1e3f27\",\"accountExpiry\":\"2023-11-08T01:28:02.814301Z\"}', NULL, '2023-11-06 09:28:02', '2023-11-06 09:28:02'),
(40, 24, 47, 2, '6548b1a153ee0_6548b533a118e', 0, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Dev Doctor\",\"account_number\":\"6005035259\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-yogcec5jpqf9ucepw6j7d\",\"reference\":\"6548b1a153ee0_6548b533a118e\",\"accountExpiry\":\"2023-11-08T01:43:16.304357Z\"}', NULL, '2023-11-06 09:43:16', '2023-11-06 09:43:16'),
(41, 24, 47, 2, '6548b1a153ee0_6548b7825e103', 0, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Dev Doctor\",\"account_number\":\"6005035266\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-h4zr1svorkihvxyf5e69x\",\"reference\":\"6548b1a153ee0_6548b7825e103\",\"accountExpiry\":\"2023-11-08T01:53:07.080314Z\"}', NULL, '2023-11-06 09:53:07', '2023-11-06 09:53:07'),
(42, 24, 47, 2, '6548b1a153ee0_6548b84f3cac2', 0, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Dev Doctor\",\"account_number\":\"6005035273\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-xokkedgejlc5gedp1ismo\",\"reference\":\"6548b1a153ee0_6548b84f3cac2\",\"accountExpiry\":\"2023-11-08T01:56:31.739625Z\"}', NULL, '2023-11-06 09:56:31', '2023-11-06 09:56:31'),
(43, 24, 47, 2, '6548b1a153ee0_6548b874b3775', 0, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Dev Doctor\",\"account_number\":\"6005035280\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-zb3kg0lu8l1rrknjlgetn\",\"reference\":\"6548b1a153ee0_6548b874b3775\",\"accountExpiry\":\"2023-11-08T01:57:09.243379Z\"}', NULL, '2023-11-06 09:57:09', '2023-11-06 09:57:09'),
(44, 24, 48, 2, '6548bbcaadaf0_6548bbcb2d0be', 0, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Dev Doctor\",\"account_number\":\"6005035297\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-jmov8rcssauacilgs4tgl\",\"reference\":\"6548bbcaadaf0_6548bbcb2d0be\",\"accountExpiry\":\"2023-11-08T02:11:23.890717Z\"}', NULL, '2023-11-06 10:11:23', '2023-11-06 10:11:23'),
(45, 24, 49, 2, '6548c00f3ae41_6548c00fd2568', 0, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Dev Doctor\",\"account_number\":\"6005035307\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-wu6z002mh8vkb1znd90si\",\"reference\":\"6548c00f3ae41_6548c00fd2568\",\"accountExpiry\":\"2023-11-08T02:29:36.619056Z\"}', NULL, '2023-11-06 10:29:36', '2023-11-06 10:29:36'),
(46, 24, 50, 2, '6548d5c2a854d_6548d5c3351c4', 0, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Dev Doctor\",\"account_number\":\"6005035424\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-0mxieqvoyvm8v6pwoafir\",\"reference\":\"6548d5c2a854d_6548d5c3351c4\",\"accountExpiry\":\"2023-11-08T04:02:12.008668Z\"}', NULL, '2023-11-06 12:02:12', '2023-11-06 12:02:12'),
(47, 24, 50, 2, '6548d5c2a854d_65490c22b9078', 0, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Dev Doctor\",\"account_number\":\"6005035747\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-mlcuotpj7jutwh1chqsdb\",\"reference\":\"6548d5c2a854d_65490c22b9078\",\"accountExpiry\":\"2023-11-08T07:54:11.529549Z\"}', NULL, '2023-11-06 15:54:11', '2023-11-06 15:54:11'),
(48, 24, 50, 2, '6548d5c2a854d_65490cf8e0709', 0, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Dev Doctor\",\"account_number\":\"6005035754\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-pufz2huythgcoelsekrsb\",\"reference\":\"6548d5c2a854d_65490cf8e0709\",\"accountExpiry\":\"2023-11-08T07:57:55.446846Z\"}', NULL, '2023-11-06 15:57:55', '2023-11-06 15:57:55'),
(49, 24, 52, 2, '654b74a0e21f5_654b74a16a0d8', 0, 'Paylony', '{\"success\":true,\"status\":\"00\",\"message\":\"Dynamic Account Generated\",\"amount\":\"35000\",\"fee\":350,\"totalAmount\":\"35000\",\"account_name\":\"AutoHub\\/PlanPayment\\/Dev Doctor\",\"account_number\":\"6005037772\",\"bank_name\":\"VFD Microfinance Bank\",\"transactionRef\":\"Paylony-ddzlgjx1nkxrql4myjzpe\",\"reference\":\"654b74a0e21f5_654b74a16a0d8\",\"accountExpiry\":\"2023-11-10T03:44:34.405701Z\"}', NULL, '2023-11-08 11:44:34', '2023-11-08 11:44:34');

-- --------------------------------------------------------

--
-- Table structure for table `persins`
--

CREATE TABLE `persins` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `persins`
--

INSERT INTO `persins` (`id`, `user_id`, `name`, `created_at`, `updated_at`) VALUES
(3, 103, 'buyer', '2024-07-09 07:29:21', '2024-07-09 07:29:21'),
(4, 105, 'affiliate', '2024-07-09 07:33:07', '2024-07-09 07:33:07'),
(5, 105, 'buyer', '2024-07-09 07:33:07', '2024-07-09 07:33:07'),
(6, 28, 'buyer', '2024-07-09 07:33:07', '2024-07-09 07:33:07'),
(7, 28, 'student', '2024-07-09 07:33:07', '2024-07-09 07:33:07'),
(8, 62, 'buyer', '2024-07-09 07:29:21', '2024-07-09 07:29:21'),
(9, 113, 'student', '2024-07-17 17:58:31', '2024-07-17 17:58:31'),
(10, 114, 'student', '2024-07-17 18:11:25', '2024-07-17 18:11:25'),
(11, 115, 'buyer', '2024-07-18 03:59:41', '2024-07-18 03:59:41'),
(12, 116, 'affiliate', '2024-07-18 04:01:25', '2024-07-18 04:01:25');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'admin', 'd6c3768ffa85e6708ca802803dde249354a833f4a583330cc5af307a8fe0dc29', '[\"*\"]', NULL, NULL, '2023-02-26 12:32:31', '2023-02-26 12:32:31'),
(2, 'App\\Models\\User', 1, 'admin', 'a27297206d823977a5247b33ffd00b302a012a2271693f22525ff2f3b07e73ea', '[\"*\"]', '2023-03-01 16:16:53', NULL, '2023-02-26 18:01:49', '2023-03-01 16:16:53'),
(3, 'App\\Models\\User', 3, 'admin', 'a03ce253e933448e7b83d80e3fee160b7c416d2e59ff31b74da520a420b0c6a5', '[\"*\"]', NULL, NULL, '2023-03-14 09:23:55', '2023-03-14 09:23:55'),
(4, 'App\\Models\\User', 3, 'admin', '00b3e423c3d142fe96a52891d1adf156d6a08445f3169366a927cc28682b447b', '[\"*\"]', NULL, NULL, '2023-03-14 09:26:17', '2023-03-14 09:26:17'),
(5, 'App\\Models\\User', 3, 'admin', '3c3f46f534d9903f92f90f92c4a5f96ad2b9390ac2bda36c7a672e565c3ce9af', '[\"*\"]', NULL, NULL, '2023-03-14 09:29:56', '2023-03-14 09:29:56'),
(6, 'App\\Models\\User', 3, 'admin', '3b787adbfb4e7127911ae1b6caa08d9b14bd086a3b1feddf7bd1cf3bbf9e8b37', '[\"*\"]', NULL, NULL, '2023-03-14 09:30:07', '2023-03-14 09:30:07'),
(7, 'App\\Models\\User', 3, 'admin', 'dc6acdcc9fd9289b48851c149a48739f4e436f25959db1c93660ae9b29e50f4b', '[\"*\"]', NULL, NULL, '2023-03-14 09:48:08', '2023-03-14 09:48:08'),
(8, 'App\\Models\\User', 3, 'admin', '5986ee1dc747c36bf75e45acbdbb232dfc54f9c967d839cbdb8822cebf5a4dd9', '[\"*\"]', NULL, NULL, '2023-03-14 11:25:44', '2023-03-14 11:25:44'),
(9, 'App\\Models\\User', 3, 'admin', '245f063539d11d7214709cf56b3089387de38c05173602ae3e56ea5e6d7e81cd', '[\"*\"]', NULL, NULL, '2023-03-14 11:30:23', '2023-03-14 11:30:23'),
(10, 'App\\Models\\User', 3, 'admin', 'c9c280797b494d61044e9f396de0a8a703622124ec80e3475a5d5f71cf6a3321', '[\"*\"]', NULL, NULL, '2023-03-14 11:38:18', '2023-03-14 11:38:18'),
(11, 'App\\Models\\User', 3, 'admin', '38ccb6ed7c16fd51be806d218c18c7653907800c6a7fc263b897beaae4ba4929', '[\"*\"]', NULL, NULL, '2023-03-14 11:39:53', '2023-03-14 11:39:53'),
(12, 'App\\Models\\User', 4, 'app', '352ac781477200e9ec8f6d5ef9c20e80344f9ad7ff2b78b904cf466e7934196f', '[\"*\"]', NULL, NULL, '2023-03-18 18:41:00', '2023-03-18 18:41:00'),
(13, 'App\\Models\\User', 5, 'app', '1618ac87782e9f2c65921a7b1da50733c86a3232328fb84b54364bbf27a5f6b1', '[\"*\"]', NULL, NULL, '2023-03-18 18:57:44', '2023-03-18 18:57:44'),
(14, 'App\\Models\\User', 6, 'app', '78cd1b43649b8c8edd29f4c17cdfc682b55fc6b48e5320510e7856565ce5dc65', '[\"*\"]', '2023-03-18 19:00:05', NULL, '2023-03-18 18:58:31', '2023-03-18 19:00:05'),
(15, 'App\\Models\\User', 7, 'app', '5bb02ac94ba69421dd90327ea1aedf90146735c72593d5dfdcccea188c16a27f', '[\"*\"]', NULL, NULL, '2023-03-20 18:21:01', '2023-03-20 18:21:01'),
(16, 'App\\Models\\User', 8, 'app', 'b44bddd3db95dc33a7ac2501ec92172c901167968889bbae996ff44a2c4514f7', '[\"*\"]', '2023-03-20 18:23:26', NULL, '2023-03-20 18:22:47', '2023-03-20 18:23:26'),
(17, 'App\\Models\\User', 3, 'app', 'c4f0507fd406b957b803c48f94950ee6eca7170e2148c2f9f2cf18b7a7be6793', '[\"*\"]', NULL, NULL, '2023-03-21 10:16:47', '2023-03-21 10:16:47'),
(18, 'App\\Models\\User', 3, 'app', '3d36843a22a2de8b0694e2d0d880379a2315083d70fc848df1024f1325ec10ba', '[\"*\"]', NULL, NULL, '2023-03-21 10:18:32', '2023-03-21 10:18:32'),
(19, 'App\\Models\\User', 3, 'app', '5b476024bddbfaa7b10034a77ed38fa07511f65dc8c8f863e53f3bd16d728c54', '[\"*\"]', NULL, NULL, '2023-03-21 10:18:43', '2023-03-21 10:18:43'),
(20, 'App\\Models\\User', 3, 'app', '4d7578c58b13ff8dd657b94753e82a3810af81817819bc0c2dc6866f211e13a9', '[\"*\"]', NULL, NULL, '2023-03-22 03:01:16', '2023-03-22 03:01:16'),
(21, 'App\\Models\\User', 3, 'app', 'c44edb4a257a6b3e1806409997fc66319af968c18fee60ccabb68fef85345e65', '[\"*\"]', NULL, NULL, '2023-03-22 03:01:46', '2023-03-22 03:01:46'),
(22, 'App\\Models\\User', 3, 'app', 'a03cb9b4db2ab91408e1d2c36c5bdc2e029ae47fbdcf053e1fca538bfb5d9bb5', '[\"*\"]', NULL, NULL, '2023-03-22 03:09:44', '2023-03-22 03:09:44'),
(23, 'App\\Models\\User', 3, 'app', '9025d0075d88dfd1d0e8eedec4c97d4cebf6dcd275b950168baba86b404c96fa', '[\"*\"]', NULL, NULL, '2023-03-22 03:19:55', '2023-03-22 03:19:55'),
(24, 'App\\Models\\User', 3, 'app', 'eb07c290dadfc993165faa6945624f2d4a55307a0176c7f5ed78cf36a1d70b60', '[\"*\"]', NULL, NULL, '2023-03-22 03:25:49', '2023-03-22 03:25:49'),
(25, 'App\\Models\\User', 3, 'app', '45d7edb108197587bee2cd25a488c906288fd4a0fca4e534c1790bcac945893c', '[\"*\"]', NULL, NULL, '2023-03-22 03:36:33', '2023-03-22 03:36:33'),
(26, 'App\\Models\\User', 3, 'app', '703cc16e39bbd66b63936ca1cb3b25ceea689742d1d7aaa3fefd4e6f47e2b25e', '[\"*\"]', NULL, NULL, '2023-03-22 03:46:40', '2023-03-22 03:46:40'),
(27, 'App\\Models\\User', 3, 'app', 'c47e225e02c256ef56e6cdf1c2859bd10ce0de4192d66b9c2068d7f8f9feab6e', '[\"*\"]', NULL, NULL, '2023-03-22 03:50:15', '2023-03-22 03:50:15'),
(28, 'App\\Models\\User', 3, 'app', 'f27a262b79027a21677f02d576c9e097a315ce0a44af00b953461e80bab5f8e9', '[\"*\"]', NULL, NULL, '2023-03-22 03:50:36', '2023-03-22 03:50:36'),
(29, 'App\\Models\\User', 3, 'app', 'a708a3d6ab999ffd3853308bb25848b5fd8f5174a64e6cf8bd33f7fc35d1d042', '[\"*\"]', NULL, NULL, '2023-03-22 04:30:27', '2023-03-22 04:30:27'),
(30, 'App\\Models\\User', 3, 'app', 'c9e2d4d0695fd7cfa6d5e3d11a28167710275c155cb8561d8618601b20ff5617', '[\"*\"]', NULL, NULL, '2023-03-27 03:29:45', '2023-03-27 03:29:45'),
(31, 'App\\Models\\User', 9, 'app', '93c7a3d193c0fbde568184c154494d449d55c0bd3166efb8497a398e6a9032fa', '[\"*\"]', '2023-03-28 01:15:45', NULL, '2023-03-28 01:14:51', '2023-03-28 01:15:45'),
(32, 'App\\Models\\User', 9, 'app', 'b77bef7e9fb29e93419ceb54e6eb101bc3a69009fa920285e70d311e239ab1a7', '[\"*\"]', '2023-03-28 01:31:05', NULL, '2023-03-28 01:21:17', '2023-03-28 01:31:05'),
(33, 'App\\Models\\User', 3, 'app', '435165919f5989c2e6781f2a7d6743d22ede12cdbd192f8cabeb2e912789563b', '[\"*\"]', NULL, NULL, '2023-03-29 11:31:05', '2023-03-29 11:31:05'),
(34, 'App\\Models\\User', 3, 'app', 'b538a6034e46a91bb41d146156ca1ffd77d834570a08f2c46ba29ef19a263f5b', '[\"*\"]', NULL, NULL, '2023-03-29 11:56:25', '2023-03-29 11:56:25'),
(35, 'App\\Models\\User', 3, 'app', 'f6d8baaa4bb5735d0777792a3fb63c6b9c9d85f3ed6ce48e63c436d90f2bb74f', '[\"*\"]', NULL, NULL, '2023-03-30 02:40:00', '2023-03-30 02:40:00'),
(36, 'App\\Models\\User', 3, 'app', 'c707d5b3a53e67e2a075a57cb363484eaa9e743ee485d8a652707a60db2f41a9', '[\"*\"]', NULL, NULL, '2023-04-08 00:43:21', '2023-04-08 00:43:21'),
(37, 'App\\Models\\User', 10, 'app', 'f004d290f6ba2cff1aa1b815665446bc0125b2b948c631efa7e808b93744ca07', '[\"*\"]', NULL, NULL, '2023-04-12 15:52:12', '2023-04-12 15:52:12'),
(38, 'App\\Models\\User', 10, 'app', '46c8306e364233130a34f88fb5d2f353acb7dc4b0cd47be54c7fae6d13100abd', '[\"*\"]', '2023-04-12 19:46:59', NULL, '2023-04-12 15:52:17', '2023-04-12 19:46:59'),
(39, 'App\\Models\\User', 3, 'app', 'a28532931f41ad31b6a70068c5c741fba651c30a9222f769549c8f3701d37457', '[\"*\"]', NULL, NULL, '2023-04-14 18:58:35', '2023-04-14 18:58:35'),
(40, 'App\\Models\\User', 3, 'app', '1981872f9ece38bc1e0c7f187bfd6ea069bac835917414b99ada326d5fe29e1d', '[\"*\"]', NULL, NULL, '2023-04-15 22:36:04', '2023-04-15 22:36:04'),
(41, 'App\\Models\\User', 3, 'app', 'e5657cafe18446af2365e1e6fda827791245e813653d91cea445a1dacb076122', '[\"*\"]', NULL, NULL, '2023-04-15 23:44:57', '2023-04-15 23:44:57'),
(42, 'App\\Models\\User', 3, 'app', '805e6ea7e41ce56647132389c122b58dc9f697da93ffb9d356e829c2aa4692fd', '[\"*\"]', NULL, NULL, '2023-04-16 13:21:40', '2023-04-16 13:21:40'),
(43, 'App\\Models\\User', 3, 'app', '0a3da94481b01dd2b21cf6e322d64f839d83d86544f079a83c5f3fd43cc77483', '[\"*\"]', NULL, NULL, '2023-04-17 06:10:52', '2023-04-17 06:10:52'),
(44, 'App\\Models\\User', 3, 'app', 'fbdfcbb2fd8b858b6d36af91bd50b93cc5b9ed0c66203acbc1f568ddfc75d627', '[\"*\"]', NULL, NULL, '2023-04-17 07:14:58', '2023-04-17 07:14:58'),
(45, 'App\\Models\\User', 3, 'app', 'dc29d92efd8e15b64129b412aafb3a5df75eb1030a75b6739881c3249c6fe9ad', '[\"*\"]', NULL, NULL, '2023-04-17 11:40:18', '2023-04-17 11:40:18'),
(46, 'App\\Models\\User', 3, 'app', '4eebe6c6952dccff0b5d930a9756b9999efdf0ed293ff4ce7fe0855de0163603', '[\"*\"]', '2023-04-17 12:27:54', NULL, '2023-04-17 12:19:26', '2023-04-17 12:27:54'),
(47, 'App\\Models\\User', 3, 'app', '4dde3ac112fb83399956f8b29c20c09f0301e868a8539c0d25b269b03000ba0e', '[\"*\"]', NULL, NULL, '2023-04-22 01:46:38', '2023-04-22 01:46:38'),
(48, 'App\\Models\\User', 3, 'app', '385a77c7317879a4b399add9630a75a2f217ce14f118e9328d1a9279643e8125', '[\"*\"]', NULL, NULL, '2023-04-24 04:14:50', '2023-04-24 04:14:50'),
(49, 'App\\Models\\User', 3, 'app', '3e7c9ff98e966821cfa35332c85db73ffe3c528171a043999f1aed6e1c2e8b0f', '[\"*\"]', NULL, NULL, '2023-04-24 04:33:42', '2023-04-24 04:33:42'),
(50, 'App\\Models\\User', 3, 'app', 'ed7e20ad1c5ae776086b5bed8d92120a3449766b314725c833fb19feecf0f915', '[\"*\"]', NULL, NULL, '2023-04-24 04:59:31', '2023-04-24 04:59:31'),
(51, 'App\\Models\\User', 3, 'app', '809d5a582700fd03764505b6169627c5a2621e8e18ac3a3e4eaa43f5de28df21', '[\"*\"]', '2023-04-24 05:57:39', NULL, '2023-04-24 05:04:11', '2023-04-24 05:57:39'),
(52, 'App\\Models\\User', 3, 'app', 'cdbd22e4b99130e6debea6bf3fd5e16c12e6ea9ae2ea05cc9bb2200b8044df97', '[\"*\"]', '2023-04-24 06:40:55', NULL, '2023-04-24 06:28:35', '2023-04-24 06:40:55'),
(53, 'App\\Models\\User', 11, 'app', '8943aec97dc08864e4be8cd5e5a82db95cff75777a6cb2bf0c484ed3bf618374', '[\"*\"]', '2023-04-24 09:03:41', NULL, '2023-04-24 09:03:02', '2023-04-24 09:03:41'),
(54, 'App\\Models\\User', 11, 'app', '89c4002134b11e10edfb0c3bcaeb7e2693d4fdeb33b9e657d0e2694c56eaa85a', '[\"*\"]', NULL, NULL, '2023-04-25 07:25:31', '2023-04-25 07:25:31'),
(55, 'App\\Models\\User', 3, 'app', 'bcc9dfb5794ae1c63873ebec3d11b384da948e51098d1e536fde8bcc307f5a99', '[\"*\"]', '2023-04-25 23:38:52', NULL, '2023-04-25 21:39:34', '2023-04-25 23:38:52'),
(56, 'App\\Models\\User', 3, 'app', '5ded40ff1de835a768e9c615634148a7de96a0be13c3ae42cca0d1d4b8438a87', '[\"*\"]', '2023-04-29 14:10:14', NULL, '2023-04-25 22:53:38', '2023-04-29 14:10:14'),
(57, 'App\\Models\\User', 3, 'app', '98a8e579069b5d55746f1f9d166012070df63200f26a6124ba27ea74946dd535', '[\"*\"]', '2023-04-27 10:28:14', NULL, '2023-04-27 09:39:57', '2023-04-27 10:28:14'),
(58, 'App\\Models\\User', 3, 'app', 'c5f8edbfca4e895ef702b3e84d761e95e16635382288ca7cedc8ccfa8e114116', '[\"*\"]', '2023-04-30 16:30:46', NULL, '2023-04-28 12:40:22', '2023-04-30 16:30:46'),
(59, 'App\\Models\\User', 3, 'app', '7574fab55d5dea31f3e3da05cfd701837875adaf5cbff695c264fb23121618eb', '[\"*\"]', '2023-05-10 18:26:13', NULL, '2023-04-30 16:34:23', '2023-05-10 18:26:13'),
(60, 'App\\Models\\User', 12, 'app', '3c2b9b4a7949a6f68d502ed61a787c533c3b6cece141953a16a75980a2776cbc', '[\"*\"]', NULL, NULL, '2023-05-13 04:40:02', '2023-05-13 04:40:02'),
(61, 'App\\Models\\User', 3, 'app', '93b5561944497226ad320ce5269e8559c7b4a1f5fb85700790b09af3c29163d2', '[\"*\"]', '2023-05-21 00:09:49', NULL, '2023-05-15 01:00:15', '2023-05-21 00:09:49'),
(62, 'App\\Models\\User', 13, 'app', '5610b1f951d79a5e787db1f121118801ed716be5d7ac2f90050d060f8ab7fd95', '[\"*\"]', NULL, NULL, '2023-05-15 06:05:24', '2023-05-15 06:05:24'),
(63, 'App\\Models\\User', 13, 'app', '50c8f3c0f8363bf48372874ff341ad573d4e477cd25c57c42c1af867e0aba933', '[\"*\"]', '2023-05-17 03:53:35', NULL, '2023-05-15 06:07:13', '2023-05-17 03:53:35'),
(64, 'App\\Models\\User', 14, 'app', '4d000dac37afd87a4e48bbd613ac2cc808d4df3f4024360d4df6697487a83f82', '[\"*\"]', '2023-05-18 15:25:11', NULL, '2023-05-18 15:23:02', '2023-05-18 15:25:11'),
(65, 'App\\Models\\User', 15, 'app', 'd69f43f3deaa19241cc37765cf40ad5106513dee702632bcaf1d1702a5ba71f8', '[\"*\"]', '2023-05-18 16:39:13', NULL, '2023-05-18 16:38:48', '2023-05-18 16:39:13'),
(66, 'App\\Models\\User', 15, 'app', '00c3a36a936d35a123680d395ce02f4d13605cde706696f8085d7b6c44c4cc6e', '[\"*\"]', '2023-05-21 17:14:25', NULL, '2023-05-18 16:42:08', '2023-05-21 17:14:25'),
(67, 'App\\Models\\User', 16, 'app', '27f70076e283a0df50b065de3338ce2b369989cd078b43b3a643095679d3dfec', '[\"*\"]', '2023-05-20 01:53:39', NULL, '2023-05-20 01:52:28', '2023-05-20 01:53:39'),
(68, 'App\\Models\\User', 17, 'app', '118c734eea725e6fcb83ca7cd66a60d84944a1e7a93bce1adb223f9cd5e38ea1', '[\"*\"]', '2023-05-20 13:51:19', NULL, '2023-05-20 13:50:56', '2023-05-20 13:51:19'),
(69, 'App\\Models\\User', 18, 'app', '3ed72a9417f9af5a8a9b59dd71a069c405989f930c91a1d4fb21818c5d2bb561', '[\"*\"]', NULL, NULL, '2023-05-20 13:56:48', '2023-05-20 13:56:48'),
(70, 'App\\Models\\User', 19, 'app', '0c88f480e7a69a72154f072cb89a2771ef9ee005c263ed4f20b660255c0784f7', '[\"*\"]', '2023-05-20 23:34:28', NULL, '2023-05-20 23:33:54', '2023-05-20 23:34:28'),
(71, 'App\\Models\\User', 3, 'app', '138082af851fcd6548512e7ef3735cbcfe804b4e33256207bbce678a5cbe3196', '[\"*\"]', '2023-05-21 09:31:07', NULL, '2023-05-21 00:11:03', '2023-05-21 09:31:07'),
(72, 'App\\Models\\User', 13, 'app', '4ff5154d992fd2dd8d675f9211b643712d7f528323632c51e3e5f67510bca4c8', '[\"*\"]', NULL, NULL, '2023-05-21 02:07:36', '2023-05-21 02:07:36'),
(73, 'App\\Models\\User', 13, 'app', '1c743f404b67ce19d13b64078f9de17afb85e2bce178356c5547b6d9bf9fc96b', '[\"*\"]', NULL, NULL, '2023-05-21 02:08:18', '2023-05-21 02:08:18'),
(74, 'App\\Models\\User', 13, 'app', '6a275013a84927112a4213f728d58f2786368b21796c50888a7df6715d599b40', '[\"*\"]', '2023-05-22 01:17:45', NULL, '2023-05-21 09:53:01', '2023-05-22 01:17:45'),
(75, 'App\\Models\\User', 20, 'app', '8492560e445117ad151a18e325caf6fafc9c20485b497f926bb234b5bd01275c', '[\"*\"]', '2023-05-24 17:23:52', NULL, '2023-05-24 17:22:44', '2023-05-24 17:23:52'),
(76, 'App\\Models\\User', 20, 'app', '0115667984696e667a059f2c670d124ade1fee98adb3668aac9563ea99127c6b', '[\"*\"]', '2023-08-10 10:37:33', NULL, '2023-05-24 17:24:46', '2023-08-10 10:37:33'),
(77, 'App\\Models\\User', 4, 'app', '8d35dfa074eb3be8c978dd23cc32b05a40076bbc7b14ddedb23e7eb762ac70ab', '[\"*\"]', '2023-05-31 11:12:54', NULL, '2023-05-29 08:48:34', '2023-05-31 11:12:54'),
(78, 'App\\Models\\User', 4, 'app', 'e7c47571309552326a8605bcaceed92d8e6962994dad373ffe6fd89764726e42', '[\"*\"]', '2023-06-03 12:47:22', NULL, '2023-06-03 05:34:03', '2023-06-03 12:47:22'),
(79, 'App\\Models\\User', 13, 'app', 'a4f8467d2cfdc8afbb3a7ef3159c4ec35c0ec22f9d96c8a3e9d4c362f5eeb67a', '[\"*\"]', '2023-06-20 03:34:31', NULL, '2023-06-04 05:54:35', '2023-06-20 03:34:31'),
(80, 'App\\Models\\User', 4, 'app', 'd0366d352da287c5bf1bb2e1e76a8bb3750724e241d3a6b8026fe050db481bd0', '[\"*\"]', '2023-06-21 03:45:33', NULL, '2023-06-13 10:11:31', '2023-06-21 03:45:33'),
(81, 'App\\Models\\User', 4, 'app', '79595184a3114a87e226df4b1e09c4fe786084b85e5ae26a20fdcd32f85dfaf0', '[\"*\"]', '2023-06-21 03:51:11', NULL, '2023-06-21 03:45:54', '2023-06-21 03:51:11'),
(82, 'App\\Models\\User', 4, 'app', 'b43263227682ac5c819ecf2f17fb8bfb54208bd0715ec036c82b2b78358c2c7f', '[\"*\"]', NULL, NULL, '2023-07-07 05:12:26', '2023-07-07 05:12:26'),
(83, 'App\\Models\\User', 4, 'app', '21b226b622c4f5e8c0bee08df24a671222dd8d914f0c62a905ccf9664979b9d5', '[\"*\"]', '2023-09-28 22:07:57', NULL, '2023-07-07 05:13:48', '2023-09-28 22:07:57'),
(84, 'App\\Models\\User', 13, 'app', 'cdfea38d5417f120da42633ff36589e3623503e3d16c5501fbb90f0146b53a50', '[\"*\"]', NULL, NULL, '2023-07-07 05:14:37', '2023-07-07 05:14:37'),
(85, 'App\\Models\\User', 13, 'app', 'e746873406373a2c9195c902a602ec7b60924b6cb3668de265a7acdc7752a91d', '[\"*\"]', NULL, NULL, '2023-07-07 05:17:45', '2023-07-07 05:17:45'),
(86, 'App\\Models\\User', 13, 'app', '3d1459a3d653c086db390a41df527e463374536344997384ad2baea401468e05', '[\"*\"]', '2023-07-27 04:25:51', NULL, '2023-07-09 04:49:03', '2023-07-27 04:25:51'),
(87, 'App\\Models\\User', 21, 'app', '78454050c2ec94ae9825922dc6df3f1ee1fa3484a0d6951adb3777a496b3b3f0', '[\"*\"]', NULL, NULL, '2023-07-09 09:50:09', '2023-07-09 09:50:09'),
(88, 'App\\Models\\User', 21, 'app', '20d5861a21e228fc4599b30462c6d972d2d58c80b03c67e9f9b6d908ff7a556c', '[\"*\"]', '2023-08-07 08:00:17', NULL, '2023-07-09 09:51:21', '2023-08-07 08:00:17'),
(89, 'App\\Models\\User', 4, 'app', 'cab75262613e96ca86956bc98f944b83d182cf8a4de8002ccdd8faa1f040dd37', '[\"*\"]', '2023-08-25 14:45:16', NULL, '2023-08-20 07:04:23', '2023-08-25 14:45:16'),
(90, 'App\\Models\\User', 21, 'app', '69b6e8e762c35b44638c7139b623d1b77b572631fcd35397a78f15b378cd0d4d', '[\"*\"]', '2023-09-13 03:50:13', NULL, '2023-08-28 07:06:41', '2023-09-13 03:50:13'),
(91, 'App\\Models\\User', 22, 'app', 'c8fb505ee0a37e2dd88cf50fe7a96e9a85d247d388931a0c47b35493e215c6bd', '[\"*\"]', NULL, NULL, '2023-10-04 02:51:51', '2023-10-04 02:51:51'),
(92, 'App\\Models\\User', 22, 'app', 'de5e3b25964d124f34c2465a58c900041c05348d9e1cf36fbf1310c26f5d5ff5', '[\"*\"]', '2023-10-04 02:55:48', NULL, '2023-10-04 02:54:06', '2023-10-04 02:55:48'),
(93, 'App\\Models\\User', 23, 'app', '4692d5c8fcec414bac77eced7f8619cc4fa3eda53f2b2449287c989aab700e04', '[\"*\"]', '2023-10-04 03:04:32', NULL, '2023-10-04 02:58:22', '2023-10-04 03:04:32'),
(94, 'App\\Models\\User', 23, 'app', '3799a98f696980d297301e351eb67acd907947e88c5241b42094506e9048b5d2', '[\"*\"]', '2023-10-04 03:05:53', NULL, '2023-10-04 03:05:44', '2023-10-04 03:05:53'),
(95, 'App\\Models\\User', 23, 'app', '4f993d44a70829fae9b5c89867d6a1f1a54d37c817ab3d9e3b9ceb3f491cdef0', '[\"*\"]', NULL, NULL, '2023-10-04 03:13:17', '2023-10-04 03:13:17'),
(96, 'App\\Models\\User', 23, 'app', 'fdb9488c1526eb61beddeae9758ed68c91037ccbb3afd15ed5fdfa5759d8abd4', '[\"*\"]', '2023-10-04 04:11:51', NULL, '2023-10-04 03:15:06', '2023-10-04 04:11:51'),
(97, 'App\\Models\\User', 23, 'app', 'cce4763e146a090c6caec6d7e4498c3675779371b0387f60d243318f9261fd10', '[\"*\"]', NULL, NULL, '2023-10-04 04:19:26', '2023-10-04 04:19:26'),
(98, 'App\\Models\\User', 23, 'app', '7935cd5f9471ab6bf81e216276a26219bd98170590608edca6ef46f801df2f79', '[\"*\"]', NULL, NULL, '2023-10-04 04:20:30', '2023-10-04 04:20:30'),
(99, 'App\\Models\\User', 23, 'app', 'c3881e069548ba179e5c1dbb73b902b1cb060097bee0a96afebb591542cc9271', '[\"*\"]', NULL, NULL, '2023-10-04 04:28:04', '2023-10-04 04:28:04'),
(100, 'App\\Models\\User', 23, 'app', '795ca5dedbf4565c3a39061fa4def45b64b7f4947518af9e734ac26c8492bb8d', '[\"*\"]', '2023-10-05 16:07:05', NULL, '2023-10-04 04:34:57', '2023-10-05 16:07:05'),
(101, 'App\\Models\\User', 23, 'app', '6b0fe350b2ba524940468c1c47614313e79689e2912df2e3ea4ba7f68a0c7a0f', '[\"*\"]', NULL, NULL, '2023-10-07 06:00:37', '2023-10-07 06:00:37'),
(102, 'App\\Models\\User', 22, 'app', 'd2eb1c6a1bb14fcfb777aaaf50339e4be05749493232e4815a48733519f372c3', '[\"*\"]', NULL, NULL, '2023-10-07 06:02:35', '2023-10-07 06:02:35'),
(103, 'App\\Models\\User', 23, 'app', '41386e7cd42a6e5206c565f6b801245093ba60514516b022f2a50dad26bda67e', '[\"*\"]', '2023-10-18 11:57:05', NULL, '2023-10-07 16:41:07', '2023-10-18 11:57:05'),
(104, 'App\\Models\\User', 23, 'app', '8870cb19fa07d0abea6869f003a5c0f681ac51c32c3f98331276fc764c6a4578', '[\"*\"]', NULL, NULL, '2023-10-08 03:45:25', '2023-10-08 03:45:25'),
(105, 'App\\Models\\User', 22, 'app', '512f4b65dd0192ae5e82ac6a4b8da71a089014d9e803e1e7ebc3b1459ddf7c1d', '[\"*\"]', '2023-10-11 13:53:46', NULL, '2023-10-08 03:45:39', '2023-10-11 13:53:46'),
(106, 'App\\Models\\User', 23, 'app', '7796871b592d4769daadd5d54c58956c5e41dc04ebc7c04e4f394f3510809a5b', '[\"*\"]', NULL, NULL, '2023-10-08 14:03:18', '2023-10-08 14:03:18'),
(107, 'App\\Models\\User', 23, 'app', '320c6917d598c5a3093022dd2c73a94e276a27dfc319c23bdea40930bf0a0aad', '[\"*\"]', NULL, NULL, '2023-10-08 14:55:04', '2023-10-08 14:55:04'),
(108, 'App\\Models\\User', 23, 'app', 'edca8a3f2ca997153dacf5d75a4dd745c12d48a3fd872d8d6e0b77d197b60adf', '[\"*\"]', '2023-10-09 01:25:47', NULL, '2023-10-09 00:54:43', '2023-10-09 01:25:47'),
(109, 'App\\Models\\User', 23, 'app', '42974fbe1f580efde964733df743736dcb9732653896ac5c5c528d3e8ec460d4', '[\"*\"]', '2023-10-09 02:19:06', NULL, '2023-10-09 02:19:05', '2023-10-09 02:19:06'),
(110, 'App\\Models\\User', 23, 'app', '6df5b00bb42a4140fa096008ce66754df23bd551360cce2401ce0d7513a8876f', '[\"*\"]', '2023-10-09 02:19:12', NULL, '2023-10-09 02:19:11', '2023-10-09 02:19:12'),
(111, 'App\\Models\\User', 23, 'app', 'a8b5469a704d7e05454233c1335ad09b89e79a955d03f1e437f6fc827c2c513d', '[\"*\"]', '2023-10-09 02:20:50', NULL, '2023-10-09 02:20:49', '2023-10-09 02:20:50'),
(112, 'App\\Models\\User', 23, 'app', '78d2e7db86fdbce78bb55712bccfc300500d0841bd2add159fc3ae0d81991481', '[\"*\"]', '2023-10-09 02:22:50', NULL, '2023-10-09 02:20:59', '2023-10-09 02:22:50'),
(113, 'App\\Models\\User', 23, 'app', '118894a4f04e863ce2346016cf5c50bf98dbd176e9878d0be142404b2c9ce6e9', '[\"*\"]', '2023-10-09 02:24:07', NULL, '2023-10-09 02:22:58', '2023-10-09 02:24:07'),
(114, 'App\\Models\\User', 23, 'app', 'b862467dcb6a01e5e5e5d91aa4f0b7d88a37ac23c1aaaeafc2b65fd0eaa9c1d2', '[\"*\"]', '2023-10-09 13:05:46', NULL, '2023-10-09 04:49:40', '2023-10-09 13:05:46'),
(115, 'App\\Models\\User', 23, 'app', 'ae15f6f416b1f9b98999148b83528b223cc42ea98b0f4bcddbcf4adccd7dfd62', '[\"*\"]', '2023-10-09 13:05:50', NULL, '2023-10-09 13:05:48', '2023-10-09 13:05:50'),
(116, 'App\\Models\\User', 23, 'app', '15e08d608d9b4cf61389fa73002b40f6a257d9a715c24c097d0e32f490d79ba9', '[\"*\"]', '2023-10-09 13:05:55', NULL, '2023-10-09 13:05:53', '2023-10-09 13:05:55'),
(117, 'App\\Models\\User', 23, 'app', '024f05417d853e82e538df10592c777e22ca00dbd4b5588b09ba5e58dba4d91d', '[\"*\"]', '2023-10-09 13:07:45', NULL, '2023-10-09 13:07:07', '2023-10-09 13:07:45'),
(118, 'App\\Models\\User', 23, 'app', 'f9c5106695f2f48ea77663f80fd72569013684d7fe5dd8aa1b44a325d91ff984', '[\"*\"]', '2023-10-09 16:16:48', NULL, '2023-10-09 16:12:08', '2023-10-09 16:16:48'),
(119, 'App\\Models\\User', 23, 'app', '3b1db78ca822369b17064e636f9baedf4cf7b0bb0568f83e7611e28e7e78ad48', '[\"*\"]', '2023-10-09 21:39:47', NULL, '2023-10-09 20:27:55', '2023-10-09 21:39:47'),
(120, 'App\\Models\\User', 23, 'app', 'f7b1c318eda29fbf9baae53674bfa2e4d40fe1862c0fca2bdfe9466049be192a', '[\"*\"]', '2023-10-09 21:47:12', NULL, '2023-10-09 21:46:52', '2023-10-09 21:47:12'),
(121, 'App\\Models\\User', 23, 'app', 'e5bc82fa0103e32f05176b47b92565430f6135f072077f05d5530ef4c0e8ea72', '[\"*\"]', '2023-10-09 22:08:28', NULL, '2023-10-09 21:52:57', '2023-10-09 22:08:28'),
(122, 'App\\Models\\User', 23, 'app', 'eece84180a324d4257526706d43510357e369a4632537a84b171048918d4c05d', '[\"*\"]', '2023-10-09 22:08:48', NULL, '2023-10-09 22:08:45', '2023-10-09 22:08:48'),
(123, 'App\\Models\\User', 23, 'app', 'b4792310e05969c4ce96d7df0221e835bb206f484f185dab021bb9f382eac7ef', '[\"*\"]', '2023-10-10 15:20:11', NULL, '2023-10-09 22:17:58', '2023-10-10 15:20:11'),
(124, 'App\\Models\\User', 21, 'app', '1ec8665613c8bddd0f93f261b09bcaa95e2223d0872fabb096d417d2040e462d', '[\"*\"]', '2023-10-10 08:57:07', NULL, '2023-10-10 08:57:05', '2023-10-10 08:57:07'),
(125, 'App\\Models\\User', 21, 'app', '5e4831bf18b509e97970e8e54deade0c6ec81b4e5807061c3c7039de2d69f39b', '[\"*\"]', '2023-10-10 09:01:22', NULL, '2023-10-10 08:57:41', '2023-10-10 09:01:22'),
(126, 'App\\Models\\User', 23, 'app', '760d326004e1115f24baecf6882007879bf58e4be41b886fe902e7c6b952d8a0', '[\"*\"]', '2023-10-11 14:01:33', NULL, '2023-10-10 14:34:09', '2023-10-11 14:01:33'),
(127, 'App\\Models\\User', 24, 'app', '057680e513ae502f19a06d4905dda8fe2f1347c62202c44768678df263f05a43', '[\"*\"]', '2023-11-22 10:33:57', NULL, '2023-10-11 14:00:41', '2023-11-22 10:33:57'),
(128, 'App\\Models\\User', 23, 'app', '9f6aea14b0ad1391fdfc17edabbd5c6bd32e329aa9c7dd3bbe0cfd9eda119fbb', '[\"*\"]', '2023-10-11 15:32:43', NULL, '2023-10-11 15:23:48', '2023-10-11 15:32:43'),
(129, 'App\\Models\\User', 23, 'app', '955063774104953d9143c39d1f7ab5e9d3d536ec96c55c6fdd986c82d483775f', '[\"*\"]', '2023-10-11 15:42:42', NULL, '2023-10-11 15:34:13', '2023-10-11 15:42:42'),
(130, 'App\\Models\\User', 24, 'app', '7c256dac805e7394796ee6dfee1db4d4825c870d581574f9accae7a7fa1afe8a', '[\"*\"]', '2023-10-14 03:43:40', NULL, '2023-10-11 15:35:02', '2023-10-14 03:43:40'),
(131, 'App\\Models\\User', 23, 'app', '7a58051f2ce02e923b634c4b2ff117b34ab29edb0b2cfd97c5f55ba4a0501d5c', '[\"*\"]', '2023-10-11 15:50:05', NULL, '2023-10-11 15:47:46', '2023-10-11 15:50:05'),
(132, 'App\\Models\\User', 23, 'app', 'a2baf5f261aaabe5c57f4c3f7e2056eac230b4d9c9d8425a7f33a5a5e325f962', '[\"*\"]', '2023-10-11 15:53:47', NULL, '2023-10-11 15:52:47', '2023-10-11 15:53:47'),
(133, 'App\\Models\\User', 23, 'app', '8aeb695105d681073dda50a052678ee68d7d50269e9ff01313a9128c11ff9f65', '[\"*\"]', '2023-10-13 12:05:56', NULL, '2023-10-11 15:57:18', '2023-10-13 12:05:56'),
(134, 'App\\Models\\User', 24, 'app', '9063a1248f1e323d6ed15a9bb1596366ab1cbb42875aa558ea886b621491b056', '[\"*\"]', '2023-10-18 12:15:51', NULL, '2023-10-11 16:46:19', '2023-10-18 12:15:51'),
(135, 'App\\Models\\User', 24, 'app', '7a8bf3cfb560e5d49ad015f04fe934af5a99e98ffe1a5c0b9c0b799f7a56943c', '[\"*\"]', '2023-11-07 08:42:35', NULL, '2023-10-12 06:26:32', '2023-11-07 08:42:35'),
(136, 'App\\Models\\User', 13, 'app', '04f67bed9111983131d64294e1854ea5e6522b60487d3cd02a650411877c2fd2', '[\"*\"]', '2023-10-12 08:22:16', NULL, '2023-10-12 08:21:36', '2023-10-12 08:22:16'),
(137, 'App\\Models\\User', 24, 'app', '7bbc52e16039fb3aa80b7dd2a2939536f8089e16a5dce6a10efe6004d31c61ba', '[\"*\"]', '2023-10-12 13:31:12', NULL, '2023-10-12 12:15:43', '2023-10-12 13:31:12'),
(138, 'App\\Models\\User', 24, 'app', '39b77a52fd6a27b8312a8774531a3c132f33eae9be63491051ae9f4361d2287c', '[\"*\"]', '2023-10-13 08:36:55', NULL, '2023-10-12 13:32:09', '2023-10-13 08:36:55'),
(139, 'App\\Models\\User', 23, 'app', 'ef65f9337e6d6c19c57d7e74d9b00de14eda9b703541a50c302dbe4fc19cf16a', '[\"*\"]', '2023-10-13 12:57:19', NULL, '2023-10-13 12:57:10', '2023-10-13 12:57:19'),
(140, 'App\\Models\\User', 23, 'app', '186bfaf612609780a65161b9c8bcb6992010f11a991d5834951ea80220d19684', '[\"*\"]', '2023-10-13 22:14:52', NULL, '2023-10-13 13:02:47', '2023-10-13 22:14:52'),
(141, 'App\\Models\\User', 13, 'app', '209c5986206b28dc0e76f525232a32b75a6d95e1b8b763267f1c25d25b1f0fd4', '[\"*\"]', '2023-11-22 00:49:57', NULL, '2023-10-13 16:43:52', '2023-11-22 00:49:57'),
(142, 'App\\Models\\User', 23, 'app', 'c365ae25b21bee733e465b56d16670582702daa1edb5a8f59d8f8816cdcb65d9', '[\"*\"]', '2023-10-13 22:00:13', NULL, '2023-10-13 21:59:46', '2023-10-13 22:00:13'),
(143, 'App\\Models\\User', 24, 'app', 'd90d989522fd62f4f6582a4f95484a905e4fb7fb9253e06abefcd63650ab532c', '[\"*\"]', '2023-10-14 12:45:22', NULL, '2023-10-13 22:00:50', '2023-10-14 12:45:22'),
(144, 'App\\Models\\User', 21, 'app', '6c772787a46c84d81db91d22fc8754f27c629923d29d42f41a378087310fb976', '[\"*\"]', '2023-10-14 11:41:49', NULL, '2023-10-14 11:36:46', '2023-10-14 11:41:49'),
(145, 'App\\Models\\User', 21, 'app', 'cc68bfd2502873cfbc8afb8bda5d23ae7c4bcd77f5f49e230102026154af5e6c', '[\"*\"]', '2023-10-14 11:53:48', NULL, '2023-10-14 11:43:30', '2023-10-14 11:53:48'),
(146, 'App\\Models\\User', 23, 'app', '7c80287d96dd28d8c9c2a0c6fa8f775c0408b6061524fd739a75e9f29fc8c3db', '[\"*\"]', '2023-10-14 13:06:41', NULL, '2023-10-14 13:06:35', '2023-10-14 13:06:41'),
(147, 'App\\Models\\User', 24, 'app', 'b9e004386baa995fdfe75000a556d0d3c142bc1c1373ffabd6717967e6165a4f', '[\"*\"]', '2023-10-15 15:47:18', NULL, '2023-10-14 13:07:11', '2023-10-15 15:47:18'),
(148, 'App\\Models\\User', 24, 'app', '124a298fd00198c13e20eefb7f1d8805317f7851bb4f0c399be667a238ef1a0e', '[\"*\"]', '2023-10-15 05:08:41', NULL, '2023-10-15 05:08:07', '2023-10-15 05:08:41'),
(149, 'App\\Models\\User', 24, 'app', '3fd6d775614ded1906aab58941542357d35f8bdc57c2f3186baf0f48b1657e56', '[\"*\"]', '2023-10-15 05:19:48', NULL, '2023-10-15 05:09:54', '2023-10-15 05:19:48'),
(150, 'App\\Models\\User', 25, 'app', 'c5822d2097b0fe15d51369f20788121aac1f2be0d314291482831e848c38c8f9', '[\"*\"]', '2023-10-17 06:38:44', NULL, '2023-10-15 16:34:09', '2023-10-17 06:38:44'),
(151, 'App\\Models\\User', 24, 'app', 'c749c1a3fffc376364db2bc14dc0f4385157dcd1ab13f06f4b4eaed446e7d03e', '[\"*\"]', '2023-10-17 15:12:03', NULL, '2023-10-17 14:31:36', '2023-10-17 15:12:03'),
(152, 'App\\Models\\User', 24, 'app', 'c6255bb8e957566ba0e64052f5d16b807d1573dd09e68366ca30037cd23ddecc', '[\"*\"]', '2023-10-19 12:52:29', NULL, '2023-10-17 15:22:53', '2023-10-19 12:52:29'),
(153, 'App\\Models\\User', 24, 'app', '23d38fb7a89db9d6d479bf7d63c7253e5c6563c3835d9e6211af70d4c06f7d08', '[\"*\"]', '2023-11-05 13:59:58', NULL, '2023-10-18 09:03:56', '2023-11-05 13:59:58'),
(154, 'App\\Models\\User', 24, 'app', '2b32091c903b77ee57f18bcf176c4579b7d682ca566e8b3781b5d1e4e204dea4', '[\"*\"]', '2023-11-02 16:09:51', NULL, '2023-10-18 11:06:11', '2023-11-02 16:09:51'),
(155, 'App\\Models\\User', 26, 'app', 'da7fc9e01324c8a80e35c8968431a39b04513a1dc3eb9876ad1464dda9a296ed', '[\"*\"]', NULL, NULL, '2023-10-18 12:14:33', '2023-10-18 12:14:33'),
(156, 'App\\Models\\User', 26, 'app', '9dc1dcc89c1a7821311a60f5e87cb5acb12e7c5c41bd1e7b236962d57105c29e', '[\"*\"]', '2023-10-18 12:43:25', NULL, '2023-10-18 12:15:36', '2023-10-18 12:43:25'),
(157, 'App\\Models\\User', 21, 'app', 'ad41313d59fd974f7160ff16f0001a3b26d547ab3cb9096438491a7531f58354', '[\"*\"]', '2023-10-18 13:36:42', NULL, '2023-10-18 13:16:13', '2023-10-18 13:36:42'),
(158, 'App\\Models\\User', 21, 'app', 'dddcab19edde572908c06e6248c001b053687b6c5c51b9702ea43be18306a0a2', '[\"*\"]', '2023-10-18 20:13:40', NULL, '2023-10-18 13:19:36', '2023-10-18 20:13:40'),
(159, 'App\\Models\\User', 24, 'app', '1a91168c9f781137fe95bd480f579916c199fa3dd71161b1bfc110dcbe7d0662', '[\"*\"]', '2023-10-19 16:33:58', NULL, '2023-10-18 13:24:31', '2023-10-19 16:33:58'),
(160, 'App\\Models\\User', 13, 'app', 'e1a861e7466c8d03f7bf8dcdd1979b30fac111df99a56f8e0e041a0a997a57cd', '[\"*\"]', '2023-10-18 13:39:18', NULL, '2023-10-18 13:24:52', '2023-10-18 13:39:18'),
(161, 'App\\Models\\User', 21, 'app', '097c8004ebcfb605634fad2579da0e9f6fb0bffda282c6fb40a694c4a10b32d6', '[\"*\"]', '2023-10-25 11:40:31', NULL, '2023-10-19 08:26:07', '2023-10-25 11:40:31'),
(162, 'App\\Models\\User', 24, 'app', 'ecbe5caabd85852b9b24bb59d49f3d04371d5c42b09cf26fa9911c1ad6858567', '[\"*\"]', '2023-11-06 10:12:07', NULL, '2023-10-19 15:14:38', '2023-11-06 10:12:07'),
(163, 'App\\Models\\User', 24, 'app', '64f784eb983eadcd3b7774818b0c088d9b164b117a04352cfbfcb9552d0b0626', '[\"*\"]', '2023-11-20 01:11:20', NULL, '2023-11-02 16:11:16', '2023-11-20 01:11:20'),
(164, 'App\\Models\\User', 24, 'app', 'cbc60f0f633da1ba7f913dedc8ded147f42a6ed5d0c4ba0a5576e8edb6a195f2', '[\"*\"]', '2023-11-05 17:19:02', NULL, '2023-11-05 17:18:44', '2023-11-05 17:19:02'),
(165, 'App\\Models\\User', 24, 'app', '9bd2db9e6366ce0db3bafc7e64567a6d49341c7fbb3616c378259962e204685a', '[\"*\"]', '2023-11-06 12:19:43', NULL, '2023-11-06 10:21:57', '2023-11-06 12:19:43'),
(166, 'App\\Models\\User', 24, 'app', '001b2e73a8a53073c85a78dbac649560b66367e0ea75e4c1fac8409ce0d232c0', '[\"*\"]', NULL, NULL, '2023-11-06 16:06:36', '2023-11-06 16:06:36'),
(167, 'App\\Models\\User', 24, 'app', 'a738cc5330c86d352cd56a75151b9cf380750f4a3510274ba0a612980c7aa405', '[\"*\"]', '2023-12-11 10:02:07', NULL, '2023-11-06 16:07:25', '2023-12-11 10:02:07'),
(168, 'App\\Models\\User', 24, 'app', '5abba04eead08639c8df2c5c6dce220d86d2618b6793320d2a2e1573b06eb2cf', '[\"*\"]', '2023-11-24 01:25:36', NULL, '2023-11-08 11:34:45', '2023-11-24 01:25:36'),
(169, 'App\\Models\\User', 24, 'app', '7ee621c0d7a86199e06414cbc6c9ab4eeb1a7d426e88ae1b72b852d878318f25', '[\"*\"]', '2023-11-25 10:31:05', NULL, '2023-11-17 16:02:35', '2023-11-25 10:31:05'),
(170, 'App\\Models\\User', 24, 'app', '75b58ea2aeaaf5c4f9a61f01f26f4a10241349feda00f0e406adbe3fd11adcec', '[\"*\"]', '2023-11-25 12:50:05', NULL, '2023-11-25 10:56:59', '2023-11-25 12:50:05'),
(171, 'App\\Models\\User', 24, 'app', '45ac6ffcb70d1abdd78dada1f95ea25aa8fe4c2c74230dc3e4476ce13d35af7a', '[\"*\"]', '2023-11-25 13:12:48', NULL, '2023-11-25 12:39:07', '2023-11-25 13:12:48'),
(172, 'App\\Models\\User', 24, 'app', 'bb5c472465fc3395abe782bf294155be42557eadade96724870df80636047981', '[\"*\"]', '2023-12-01 14:02:40', NULL, '2023-11-28 11:44:02', '2023-12-01 14:02:40'),
(173, 'App\\Models\\User', 24, 'app', 'e8f18f0bc91885c0c7f5fc53cab7e2969c100d21b2344e2df0b854d495931a1f', '[\"*\"]', '2023-11-30 10:21:16', NULL, '2023-11-28 11:48:13', '2023-11-30 10:21:16'),
(174, 'App\\Models\\User', 13, 'app', 'd378911527839e882d850f2e6e771b88ade29d67ac7714c4c7188e75ca90ac0b', '[\"*\"]', '2023-11-30 14:01:03', NULL, '2023-11-30 10:51:23', '2023-11-30 14:01:03'),
(175, 'App\\Models\\User', 24, 'app', '94797f3782121429d8a6f2cc5a593bc1cb1976acd9f43af18489e8782dd8611e', '[\"*\"]', NULL, NULL, '2023-11-30 12:26:36', '2023-11-30 12:26:36'),
(176, 'App\\Models\\User', 24, 'app', '4aff4ec0ecc516555d57f8e10fe99331844c6ba9dc5ae45dff4b220921adebd9', '[\"*\"]', NULL, NULL, '2023-11-30 12:27:38', '2023-11-30 12:27:38'),
(177, 'App\\Models\\User', 24, 'app', '2b70f2d58a165735c73c5664cfcaedc172766b7ae9693d44332e55c867d957e7', '[\"*\"]', NULL, NULL, '2023-11-30 12:29:45', '2023-11-30 12:29:45'),
(178, 'App\\Models\\User', 24, 'app', '9dba44d5a20957a409bc3dfc60d999941d00c05b76ff5bbe34e04dcd35e49c9f', '[\"*\"]', NULL, NULL, '2023-11-30 12:30:02', '2023-11-30 12:30:02'),
(179, 'App\\Models\\User', 23, 'app', 'f2f4eaa4e334c6422dd6ab0a7a0cd0925af91c450dcf7440b99552f831d07523', '[\"*\"]', NULL, NULL, '2023-11-30 12:31:59', '2023-11-30 12:31:59'),
(180, 'App\\Models\\User', 23, 'app', '2ef21072602659f792ed66b4f3af0eddf9eb563d68ea1b31895e829d541880d8', '[\"*\"]', NULL, NULL, '2023-11-30 12:32:28', '2023-11-30 12:32:28'),
(181, 'App\\Models\\User', 23, 'app', '431dfcf2e6ed88ee3bef64f5cf277cbb376ae4511592e59b8e82a3c923b7db83', '[\"*\"]', NULL, NULL, '2023-11-30 12:33:14', '2023-11-30 12:33:14'),
(182, 'App\\Models\\User', 23, 'app', 'e7c94d6a226fbe83c9727e4bf7cbc3792c29ee855febb91f5f1f32d926fa9475', '[\"*\"]', NULL, NULL, '2023-11-30 12:33:26', '2023-11-30 12:33:26'),
(183, 'App\\Models\\User', 23, 'app', '6edf7e99a148781ff814414294068f908ce2d2d2f9e20e5a67112689cd2086ac', '[\"*\"]', NULL, NULL, '2023-11-30 12:45:02', '2023-11-30 12:45:02'),
(184, 'App\\Models\\User', 24, 'app', '268b8f5156393c802a9e49ddb1e55128355753cfa5812c71137c8cfacd5d4013', '[\"*\"]', NULL, NULL, '2023-11-30 12:46:53', '2023-11-30 12:46:53'),
(185, 'App\\Models\\User', 24, 'app', '42fc9d7a1c50fe825fa4d99b5394ae2e4715ed7399520caac87750840a736f16', '[\"*\"]', NULL, NULL, '2023-11-30 12:48:11', '2023-11-30 12:48:11'),
(186, 'App\\Models\\User', 24, 'app', 'a57ac24a1a818332122a40f1020432dbf04da252aca85cada5beca281bef4516', '[\"*\"]', NULL, NULL, '2023-12-01 11:49:27', '2023-12-01 11:49:27'),
(187, 'App\\Models\\User', 24, 'app', '3cb3510165d9c594e6063d1e96ffb0c5dfe0807d58a91864c397807ac5124474', '[\"*\"]', '2023-12-02 11:49:13', NULL, '2023-12-01 12:50:48', '2023-12-02 11:49:13'),
(188, 'App\\Models\\User', 27, 'app', '66f08078867351e35654f01d8fe883b9ffe05c1c8e62cbd1c0e994fa949dd1d9', '[\"*\"]', NULL, NULL, '2023-12-01 16:43:41', '2023-12-01 16:43:41'),
(189, 'App\\Models\\User', 27, 'app', 'cbe85950a7500cc55894120a224b107f6d41e60bc4b4a36631acfeb9c83b07ff', '[\"*\"]', '2023-12-01 16:58:15', NULL, '2023-12-01 16:50:40', '2023-12-01 16:58:15'),
(190, 'App\\Models\\User', 27, 'app', '7690c54051d5bba070ef57aef3c9c7ece6ccbdd79c57358769a1a7756d87ab70', '[\"*\"]', '2023-12-01 17:06:44', NULL, '2023-12-01 17:02:08', '2023-12-01 17:06:44'),
(191, 'App\\Models\\User', 24, 'app', 'dcacbc6f9ba6572dbd20c06230980c7943e47755bc3a2549230acc5efe0a7029', '[\"*\"]', '2023-12-02 12:14:00', NULL, '2023-12-02 11:59:42', '2023-12-02 12:14:00'),
(192, 'App\\Models\\User', 24, 'app', '25f7aeca3ed3df42bd8976be27308d573c1b95c0686e4cb5f3657186c079c142', '[\"*\"]', '2023-12-03 16:08:54', NULL, '2023-12-02 12:16:13', '2023-12-03 16:08:54'),
(193, 'App\\Models\\User', 24, 'app', '9715869e8667a3d54ef1c4822f6c597ce7fb5919a221c3166e560b1673d8a8ef', '[\"*\"]', '2023-12-02 13:06:57', NULL, '2023-12-02 13:03:45', '2023-12-02 13:06:57'),
(194, 'App\\Models\\User', 24, 'app', 'd0b5575e21f6a5f7b68df244a0a874cbb49c5cceea771e74c736844dc7d182c0', '[\"*\"]', '2023-12-03 16:09:37', NULL, '2023-12-03 16:08:56', '2023-12-03 16:09:37'),
(195, 'App\\Models\\User', 24, 'app', '714fa1c0615a4a302f20c5f33d690ee18a528f7dfa50acbeb623071e032d3588', '[\"*\"]', '2023-12-03 16:13:55', NULL, '2023-12-03 16:09:39', '2023-12-03 16:13:55'),
(196, 'App\\Models\\User', 24, 'app', '9d28dda8dc663cbd12421a5741f84faf785ea61e0f6430742ef3566c4cfbb13e', '[\"*\"]', '2023-12-05 11:44:46', NULL, '2023-12-03 16:15:16', '2023-12-05 11:44:46'),
(197, 'App\\Models\\User', 24, 'app', '527969b53e7ff9f557fb0519951d57ac6456261a083ebbfdf49bf11bdcda3aa6', '[\"*\"]', '2023-12-05 11:52:58', NULL, '2023-12-05 11:50:51', '2023-12-05 11:52:58'),
(198, 'App\\Models\\User', 28, 'app', 'ea35d46d19a184cf6a4c7227542579a7d80739df7c0a97d28cf636401128c48d', '[\"*\"]', '2023-12-11 19:39:58', NULL, '2023-12-05 11:52:27', '2023-12-11 19:39:58'),
(199, 'App\\Models\\User', 29, 'app', '4ebf39801169fba9d8eb4c3dcd414afe9230baa8833c258ac1f3e7f2e5d8ce7f', '[\"*\"]', NULL, NULL, '2023-12-05 15:19:16', '2023-12-05 15:19:16'),
(200, 'App\\Models\\User', 24, 'app', 'a9ddaed0caf2411d623d16cd6359ade44ab879d8d38e6878b8ae83a457b4ae29', '[\"*\"]', NULL, NULL, '2023-12-10 18:17:45', '2023-12-10 18:17:45'),
(201, 'App\\Models\\User', 28, 'app', '1d637e69b356e372d569ca3bfafb158f33023c83de25e04c920e1ab1edccfa66', '[\"*\"]', '2023-12-12 07:45:35', NULL, '2023-12-11 18:57:25', '2023-12-12 07:45:35'),
(202, 'App\\Models\\User', 24, 'app', '500238ec14226c8b5d8e46fd8303f4c1b52ca458b2fb5433117c84c9d1251841', '[\"*\"]', '2023-12-11 19:51:10', NULL, '2023-12-11 19:40:08', '2023-12-11 19:51:10'),
(203, 'App\\Models\\User', 30, 'app', '9de13df8941ab27e163df399b62202a01bffa5387288527f83a915a203720199', '[\"*\"]', NULL, NULL, '2023-12-16 08:08:19', '2023-12-16 08:08:19'),
(204, 'App\\Models\\User', 31, 'app', 'd2974224d942d91f03df5e8100561e16ed859d719b0b3b5e52d4e31f2e3f455e', '[\"*\"]', NULL, NULL, '2023-12-17 16:58:07', '2023-12-17 16:58:07'),
(205, 'App\\Models\\User', 28, 'app', '34e1560a0982bbdfcdd771a8bf4725df2187aac51c5d6b838266dc523b1859d3', '[\"*\"]', '2024-05-29 00:45:15', NULL, '2024-05-29 00:07:53', '2024-05-29 00:45:15'),
(206, 'App\\Models\\User', 28, 'app', '314b3103cf4b138036d9dd21d6b26849aa4e033f903113b0bf50398ccb601102', '[\"*\"]', '2024-05-29 00:50:17', NULL, '2024-05-29 00:45:57', '2024-05-29 00:50:17'),
(207, 'App\\Models\\User', 28, 'app', 'd950489b9accebeb093610759fc11735989deefea02245a37a73e0b4ba745325', '[\"*\"]', '2024-05-29 00:50:40', NULL, '2024-05-29 00:50:27', '2024-05-29 00:50:40'),
(208, 'App\\Models\\User', 28, 'app', '1bfe9d259cb97eaed5efbdf9bc75c05580d50239ab253ffbc455853d689c0137', '[\"*\"]', NULL, NULL, '2024-05-29 00:50:27', '2024-05-29 00:50:27'),
(209, 'App\\Models\\User', 28, 'app', '07180639c4255b021b08f89113efd2e2e54421d1fede297acb7afc75ee3deecb', '[\"*\"]', '2024-05-29 01:57:49', NULL, '2024-05-29 00:54:21', '2024-05-29 01:57:49'),
(210, 'App\\Models\\User', 28, 'app', '9b3ebf4e01a359ad63f9ac8df315f1469351c761d6f38197706ca28c149825f3', '[\"*\"]', '2024-05-29 04:20:10', NULL, '2024-05-29 02:00:28', '2024-05-29 04:20:10'),
(211, 'App\\Models\\User', 28, 'app', 'c10d398bfb5585a4bf768d592e778bd0f7e0725b7c9fec7fdac52bbded819ee0', '[\"*\"]', '2024-05-29 04:23:04', NULL, '2024-05-29 04:20:24', '2024-05-29 04:23:04'),
(212, 'App\\Models\\User', 28, 'app', 'efbe5edefcc7c27e38d4c9e7af7ceaaa70b84d07a9c78ccf340910d536a1d5f1', '[\"*\"]', '2024-05-29 23:17:58', NULL, '2024-05-29 04:23:33', '2024-05-29 23:17:58'),
(213, 'App\\Models\\User', 28, 'app', 'ba3c1bd59b588b27198ecca44bcf13fe74eceb32bb1e1632472f23e5eb05dd16', '[\"*\"]', '2024-05-29 23:34:20', NULL, '2024-05-29 23:18:32', '2024-05-29 23:34:20'),
(214, 'App\\Models\\User', 28, 'app', '0ee38a86d7cffa55ede38faed3268a225ef74ea0180f4e5d1f550be832c12d83', '[\"*\"]', '2024-05-30 01:52:03', NULL, '2024-05-29 23:36:08', '2024-05-30 01:52:03'),
(215, 'App\\Models\\User', 28, 'app', '633d99b0d2c1e08b5819ce241151f82f15f0f932e3937b57a894e14dd6e8ea75', '[\"*\"]', '2024-05-30 02:03:27', NULL, '2024-05-30 01:53:06', '2024-05-30 02:03:27'),
(216, 'App\\Models\\User', 28, 'app', 'aad88b6658d5df1ae7917d81b3fa1220abf597bc4f769c9541e9df82ef259455', '[\"*\"]', '2024-05-30 03:19:30', NULL, '2024-05-30 02:03:44', '2024-05-30 03:19:30'),
(217, 'App\\Models\\User', 28, 'app', 'f65092d8ec04cda162a45607e5a18f2ae5b1a8cccb3b089f926e68ffcb26e030', '[\"*\"]', '2024-05-30 03:52:01', NULL, '2024-05-30 03:22:31', '2024-05-30 03:52:01'),
(218, 'App\\Models\\User', 28, 'app', 'ae7aaef77c3795dfb020be06b6068b4d3327f1a6c148f4d3e03f1f8c6db524b9', '[\"*\"]', '2024-05-30 22:00:32', NULL, '2024-05-30 03:53:41', '2024-05-30 22:00:32'),
(219, 'App\\Models\\User', 28, 'app', '53550336f26cfb31ba2a2952b0c00feadd0e49a65d5c255b7755b5e1ff525be4', '[\"*\"]', '2024-05-31 04:30:43', NULL, '2024-05-30 04:21:22', '2024-05-31 04:30:43'),
(220, 'App\\Models\\User', 28, 'app', '86a847ac1058ae29a5b82bab34c7392ea93ecb59da880363c90dfc69bfe8e7a7', '[\"*\"]', '2024-05-31 04:30:20', NULL, '2024-05-30 22:33:02', '2024-05-31 04:30:20'),
(221, 'App\\Models\\User', 28, 'app', 'abfabe4527bb1451d8105cf950efb768924c94b6dfbff54a770e69301df9bf65', '[\"*\"]', '2024-06-01 01:37:34', NULL, '2024-05-31 04:30:37', '2024-06-01 01:37:34'),
(222, 'App\\Models\\User', 28, 'app', '7b5e539c50341e84449ef0e55e7d7e1f371d8197636ad6e2c824fd5f3b9b97d5', '[\"*\"]', '2024-06-06 05:37:01', NULL, '2024-05-31 04:34:43', '2024-06-06 05:37:01'),
(223, 'App\\Models\\User', 28, 'app', '6619e7b95e71c7f026ed80576a8dfd6ad675a04b760c6868b8798f9b800555f0', '[\"*\"]', '2024-06-02 00:55:15', NULL, '2024-06-01 00:03:00', '2024-06-02 00:55:15'),
(224, 'App\\Models\\User', 28, 'app', 'c2b38f3ee8f95a2873f974aaa3413b9599cd2b5075fec77d6988915d046bff51', '[\"*\"]', '2024-06-02 01:49:13', NULL, '2024-06-02 01:31:55', '2024-06-02 01:49:13'),
(225, 'App\\Models\\User', 28, 'app', 'd2878529e5230463d4691bc2d6a0b30d0b4b93ad86b0b959593c373a14063b69', '[\"*\"]', '2024-06-05 04:51:18', NULL, '2024-06-02 04:33:55', '2024-06-05 04:51:18'),
(226, 'App\\Models\\User', 28, 'app', '82d979bcb2ab1e43fedf0543e98a44046769df9d4fc2195a44c3fe9c2f3036eb', '[\"*\"]', '2024-06-05 05:30:44', NULL, '2024-06-05 04:53:30', '2024-06-05 05:30:44'),
(227, 'App\\Models\\User', 28, 'app', '0a0277a1fef6c65dc46a3034f76acce9dc4e5de427e20ca2346ded68e50b94e0', '[\"*\"]', '2024-06-05 05:31:57', NULL, '2024-06-05 05:31:56', '2024-06-05 05:31:57'),
(228, 'App\\Models\\User', 28, 'app', '8ef654e1a5ac5b706edfe58ecca52937a1440bc92014115263383b0b8e0b30db', '[\"*\"]', '2024-06-05 22:44:42', NULL, '2024-06-05 05:32:35', '2024-06-05 22:44:42'),
(229, 'App\\Models\\User', 28, 'app', 'd1647f83e4cd3d011fb997f122dc8d7822537271b0f91ef4787d71bcbdca741f', '[\"*\"]', '2024-06-05 22:52:25', NULL, '2024-06-05 22:44:56', '2024-06-05 22:52:25'),
(230, 'App\\Models\\User', 28, 'app', '6095d2525092e2984ec1c17ac90249bc30229eb2c122364c644a16c975c4ab58', '[\"*\"]', '2024-06-06 00:08:10', NULL, '2024-06-05 22:52:48', '2024-06-06 00:08:10'),
(231, 'App\\Models\\User', 28, 'app', 'a1a209c54afa5d65a1cbd5e2b02ae3709c1131d5a4d1c325a02790554da9fb94', '[\"*\"]', '2024-06-06 00:42:53', NULL, '2024-06-06 00:08:25', '2024-06-06 00:42:53'),
(232, 'App\\Models\\User', 28, 'app', '50f28ecb11a8b1193d6cc74827c60206546471ee42ffcc5dfa6399cd3f98d00a', '[\"*\"]', '2024-06-06 00:52:04', NULL, '2024-06-06 00:43:00', '2024-06-06 00:52:04'),
(233, 'App\\Models\\User', 32, 'app', 'f871c4f300d48b6d76cc4b03eb329b3c6726ea697069fca2c1f69a3bd1f6c794', '[\"*\"]', NULL, NULL, '2024-06-06 00:54:41', '2024-06-06 00:54:41'),
(234, 'App\\Models\\User', 28, 'app', 'e44c110f7d365c26b9b52e9b08a99c48a70633a60e83682b73a16cd7060f0afd', '[\"*\"]', '2024-06-06 02:10:50', NULL, '2024-06-06 00:55:34', '2024-06-06 02:10:50'),
(235, 'App\\Models\\User', 28, 'app', '5783dba4f1f26647241d1f5b70c35c07267c5219d498fe971da02f80f48cd5d2', '[\"*\"]', '2024-06-06 02:18:32', NULL, '2024-06-06 02:18:29', '2024-06-06 02:18:32'),
(236, 'App\\Models\\User', 28, 'app', 'ddf05b5212a2d308fb5272196e10c897e554db7f06b46c276e04fc093a765aca', '[\"*\"]', '2024-06-06 02:48:12', NULL, '2024-06-06 02:48:09', '2024-06-06 02:48:12'),
(237, 'App\\Models\\User', 28, 'app', 'b032f2402755d08861cfcb277075b5f1c49f7c77ff778cdf507a843e14b48ae4', '[\"*\"]', '2024-06-06 02:51:17', NULL, '2024-06-06 02:51:14', '2024-06-06 02:51:17'),
(238, 'App\\Models\\User', 28, 'app', '8d60244b21c250807fec0485c14f9d8291bf8c3b33d145433911b627f06e2207', '[\"*\"]', '2024-06-06 02:51:56', NULL, '2024-06-06 02:51:53', '2024-06-06 02:51:56'),
(239, 'App\\Models\\User', 28, 'app', 'ab22c4dcfc8abafa96969cd2e9846051824a02f640da2bdba36cd3473b2692c4', '[\"*\"]', '2024-06-06 02:56:07', NULL, '2024-06-06 02:56:04', '2024-06-06 02:56:07'),
(240, 'App\\Models\\User', 28, 'app', 'f8fc03ae93c55b29f3ced47f4944c502c31d13760e3a841b3ca04d1020c5a898', '[\"*\"]', '2024-06-06 02:58:22', NULL, '2024-06-06 02:58:08', '2024-06-06 02:58:22'),
(241, 'App\\Models\\User', 28, 'app', '3ff2a51229446685005bc5dcfafd3bb021e3d7caffe8c0ae896d47730891b65c', '[\"*\"]', '2024-06-06 03:27:33', NULL, '2024-06-06 03:00:26', '2024-06-06 03:27:33'),
(242, 'App\\Models\\User', 28, 'app', '71fb02d45c3293233618fbe91c8f8ea365df6792e26f2436d60106b2b2b8dcf0', '[\"*\"]', '2024-06-06 04:38:27', NULL, '2024-06-06 03:28:15', '2024-06-06 04:38:27'),
(243, 'App\\Models\\User', 28, 'app', 'df926093c4f99eec09723c094de1eb7ce21c1c3ef2a9e13cca678b428f0f721e', '[\"*\"]', '2024-06-06 05:23:19', NULL, '2024-06-06 04:48:41', '2024-06-06 05:23:19'),
(244, 'App\\Models\\User', 28, 'app', 'be87da2f1aeeb949428ab64dd81c247e9f797187b9d874bf1620f6773b665b1f', '[\"*\"]', '2024-06-06 05:23:38', NULL, '2024-06-06 05:21:00', '2024-06-06 05:23:38'),
(245, 'App\\Models\\User', 28, 'app', '82bdcde816be1f216904003c029ecf27951ac80a8405bd5c39b49af40c94fbd2', '[\"*\"]', '2024-06-06 05:23:51', NULL, '2024-06-06 05:23:47', '2024-06-06 05:23:51'),
(246, 'App\\Models\\User', 28, 'app', '887280de85fc24d20bbf97545bc4cf6fbcef72bfe7a7d1b7eda38129498a4e43', '[\"*\"]', '2024-06-06 05:26:11', NULL, '2024-06-06 05:26:07', '2024-06-06 05:26:11'),
(247, 'App\\Models\\User', 28, 'app', 'd0a765cbd58f33ee06849e500562977a0a89a0232499f74b68e886e4d277ddad', '[\"*\"]', '2024-06-06 05:28:04', NULL, '2024-06-06 05:27:58', '2024-06-06 05:28:04'),
(248, 'App\\Models\\User', 28, 'app', 'af19babcd1beb5c75d1d3e735e217f859a3a2e5b3f77879b2d1a09938db55cb7', '[\"*\"]', '2024-06-06 05:29:11', NULL, '2024-06-06 05:28:23', '2024-06-06 05:29:11'),
(249, 'App\\Models\\User', 28, 'app', '21a364fa03a434210832dbfb314d11f89e95e32bbe30d863daf7f55777068212', '[\"*\"]', '2024-06-06 05:31:32', NULL, '2024-06-06 05:30:04', '2024-06-06 05:31:32'),
(250, 'App\\Models\\User', 28, 'app', '427a67e6079c4ed207a389cb92b17819021ef0149ff8234e7d89e371b50c25a9', '[\"*\"]', '2024-06-06 05:32:16', NULL, '2024-06-06 05:32:12', '2024-06-06 05:32:16'),
(251, 'App\\Models\\User', 28, 'app', '3251b5659b61f4c43e0035bf9791e0a603721b45ed292b911078337d9ad52e57', '[\"*\"]', NULL, NULL, '2024-06-06 05:34:39', '2024-06-06 05:34:39'),
(252, 'App\\Models\\User', 28, 'app', '316ecbffcae89f596b34897eb741088374756d0ca40cbcad9195d7ea331b8d6e', '[\"*\"]', NULL, NULL, '2024-06-06 05:35:08', '2024-06-06 05:35:08'),
(253, 'App\\Models\\User', 28, 'app', '07cdc9867f61c7e2811c68e579437b3af57c8322cb3bc37c32681701fe403aa6', '[\"*\"]', '2024-06-06 05:37:02', NULL, '2024-06-06 05:35:49', '2024-06-06 05:37:02'),
(254, 'App\\Models\\User', 28, 'app', '4f6aed35a9fef4b7ed9de9eb6cfce827f787ab3006932ba7c61dd1c03185c7be', '[\"*\"]', NULL, NULL, '2024-06-06 05:38:13', '2024-06-06 05:38:13'),
(255, 'App\\Models\\User', 28, 'app', '9f3b43434b58d4fbd20e8f5b3ffb43250a8d71f2c28f768a7ff3313a92a654af', '[\"*\"]', NULL, NULL, '2024-06-06 05:40:33', '2024-06-06 05:40:33'),
(256, 'App\\Models\\User', 28, 'app', '5dac6d14be0f36c729b7d1f43c258f9553deda063d75945a7918cd46bcdb288d', '[\"*\"]', NULL, NULL, '2024-06-06 05:42:04', '2024-06-06 05:42:04'),
(257, 'App\\Models\\User', 28, 'app', '7eee8d2b14b8705e55a369cbe882b967fb52d60943c4dc24c849f741a3273bb0', '[\"*\"]', NULL, NULL, '2024-06-06 05:43:57', '2024-06-06 05:43:57'),
(258, 'App\\Models\\User', 28, 'app', 'b0be8183554bbe45d30e2273846b6f55446809fd06e2dde4dbfb58ad0c127a6e', '[\"*\"]', NULL, NULL, '2024-06-06 05:44:32', '2024-06-06 05:44:32'),
(259, 'App\\Models\\User', 28, 'app', '1c0e2dac78cd3ecd8b42be9b465548236bd394d0864db234afca60618494c5bf', '[\"*\"]', NULL, NULL, '2024-06-06 05:45:05', '2024-06-06 05:45:05'),
(260, 'App\\Models\\User', 28, 'app', '3d372f03c8c5033bde34d059dc3d6c49bbfcd6aecc7a8f8fc8f3ce77acf6839f', '[\"*\"]', '2024-06-06 05:47:19', NULL, '2024-06-06 05:47:14', '2024-06-06 05:47:19'),
(261, 'App\\Models\\User', 28, 'app', 'a09a3dc070e4f80c167541bb1bd6cc131d699405b4015cdc3c030bc8cb275a20', '[\"*\"]', NULL, NULL, '2024-06-06 05:51:37', '2024-06-06 05:51:37'),
(262, 'App\\Models\\User', 28, 'app', '60a7cf28a16fefffe47eb11a1e2703f0cb5a0c573e116fe02d5f20fe5e987f18', '[\"*\"]', NULL, NULL, '2024-06-06 05:55:27', '2024-06-06 05:55:27'),
(263, 'App\\Models\\User', 28, 'app', 'feef08f90801b6d3db28dc175b92101f6079f78c8d5d3db0c410716f781485d2', '[\"*\"]', NULL, NULL, '2024-06-06 05:55:52', '2024-06-06 05:55:52'),
(264, 'App\\Models\\User', 28, 'app', 'dd38b31dffd78e9dcd28ef054d06bf13ad5a8415e53dd7812ba8504874dd6951', '[\"*\"]', NULL, NULL, '2024-06-06 05:56:23', '2024-06-06 05:56:23'),
(265, 'App\\Models\\User', 28, 'app', '442dfa5d5941247684b64d24398590d66152d6f612cb2a6dc74ef6e7a26a652d', '[\"*\"]', '2024-06-06 22:51:26', NULL, '2024-06-06 05:56:49', '2024-06-06 22:51:26'),
(266, 'App\\Models\\User', 28, 'app', 'fac5f7ac42f67f63e8832e20fdb85c40d0611da9e487302b20f6ee5700281085', '[\"*\"]', NULL, NULL, '2024-06-06 05:59:50', '2024-06-06 05:59:50'),
(267, 'App\\Models\\User', 28, 'app', '70307bb9e7352636d9047a78ca536f049730a76a90e1a52ffe348999a2ce63e8', '[\"*\"]', '2024-06-10 23:40:08', NULL, '2024-06-06 06:01:21', '2024-06-10 23:40:08'),
(268, 'App\\Models\\User', 28, 'app', '10714c4466b827e4e8e28213a97391933fdcf271c66afe652c46c51cbfc25a6a', '[\"*\"]', NULL, NULL, '2024-06-06 22:05:02', '2024-06-06 22:05:02'),
(269, 'App\\Models\\User', 28, 'app', 'a0f192a3b79e279581438c8cad00ee56cfc0bb1cc87cc4b09de90d95cb2d45ee', '[\"*\"]', NULL, NULL, '2024-06-06 22:05:39', '2024-06-06 22:05:39'),
(270, 'App\\Models\\User', 28, 'app', 'b2d9330d6c19ac5c619e9eba286b95aae0ff193cd84e90c634b355eaae21445b', '[\"*\"]', NULL, NULL, '2024-06-06 22:05:41', '2024-06-06 22:05:41');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(271, 'App\\Models\\User', 28, 'app', '76d5bf5ab4854a6467245813197b8c2b47a98f0ccc451d353264d8497278c29a', '[\"*\"]', NULL, NULL, '2024-06-06 22:05:43', '2024-06-06 22:05:43'),
(272, 'App\\Models\\User', 28, 'app', '282d9c40fd81dd1c892069e6adfaa7a2e2e14b6c201865866c7f41b8bcd55dcf', '[\"*\"]', NULL, NULL, '2024-06-06 22:06:56', '2024-06-06 22:06:56'),
(273, 'App\\Models\\User', 28, 'app', '370efd470b059a2fd4d67c1989b59a5e9cc4414d3810e3a5a210cb67df3dc6a6', '[\"*\"]', NULL, NULL, '2024-06-06 22:06:59', '2024-06-06 22:06:59'),
(274, 'App\\Models\\User', 28, 'app', 'ec5824c2d3c5481041a18e32d0b315e41c2c25c20e440b53b46297833c0e77a6', '[\"*\"]', NULL, NULL, '2024-06-06 22:07:01', '2024-06-06 22:07:01'),
(275, 'App\\Models\\User', 28, 'app', '8b701efc3155882b0ed2ea011fb4c6ecb246608a92615a65e0f5d6793076b6cd', '[\"*\"]', NULL, NULL, '2024-06-06 22:35:07', '2024-06-06 22:35:07'),
(276, 'App\\Models\\User', 28, 'app', 'fdb8a0208d3c701d5f35c7c2e2b3f7985f3f7408a310becd885d01d29c8a2999', '[\"*\"]', NULL, NULL, '2024-06-06 22:51:55', '2024-06-06 22:51:55'),
(277, 'App\\Models\\User', 28, 'app', '9312b254a169262ab6d0a518597610c67d70f28254322e158ad7e92e262b88a6', '[\"*\"]', NULL, NULL, '2024-06-06 22:53:17', '2024-06-06 22:53:17'),
(278, 'App\\Models\\User', 28, 'app', '86a1663478b1e371e42b6c0cbe3ed6a572c9c653dd7a41aec18f6b6edc8ce93d', '[\"*\"]', '2024-06-06 22:53:33', NULL, '2024-06-06 22:53:25', '2024-06-06 22:53:33'),
(279, 'App\\Models\\User', 28, 'app', 'e5fdfec1dd8e88f925e189c7f273b3d73b00808e77485086d9d78f8bc5324002', '[\"*\"]', '2024-06-06 23:12:05', NULL, '2024-06-06 22:53:56', '2024-06-06 23:12:05'),
(280, 'App\\Models\\User', 28, 'app', '03e77f2785ef115b40868ba7a70eb6713ae1a7d3aae357af34792c83cc9e770e', '[\"*\"]', '2024-06-06 23:17:57', NULL, '2024-06-06 23:17:41', '2024-06-06 23:17:57'),
(281, 'App\\Models\\User', 28, 'app', '2e4112f894ead4be9df05dba03ad7df4a352c2c8812f0517089fbba931a0e9ca', '[\"*\"]', '2024-06-06 23:18:44', NULL, '2024-06-06 23:18:39', '2024-06-06 23:18:44'),
(282, 'App\\Models\\User', 28, 'app', '356ec3ad590c87abd55f036275c15240f8440317c496d7b99a6db4ed618833ed', '[\"*\"]', '2024-06-06 23:19:47', NULL, '2024-06-06 23:19:37', '2024-06-06 23:19:47'),
(283, 'App\\Models\\User', 33, 'app', '44b704057d4f1e4338b0c6a298f40c1ca8138e5f670198b131c808cc2cafbf50', '[\"*\"]', '2024-06-06 23:56:32', NULL, '2024-06-06 23:23:07', '2024-06-06 23:56:32'),
(284, 'App\\Models\\User', 34, 'app', '99f2672d00fb97f82406b0468ae6d1125bd3f451a16de95508fa16201ae67972', '[\"*\"]', NULL, NULL, '2024-06-06 23:50:34', '2024-06-06 23:50:34'),
(285, 'App\\Models\\User', 35, 'app', 'c525f33cacef4666997a3194b14c85f2059727401e71365860256177515666ca', '[\"*\"]', '2024-06-06 23:58:18', NULL, '2024-06-06 23:57:01', '2024-06-06 23:58:18'),
(286, 'App\\Models\\User', 36, 'app', '6a5626c3ebed13392e5640209a0b92307000ee3bf326958db30170e6a3f0cf13', '[\"*\"]', '2024-06-07 00:00:49', NULL, '2024-06-06 23:58:47', '2024-06-07 00:00:49'),
(287, 'App\\Models\\User', 36, 'app', '7f19d64e0ed81aa83cb4f5bfcd94787fbfbf616cfbe90b6c1328e44419bb8fd9', '[\"*\"]', '2024-06-07 00:01:45', NULL, '2024-06-07 00:00:56', '2024-06-07 00:01:45'),
(288, 'App\\Models\\User', 37, 'app', '6339e1151df68d76a67567ea8a0d7d7e8edfffbf7de136711c18d1ca0bda7f53', '[\"*\"]', '2024-06-07 00:12:38', NULL, '2024-06-07 00:03:47', '2024-06-07 00:12:38'),
(289, 'App\\Models\\User', 38, 'app', 'd2d98a39e7ed3aaec467d87028be945f0056b09be328397e391213f5791493e7', '[\"*\"]', '2024-06-07 00:15:05', NULL, '2024-06-07 00:11:01', '2024-06-07 00:15:05'),
(290, 'App\\Models\\User', 39, 'app', '5e7b289aabcfd99549c8fb1f4f1bfd3829c571e8b4fced7f19175be3b4f0fef8', '[\"*\"]', '2024-06-07 00:23:52', NULL, '2024-06-07 00:15:39', '2024-06-07 00:23:52'),
(291, 'App\\Models\\User', 40, 'app', '6d720871ed7e39696eed5d00f9880d4954c16a1616be7d997eda324f1111bf60', '[\"*\"]', '2024-06-07 00:25:42', NULL, '2024-06-07 00:23:26', '2024-06-07 00:25:42'),
(292, 'App\\Models\\User', 41, 'app', 'd4aafd019ba100d75c466f05ee01ec1780a83ff5b21189940420b7550a8a87e6', '[\"*\"]', NULL, NULL, '2024-06-07 00:25:04', '2024-06-07 00:25:04'),
(293, 'App\\Models\\User', 42, 'app', '2fa40451097c963fb2e3ed8152d69fb5b366fbd5168ccc860d364e3f5eca9ac0', '[\"*\"]', '2024-06-07 00:31:52', NULL, '2024-06-07 00:28:24', '2024-06-07 00:31:52'),
(294, 'App\\Models\\User', 43, 'app', '3b5acaa1173bab6fe92fd55ba8c7977dfda4ab90d47b5e303ead758441f13319', '[\"*\"]', NULL, NULL, '2024-06-07 00:30:06', '2024-06-07 00:30:06'),
(295, 'App\\Models\\User', 44, 'app', '14c36797c75155c46e7b5562fc1ab66beb68fd1b9efa56a28502bf1fcba9537d', '[\"*\"]', NULL, NULL, '2024-06-07 00:32:13', '2024-06-07 00:32:13'),
(296, 'App\\Models\\User', 45, 'app', '39b906b7321349acbdb35d13869d0bc0bd1bd3b1a284ea0c58f9410567f2377c', '[\"*\"]', NULL, NULL, '2024-06-07 00:41:37', '2024-06-07 00:41:37'),
(297, 'App\\Models\\User', 46, 'app', '45f4136c29a95066427e7c63faf34b59bdaf0e6a85ec5f0202bc1db0ca43320b', '[\"*\"]', '2024-06-07 00:58:02', NULL, '2024-06-07 00:47:23', '2024-06-07 00:58:02'),
(298, 'App\\Models\\User', 47, 'app', '7b8ace53f486443182f788756de66e4028b119de435b03bda3de1c8ef42f4c44', '[\"*\"]', '2024-06-07 01:00:29', NULL, '2024-06-07 00:58:38', '2024-06-07 01:00:29'),
(299, 'App\\Models\\User', 48, 'app', '959c2cb298be7d2d4ce52f82b95f54b651c609073921f1925138ab4d5463233f', '[\"*\"]', NULL, NULL, '2024-06-07 01:00:58', '2024-06-07 01:00:58'),
(300, 'App\\Models\\User', 49, 'app', '3b462f80a8e06520efdc6048e43522ae838cacb890ee55e064ce205e82072de8', '[\"*\"]', '2024-06-07 01:08:22', NULL, '2024-06-07 01:02:47', '2024-06-07 01:08:22'),
(301, 'App\\Models\\User', 50, 'app', '2c1ef43aad97cad48c8d0964bead0fa35810cdc80fd66e8db50aa86c4ebfabf2', '[\"*\"]', NULL, NULL, '2024-06-07 01:08:51', '2024-06-07 01:08:51'),
(302, 'App\\Models\\User', 51, 'app', 'a3b1dd5b5688791bda81d73f0b6456e4aaf0a6a865d886fa45d10f23b059ee8c', '[\"*\"]', NULL, NULL, '2024-06-07 01:09:49', '2024-06-07 01:09:49'),
(303, 'App\\Models\\User', 52, 'app', '0e8ba02306320bdd372ea4c5bdbe0b9bed37360eca5c62ee4b48df26ad0d21f6', '[\"*\"]', '2024-06-07 01:12:56', NULL, '2024-06-07 01:11:54', '2024-06-07 01:12:56'),
(304, 'App\\Models\\User', 53, 'app', 'c3f8ced7a0bafa60e40df4db62dbab50f92069356d4ecc430fb2246e53bd9249', '[\"*\"]', '2024-06-07 01:51:17', NULL, '2024-06-07 01:13:45', '2024-06-07 01:51:17'),
(305, 'App\\Models\\User', 54, 'app', '942cd6f0e91edb2fb41193a73c3f16e3bd0bf3eb331d579dcc880b10a33e3816', '[\"*\"]', NULL, NULL, '2024-06-07 01:51:48', '2024-06-07 01:51:48'),
(306, 'App\\Models\\User', 28, 'app', '22741f08fe4c018605bf55aba09eeb457b6cccf00758ae10f24c36590010cefd', '[\"*\"]', '2024-06-07 02:20:54', NULL, '2024-06-07 02:20:39', '2024-06-07 02:20:54'),
(307, 'App\\Models\\User', 28, 'app', 'c2a138dece1a42ebd0355a0582f8e734f417028c39232849c2e6dbe5ad621875', '[\"*\"]', '2024-06-07 02:25:29', NULL, '2024-06-07 02:22:58', '2024-06-07 02:25:29'),
(308, 'App\\Models\\User', 55, 'app', 'a81970efb68fbf19d8adaa0171f882b01bb762650b33a2708cd05f0c0f29594e', '[\"*\"]', NULL, NULL, '2024-06-07 02:26:10', '2024-06-07 02:26:10'),
(309, 'App\\Models\\User', 28, 'app', '15ec177b15029fbec468afe76bd990eee9fe92d0e50dda11edaf731e6c1b4325', '[\"*\"]', '2024-06-07 22:28:57', NULL, '2024-06-07 02:31:55', '2024-06-07 22:28:57'),
(310, 'App\\Models\\User', 56, 'app', 'c05446e49c05818072af3b507bf121a2832758e8e7fff8b1050df5ea3cbcc4cc', '[\"*\"]', '2024-06-07 22:35:01', NULL, '2024-06-07 22:30:59', '2024-06-07 22:35:01'),
(311, 'App\\Models\\User', 57, 'app', '33322e2b75f57ac3aa56bb99706d0e740f46907267aed70dba2cfe98d633124b', '[\"*\"]', '2024-06-07 22:39:52', NULL, '2024-06-07 22:37:09', '2024-06-07 22:39:52'),
(312, 'App\\Models\\User', 58, 'app', '27ab9e8ddf0a236129f75f461f9c96f249e32a68b9bdc347ef8d66694584b67b', '[\"*\"]', NULL, NULL, '2024-06-07 22:40:17', '2024-06-07 22:40:17'),
(313, 'App\\Models\\User', 59, 'app', 'c6a29e87c3d64ced6a98d4e12ac1029a97f7beabb4278411ab494d7fae340705', '[\"*\"]', '2024-06-07 22:49:53', NULL, '2024-06-07 22:49:33', '2024-06-07 22:49:53'),
(314, 'App\\Models\\User', 60, 'app', 'd12a7ad89cf85bcd9ed39ac2e438ee227426a2798c1704b34aae7ea203b28371', '[\"*\"]', '2024-06-07 22:54:29', NULL, '2024-06-07 22:52:34', '2024-06-07 22:54:29'),
(315, 'App\\Models\\User', 61, 'app', 'bfb7fc2b25c7b37f1b0d3e025c8b63b0a5ef5069adb6ad7d8980845a90097ed8', '[\"*\"]', '2024-06-07 22:56:52', NULL, '2024-06-07 22:56:31', '2024-06-07 22:56:52'),
(316, 'App\\Models\\User', 62, 'app', 'fd4a76f0ab619174060aaa503dfd832465d02e6651987514d9ca9e05e5d14d50', '[\"*\"]', '2024-06-07 23:21:47', NULL, '2024-06-07 22:57:37', '2024-06-07 23:21:47'),
(317, 'App\\Models\\User', 63, 'app', 'f0ee668ffe5f8fea8821d90d0de17f22db1f3b094007e472c10a7d5886ceb046', '[\"*\"]', '2024-06-07 22:59:52', NULL, '2024-06-07 22:59:06', '2024-06-07 22:59:52'),
(318, 'App\\Models\\User', 64, 'app', '2de9b866240d522a8f34336ba15df5fca7bc62a97f394e769fdbb1f49f2fe852', '[\"*\"]', NULL, NULL, '2024-06-07 23:00:56', '2024-06-07 23:00:56'),
(319, 'App\\Models\\User', 65, 'app', '5ab5cb8c1389dac332e034ce073ea56bbe4e9c412c5ea835fd862153f9dfa6cd', '[\"*\"]', NULL, NULL, '2024-06-07 23:07:04', '2024-06-07 23:07:04'),
(320, 'App\\Models\\User', 66, 'app', 'a6aae20e3d4a2fc460df4dab1ca77164f1bbb1b67c817c46e2d8aeb798ed3499', '[\"*\"]', NULL, NULL, '2024-06-07 23:15:53', '2024-06-07 23:15:53'),
(321, 'App\\Models\\User', 67, 'app', 'ddf8db27d20544873e720ec904f16bac35c1bb9859f3ea650d06947a4cdca26d', '[\"*\"]', '2024-06-07 23:27:57', NULL, '2024-06-07 23:20:15', '2024-06-07 23:27:57'),
(322, 'App\\Models\\User', 28, 'app', '57fb04363790bffc33995e65d0e38a9fb29bf8ea53aafafd97ce2d48c5d18c46', '[\"*\"]', '2024-06-08 02:23:11', NULL, '2024-06-07 23:21:53', '2024-06-08 02:23:11'),
(323, 'App\\Models\\User', 68, 'app', 'e3c9f73630d66baca608cff985c8bd502cfe5f87c71997b02d98aa8f35b4c12e', '[\"*\"]', '2024-06-08 02:39:29', NULL, '2024-06-08 02:18:47', '2024-06-08 02:39:29'),
(324, 'App\\Models\\User', 28, 'app', '0b9a65af1d2b0a1f03ce47ae12aa9602e6833822893d83de3dc64d0b6626d733', '[\"*\"]', '2024-06-08 03:19:31', NULL, '2024-06-08 02:39:35', '2024-06-08 03:19:31'),
(325, 'App\\Models\\User', 28, 'app', 'e4f9108355ba65c19a254d3a6dfceec3d49dbd203182a51f9f220bceaadd22f3', '[\"*\"]', '2024-06-08 04:16:56', NULL, '2024-06-08 03:22:51', '2024-06-08 04:16:56'),
(326, 'App\\Models\\User', 28, 'app', '0d0d356ba18e16bd63ebf52d6edd1c1e6ccb7169d9ad49c9f8903763861e95ee', '[\"*\"]', '2024-06-08 23:22:35', NULL, '2024-06-08 04:17:01', '2024-06-08 23:22:35'),
(327, 'App\\Models\\User', 28, 'app', '2b2bffb03db6c30f9c5af1621af567420cbe04c9a4b6c0ea5194693865d484ae', '[\"*\"]', '2024-06-10 23:39:14', NULL, '2024-06-08 23:22:40', '2024-06-10 23:39:14'),
(328, 'App\\Models\\User', 28, 'app', '4112f28deadaf0d41ed96ef76ba56c2417ba17a2a5f5c8d2a3c11d16505b4f92', '[\"*\"]', '2024-06-12 00:14:47', NULL, '2024-06-10 23:42:35', '2024-06-12 00:14:47'),
(329, 'App\\Models\\User', 28, 'app', 'd0c3dbe59164a81b79dc7c721b1c707fe13d8d95eb5150aa8d57c741cdafecce', '[\"*\"]', '2024-06-24 22:36:09', NULL, '2024-06-11 00:00:55', '2024-06-24 22:36:09'),
(330, 'App\\Models\\User', 28, 'app', 'fc3eb694ffe5f31ef8727c771a95e00ec996c5c6e445850664a25f06a4da1bfe', '[\"*\"]', '2024-06-12 00:15:13', NULL, '2024-06-12 00:15:04', '2024-06-12 00:15:13'),
(331, 'App\\Models\\User', 28, 'app', '0fdce7f7545d56d31654ab0cd748a4128f9bc31c4e784a5fb79c7227aaab4d3e', '[\"*\"]', '2024-06-12 03:12:39', NULL, '2024-06-12 00:17:12', '2024-06-12 03:12:39'),
(332, 'App\\Models\\User', 28, 'app', '0a0f94281f0569db7a6581ac641acd49fde3791c494dbc7173c39c00e5c51934', '[\"*\"]', '2024-06-12 02:54:17', NULL, '2024-06-12 02:54:12', '2024-06-12 02:54:17'),
(333, 'App\\Models\\User', 28, 'app', '3de028b3b618c4406105e44917d352aff0ded5fe8aea72916aca94de54bd4862', '[\"*\"]', '2024-06-12 02:57:03', NULL, '2024-06-12 02:56:42', '2024-06-12 02:57:03'),
(334, 'App\\Models\\User', 28, 'app', '6a1c587687b07adc791e5365bea580b40cfe3903ec6481b3ca14b8c8cc186e35', '[\"*\"]', '2024-06-13 05:01:57', NULL, '2024-06-12 02:57:23', '2024-06-13 05:01:57'),
(335, 'App\\Models\\User', 28, 'app', 'c11d496e6e4e96129e7a0ca3e30433c223d732df0a35ce06ce7b0dac364c6f9d', '[\"*\"]', '2024-06-13 05:10:30', NULL, '2024-06-13 05:02:26', '2024-06-13 05:10:30'),
(336, 'App\\Models\\User', 28, 'app', '822b2df09dc26f5b9a18f8c258cdfe74000faa3cc7c7fab1ad54f7b0742ba162', '[\"*\"]', '2024-06-13 05:11:16', NULL, '2024-06-13 05:11:00', '2024-06-13 05:11:16'),
(337, 'App\\Models\\User', 28, 'app', '62fee433814237e48169c67edfaf84a61fda958b60aff48f4793ee5fba7bcd7e', '[\"*\"]', '2024-06-16 04:23:11', NULL, '2024-06-14 23:28:52', '2024-06-16 04:23:11'),
(338, 'App\\Models\\User', 28, 'app', '44d503aeb3463a118d684f3ba9a879ce9940c859c40a054490e1f883bc487790', '[\"*\"]', '2024-06-16 04:57:30', NULL, '2024-06-16 04:23:42', '2024-06-16 04:57:30'),
(339, 'App\\Models\\User', 28, 'app', '6763504854f1c5097510d180a70c3cd159c526c1df6710828736e90125d1e2e4', '[\"*\"]', '2024-06-19 01:26:35', NULL, '2024-06-16 04:57:42', '2024-06-19 01:26:35'),
(340, 'App\\Models\\User', 28, 'app', 'b5ba324b6999ef13e660db56feed73b5e2fca473f482eaf4f80b19c719567aff', '[\"*\"]', '2024-06-19 03:15:20', NULL, '2024-06-19 01:34:11', '2024-06-19 03:15:20'),
(341, 'App\\Models\\User', 28, 'app', '8fb5e2fb9ef26a815d1e9ccb20c30bc397d921e36aec9531c7e71f55c9a8f72b', '[\"*\"]', '2024-06-19 03:34:51', NULL, '2024-06-19 03:15:50', '2024-06-19 03:34:51'),
(342, 'App\\Models\\User', 28, 'app', '18c2d5bc2372380acd9f13d95cf07ca8840a6f0bb0468cbb39fd86092eeceda6', '[\"*\"]', '2024-06-19 03:35:54', NULL, '2024-06-19 03:35:21', '2024-06-19 03:35:54'),
(343, 'App\\Models\\User', 28, 'app', 'ffd04977bc165c4519f92f4a5e2f34e7ee07fbcdaded3319c94769e64968071c', '[\"*\"]', '2024-06-19 03:36:30', NULL, '2024-06-19 03:36:01', '2024-06-19 03:36:30'),
(344, 'App\\Models\\User', 28, 'app', '5880ee3543be0cb9f72e36d79c8f2d701aac24a59f34ff268d9a6a8db010431a', '[\"*\"]', '2024-06-19 04:43:52', NULL, '2024-06-19 03:36:49', '2024-06-19 04:43:52'),
(345, 'App\\Models\\User', 28, 'app', '9d307e303684eaa919182105788b86bf64dcf1fabda809f84480db302658ecea', '[\"*\"]', '2024-06-21 01:05:43', NULL, '2024-06-19 04:46:31', '2024-06-21 01:05:43'),
(346, 'App\\Models\\User', 28, 'app', 'c54a71b28065a2996e0edb1282376510db3e41f8604286bb6fd88f0ca392575a', '[\"*\"]', '2024-06-21 04:56:00', NULL, '2024-06-21 03:27:06', '2024-06-21 04:56:00'),
(347, 'App\\Models\\User', 28, 'app', '90207527f63a9b47e8a5548866d33c52d493c6599388ddfc45d5b9c948808b3b', '[\"*\"]', '2024-06-21 05:40:48', NULL, '2024-06-21 05:05:17', '2024-06-21 05:40:48'),
(348, 'App\\Models\\User', 28, 'app', 'ac8a87ce01f8ac836a105d08ed8a2030b598cfc4964cbdcdc58dc1d42a3ea9aa', '[\"*\"]', '2024-06-22 02:15:13', NULL, '2024-06-21 05:42:00', '2024-06-22 02:15:13'),
(349, 'App\\Models\\User', 28, 'app', 'bcf89ec3f253c5124f51342580488352c54542275f306e0c4f0c49ad0b1c96ad', '[\"*\"]', '2024-06-22 02:50:43', NULL, '2024-06-22 02:11:56', '2024-06-22 02:50:43'),
(350, 'App\\Models\\User', 28, 'app', 'c19fb3bf3304281d63bee9334c9aa850f5f1794d3b4b9396746883dafb49696f', '[\"*\"]', '2024-06-22 03:23:40', NULL, '2024-06-22 02:51:18', '2024-06-22 03:23:40'),
(351, 'App\\Models\\User', 28, 'app', 'e127becf3f8513b8aaba20b67035e4b8ebe331b786a875393a52e382cde5dca1', '[\"*\"]', '2024-06-22 03:26:49', NULL, '2024-06-22 03:23:47', '2024-06-22 03:26:49'),
(352, 'App\\Models\\User', 28, 'app', '006369626e18754b20b4956139c4521229ddf8c1f0d8b1a6d552411a5a893f4d', '[\"*\"]', '2024-06-22 03:45:29', NULL, '2024-06-22 03:27:11', '2024-06-22 03:45:29'),
(353, 'App\\Models\\User', 28, 'app', 'cd8741c0d967218967b66368f26f60162af9a4c9e1484474b637af7a6403a5ab', '[\"*\"]', '2024-06-22 03:47:40', NULL, '2024-06-22 03:45:33', '2024-06-22 03:47:40'),
(354, 'App\\Models\\User', 28, 'app', 'be91c836bfe0e2622968c34600790beb98fe4425b97ef67b3c435e4f03c43171', '[\"*\"]', '2024-06-22 03:50:39', NULL, '2024-06-22 03:47:44', '2024-06-22 03:50:39'),
(355, 'App\\Models\\User', 28, 'app', '07149f7c5f548ac67507f6671544655724236259089e501e976c2bb9529efd76', '[\"*\"]', '2024-06-22 04:09:44', NULL, '2024-06-22 03:50:43', '2024-06-22 04:09:44'),
(356, 'App\\Models\\User', 28, 'app', '5ca997aae83289d9c284f3fa0168fd495edc02401c4519d6d10e7a877ca48b69', '[\"*\"]', '2024-06-23 04:34:17', NULL, '2024-06-22 04:09:49', '2024-06-23 04:34:17'),
(357, 'App\\Models\\User', 28, 'app', '1cd99ea128ae144e9d915577d5d9e936f1ff44d3c19e87f2b17bb869725e495e', '[\"*\"]', '2024-06-23 04:41:02', NULL, '2024-06-23 04:37:46', '2024-06-23 04:41:02'),
(358, 'App\\Models\\User', 28, 'app', 'dbc8298055d1a600d1b982b0e211381bd898b89ab41d1eba4e254d196dc53d1b', '[\"*\"]', '2024-06-23 04:49:06', NULL, '2024-06-23 04:41:08', '2024-06-23 04:49:06'),
(359, 'App\\Models\\User', 28, 'app', 'c14060b01160520e1e4db952c2c79b5a36a63fe5f64390591ea8f3607990e807', '[\"*\"]', '2024-06-23 05:19:57', NULL, '2024-06-23 04:49:10', '2024-06-23 05:19:57'),
(360, 'App\\Models\\User', 28, 'app', '25bcde36e7ec1606441c70c385395b33bd53df64b50ff2452435dc4568771a14', '[\"*\"]', '2024-06-23 05:30:03', NULL, '2024-06-23 05:21:58', '2024-06-23 05:30:03'),
(361, 'App\\Models\\User', 28, 'app', '7d4efa77e14b1351435ee1438bb39869c51cf0bc31d97dac462bc08d95d64e21', '[\"*\"]', '2024-06-23 05:30:35', NULL, '2024-06-23 05:30:08', '2024-06-23 05:30:35'),
(362, 'App\\Models\\User', 28, 'app', '59441bcc4f53b350ced2fba91c1bbb05efd8df7ce26bfcc38cbdeebaa15a7d4e', '[\"*\"]', '2024-06-23 07:29:49', NULL, '2024-06-23 05:31:19', '2024-06-23 07:29:49'),
(363, 'App\\Models\\User', 28, 'app', '71081494110c723f50cd811f3e0a283d52bc9aafdf03170dceed1e3debdf8c21', '[\"*\"]', '2024-06-23 07:31:24', NULL, '2024-06-23 07:29:55', '2024-06-23 07:31:24'),
(364, 'App\\Models\\User', 28, 'app', 'db0a06c8744450a41cf40d9614b12f3dbe96a35a13a4eb2033f46b94f7bd2be7', '[\"*\"]', '2024-06-23 07:33:36', NULL, '2024-06-23 07:32:34', '2024-06-23 07:33:36'),
(365, 'App\\Models\\User', 28, 'app', 'b8bf926458183712e2d5b67d623cfe86eb5a9d3f4988b544858d13f268f6b5d1', '[\"*\"]', '2024-06-24 22:17:04', NULL, '2024-06-23 07:33:40', '2024-06-24 22:17:04'),
(366, 'App\\Models\\User', 28, 'app', '82979953bc885f379d2dcafff0fb1082d5c2833d0d00697893a79b6005702fd6', '[\"*\"]', '2024-06-24 22:18:35', NULL, '2024-06-24 22:17:16', '2024-06-24 22:18:35'),
(367, 'App\\Models\\User', 28, 'app', '00945a207b14a326bc7c985e2b31c1ccd8efb69fce9a92dd742f4e16318b92d8', '[\"*\"]', '2024-06-24 22:20:14', NULL, '2024-06-24 22:18:41', '2024-06-24 22:20:14'),
(368, 'App\\Models\\User', 28, 'app', '6750c22edc5866a696d6532ec603351b8415997ca0908552bcf7a805ff0ee47f', '[\"*\"]', NULL, NULL, '2024-06-24 22:20:27', '2024-06-24 22:20:27'),
(369, 'App\\Models\\User', 28, 'app', 'ba23bcdae16a64598c9a87e37f4e91795fbc0cf2d617b2b31555694c0789a656', '[\"*\"]', '2024-06-24 22:22:05', NULL, '2024-06-24 22:20:59', '2024-06-24 22:22:05'),
(370, 'App\\Models\\User', 28, 'app', 'cde0bc77428ee179ae77ae35caaed1c912b738f8e2b87555b92c7867f560c3b8', '[\"*\"]', '2024-06-24 22:23:36', NULL, '2024-06-24 22:22:18', '2024-06-24 22:23:36'),
(371, 'App\\Models\\User', 28, 'app', '588de362da275f35991bf434cd6c9c060d0dd4bc4013dec535dbf94c5cded258', '[\"*\"]', NULL, NULL, '2024-06-24 22:23:47', '2024-06-24 22:23:47'),
(372, 'App\\Models\\User', 28, 'app', '2d646ca40c26d0d4d1cc6c69225ae2ff65a108e1fcf5fdaf61a38efc28f871a0', '[\"*\"]', NULL, NULL, '2024-06-24 22:24:10', '2024-06-24 22:24:10'),
(373, 'App\\Models\\User', 28, 'app', '5dda2e3544eaa3be15d0fccbc93745a81d7fed6ad50211f58d312e0c60257535', '[\"*\"]', NULL, NULL, '2024-06-24 22:25:07', '2024-06-24 22:25:07'),
(374, 'App\\Models\\User', 28, 'app', 'f1ced218a52ac2fc5593171af561e82de0034af94f509cb0b776266046e00425', '[\"*\"]', NULL, NULL, '2024-06-24 22:26:23', '2024-06-24 22:26:23'),
(375, 'App\\Models\\User', 28, 'app', '2e4db4b3c1828a005326a04d6ff75dde071fa713388ee53a714630a4ffc1ae48', '[\"*\"]', NULL, NULL, '2024-06-24 22:27:24', '2024-06-24 22:27:24'),
(376, 'App\\Models\\User', 28, 'app', 'ab1367531379d8559d2f275d47a94c7054cc2f07c7d07bc0fd3eca0ffd930e4a', '[\"*\"]', NULL, NULL, '2024-06-24 22:28:19', '2024-06-24 22:28:19'),
(377, 'App\\Models\\User', 28, 'app', '08f90a9c93c752622ce0a4a23690c05bdd10fadb0c50578f21e814d59c74814e', '[\"*\"]', NULL, NULL, '2024-06-24 22:28:48', '2024-06-24 22:28:48'),
(378, 'App\\Models\\User', 28, 'app', 'dcfa5724a2a6ecbd2dd15de08f97be6bc5c3ad622d12e53a44c0baabc5562802', '[\"*\"]', NULL, NULL, '2024-06-24 22:31:24', '2024-06-24 22:31:24'),
(379, 'App\\Models\\User', 28, 'app', 'dd0f54defa7176355bca5113f488cf4340c99fde3effba87c7d6cf1dbf32a4d9', '[\"*\"]', '2024-06-24 23:01:50', NULL, '2024-06-24 22:32:17', '2024-06-24 23:01:50'),
(380, 'App\\Models\\User', 28, 'app', 'b9e490c93a90230a77b2d784a32b591cfa2dc4f7ab8a1bfbbe735f944ec12279', '[\"*\"]', '2024-06-24 22:44:14', NULL, '2024-06-24 22:36:23', '2024-06-24 22:44:14'),
(381, 'App\\Models\\User', 28, 'app', '17a8b5bdb8c0d5f92c2622f4d6653dcbbbed42256057a6196ae78e999457806d', '[\"*\"]', '2024-06-24 22:59:04', NULL, '2024-06-24 22:45:40', '2024-06-24 22:59:04'),
(382, 'App\\Models\\User', 28, 'app', '3de7372c9a42bc915ad3081ab20d4ff65179fe0930bb2c8d9758f6641259ab7f', '[\"*\"]', '2024-06-24 23:11:12', NULL, '2024-06-24 22:59:11', '2024-06-24 23:11:12'),
(383, 'App\\Models\\User', 28, 'app', 'a01dcacf4a0502a86d1d13255005108af8fd0ada6d46d10bad4bf166cf4be0ec', '[\"*\"]', '2024-06-24 23:02:11', NULL, '2024-06-24 23:01:57', '2024-06-24 23:02:11'),
(384, 'App\\Models\\User', 28, 'app', '56aba5254908dc0170272e05bc89c24a8767a9cb4abd9ea9c389ba4b16e9116c', '[\"*\"]', '2024-06-24 23:03:36', NULL, '2024-06-24 23:02:26', '2024-06-24 23:03:36'),
(385, 'App\\Models\\User', 28, 'app', '014d82e74bb8a1e5751fabcd5190fe0fa3db022b9e46505e4f61307d8b3d7d15', '[\"*\"]', '2024-06-24 23:08:08', NULL, '2024-06-24 23:03:43', '2024-06-24 23:08:08'),
(386, 'App\\Models\\User', 28, 'app', '7eaae963eaaf31321189fe76c90c8f71416271a99ff98b99ad5a42d3d3c15f6f', '[\"*\"]', '2024-06-24 23:18:34', NULL, '2024-06-24 23:08:16', '2024-06-24 23:18:34'),
(387, 'App\\Models\\User', 28, 'app', '14d81190bbca279f15c0ee0fc3cdf8649a41c8a8594f49584bba501d4c7e938b', '[\"*\"]', '2024-06-24 23:18:23', NULL, '2024-06-24 23:11:18', '2024-06-24 23:18:23'),
(388, 'App\\Models\\User', 28, 'app', 'd9db0ce39f770f938a703bcb2894a7eff58c1c78fcbd78d53ae9b98f9b3c2477', '[\"*\"]', '2024-06-24 23:18:53', NULL, '2024-06-24 23:18:38', '2024-06-24 23:18:53'),
(389, 'App\\Models\\User', 28, 'app', 'fc589785acd3d4ec6caea8b0122506f61128aa3707461b126465990876575647', '[\"*\"]', '2024-06-24 23:20:07', NULL, '2024-06-24 23:20:00', '2024-06-24 23:20:07'),
(390, 'App\\Models\\User', 28, 'app', '18378cbbef0d6e591a71d8520263752a8cb26ad117ab4649bf4ca66a03456acd', '[\"*\"]', '2024-06-24 23:20:55', NULL, '2024-06-24 23:20:46', '2024-06-24 23:20:55'),
(391, 'App\\Models\\User', 28, 'app', '202979b92b9143ed27d2e18cbd7e4d154489c14d5cfa581026cf420c57666b3e', '[\"*\"]', '2024-06-24 23:21:22', NULL, '2024-06-24 23:21:02', '2024-06-24 23:21:22'),
(392, 'App\\Models\\User', 28, 'app', 'e73a107640acc5cd185474d706723b21887225633a0979511170da9540976a99', '[\"*\"]', '2024-06-25 00:09:20', NULL, '2024-06-24 23:21:27', '2024-06-25 00:09:20'),
(393, 'App\\Models\\User', 28, 'app', 'f29c5c73a0706017db78a9e558aaacac579a302fb575425f3859d4d818d3a139', '[\"*\"]', '2024-06-24 23:21:58', NULL, '2024-06-24 23:21:40', '2024-06-24 23:21:58'),
(394, 'App\\Models\\User', 28, 'app', 'a2cdc37f610c76fd1e80c6e59fa36d276cfb8287e0577b4ae2f60dd42f1118f2', '[\"*\"]', '2024-06-24 23:22:13', NULL, '2024-06-24 23:22:05', '2024-06-24 23:22:13'),
(395, 'App\\Models\\User', 28, 'app', '12c27fe8b6444b1bf2677c4261593142f7fab898bd8cc0b512e43171b1de5816', '[\"*\"]', '2024-06-24 23:22:45', NULL, '2024-06-24 23:22:36', '2024-06-24 23:22:45'),
(396, 'App\\Models\\User', 28, 'app', '88bab15c26266c124c4c1f9a8bdd66e429058007f1f58d030fe736077467c21a', '[\"*\"]', '2024-06-24 23:22:58', NULL, '2024-06-24 23:22:54', '2024-06-24 23:22:58'),
(397, 'App\\Models\\User', 28, 'app', '3f0a5ffd5126c02ad0ef1e76f11a83a6bb163353ded3e8dc6be1d9818d54cbdb', '[\"*\"]', '2024-06-24 23:23:23', NULL, '2024-06-24 23:23:14', '2024-06-24 23:23:23'),
(398, 'App\\Models\\User', 28, 'app', 'bc1fce204d4996a3bd8b234b2b8f8337f8b0d0bd346df0def57d6a508ca1e81e', '[\"*\"]', '2024-06-24 23:23:58', NULL, '2024-06-24 23:23:36', '2024-06-24 23:23:58'),
(399, 'App\\Models\\User', 28, 'app', '524af69dcd5f41d70c64564456fed986f98245f883f7e2001a174ea95c517022', '[\"*\"]', '2024-06-24 23:29:56', NULL, '2024-06-24 23:24:04', '2024-06-24 23:29:56'),
(400, 'App\\Models\\User', 28, 'app', '115f52135d3d044e8d4f21043175524070f844eb1a0d1a4497d997518e742bff', '[\"*\"]', '2024-06-25 04:42:50', NULL, '2024-06-24 23:30:07', '2024-06-25 04:42:50'),
(401, 'App\\Models\\User', 28, 'app', '39aba57d0b021b6c74766eddcdfa50e100dbea68b538a1ca7775ee0ca50275a7', '[\"*\"]', '2024-07-09 03:06:52', NULL, '2024-06-25 00:10:39', '2024-07-09 03:06:52'),
(402, 'App\\Models\\User', 9, 'app', 'eb7fc22029fa858790fb20f6d8b4c565a17083d189a99c4ab4298144ac7901b1', '[\"*\"]', '2024-06-25 04:43:31', NULL, '2024-06-25 04:43:00', '2024-06-25 04:43:31'),
(403, 'App\\Models\\User', 9, 'app', '6c5a1f5f777a329f2cbc0b9024cee5b62aa81fab590567fc7b0dba158e5400d9', '[\"*\"]', '2024-06-25 04:44:53', NULL, '2024-06-25 04:44:24', '2024-06-25 04:44:53'),
(404, 'App\\Models\\User', 9, 'app', 'e658140f58620e7a7e430dae91a9cb07dce9fb8631e5fe47cd17b0f60e7f86fc', '[\"*\"]', '2024-06-25 04:50:39', NULL, '2024-06-25 04:45:01', '2024-06-25 04:50:39'),
(405, 'App\\Models\\User', 28, 'app', 'b6c5af74c4a942bc7b901d83a4a4859b6ec96af0891da5c8c1a4dad03a562f01', '[\"*\"]', '2024-06-25 04:52:26', NULL, '2024-06-25 04:50:46', '2024-06-25 04:52:26'),
(406, 'App\\Models\\User', 9, 'app', '55245e063e3c8819cdd44fd2a4ddab1e9bc996fec0d43758ba6f7a1739030fea', '[\"*\"]', '2024-06-25 22:33:52', NULL, '2024-06-25 04:52:36', '2024-06-25 22:33:52'),
(407, 'App\\Models\\User', 28, 'app', 'e8294dad8ec0f4e75b313192c2f587ce32108223bbca7d37ba95bf5e0b10a357', '[\"*\"]', '2024-07-01 22:19:29', NULL, '2024-06-25 22:34:03', '2024-07-01 22:19:29'),
(408, 'App\\Models\\User', 28, 'app', 'bd7d6426635435e1a27a6271ea8d32ff9a75f295610cad8d0bf1c0db92b82314', '[\"*\"]', '2024-07-01 23:05:16', NULL, '2024-07-01 22:19:40', '2024-07-01 23:05:16'),
(409, 'App\\Models\\User', 9, 'app', '4594f673e9c1d5ef17d4b38939d96c89683f05e3ab95bf6bc4ff8998de7c43de', '[\"*\"]', '2024-07-01 23:01:04', NULL, '2024-07-01 23:00:51', '2024-07-01 23:01:04'),
(410, 'App\\Models\\User', 28, 'app', '6c8ddf8bf7449f4578be3a3e7c5b075ad8c619e4354d5120fd16b108c3987e93', '[\"*\"]', '2024-07-03 03:30:37', NULL, '2024-07-01 23:02:25', '2024-07-03 03:30:37'),
(411, 'App\\Models\\User', 28, 'app', '1cb67edd1e17c9f119a3fa580cc3505fb38f8e1b52d1683c2cafd26fe6840aa4', '[\"*\"]', '2024-07-04 00:55:41', NULL, '2024-07-03 23:28:30', '2024-07-04 00:55:41'),
(412, 'App\\Models\\User', 28, 'app', '809428a51a0bc11564a734474fa259400668b3e117dfda59a98c0c72aac68cd7', '[\"*\"]', NULL, NULL, '2024-07-04 00:58:18', '2024-07-04 00:58:18'),
(413, 'App\\Models\\User', 28, 'app', 'f258167a1a07674d6ddd52ed90e00422a5e078206f2afa95621a4a80942edc3b', '[\"*\"]', '2024-07-04 00:58:38', NULL, '2024-07-04 00:58:27', '2024-07-04 00:58:38'),
(414, 'App\\Models\\User', 28, 'app', '2487d0f61a62b1208b98549ac2e9a30275995072ba55db83b3e159130056fbfe', '[\"*\"]', '2024-07-04 02:12:44', NULL, '2024-07-04 01:35:13', '2024-07-04 02:12:44'),
(415, 'App\\Models\\User', 28, 'app', 'e8051d530313f4503b10c1ed7fc81dcd5115fdde975ba8ac46d126dfb2b0ac6a', '[\"*\"]', '2024-07-04 02:13:36', NULL, '2024-07-04 02:12:53', '2024-07-04 02:13:36'),
(416, 'App\\Models\\User', 28, 'app', '78f848988531f597bd2cac9f6a75fd89f2fe88923d059cae73c4445319201dc8', '[\"*\"]', '2024-07-04 02:14:45', NULL, '2024-07-04 02:13:48', '2024-07-04 02:14:45'),
(417, 'App\\Models\\User', 28, 'app', '767f4573c3ce24f7f87f799eaa95dc34d84415ed429875197372b67d7e003eff', '[\"*\"]', '2024-07-04 02:14:59', NULL, '2024-07-04 02:14:57', '2024-07-04 02:14:59'),
(418, 'App\\Models\\User', 28, 'app', '9c3111596f0e5f220b197dc58287c2b3075e801d209f7636ba0a2ac739257b3d', '[\"*\"]', '2024-07-05 01:19:17', NULL, '2024-07-04 22:07:15', '2024-07-05 01:19:17'),
(419, 'App\\Models\\User', 28, 'app', 'eaafa496a02c2dc94c39e24bdc6f9c2a30314d8500b7310ef33ad284bb976511', '[\"*\"]', '2024-07-05 01:20:08', NULL, '2024-07-05 01:19:30', '2024-07-05 01:20:08'),
(420, 'App\\Models\\User', 28, 'app', '995aa484bc761631ead72aa927a8b7db206376bbe334f88b990f3199b7eaa036', '[\"*\"]', '2024-07-05 01:22:09', NULL, '2024-07-05 01:20:16', '2024-07-05 01:22:09'),
(421, 'App\\Models\\User', 28, 'app', 'a14c960a7b647dce982e78bc44a1b734b63b9c240e7df912d48d581bce612809', '[\"*\"]', '2024-07-05 01:25:53', NULL, '2024-07-05 01:23:59', '2024-07-05 01:25:53'),
(422, 'App\\Models\\User', 28, 'app', '18d79f9c8a1e3ca6256f1739ce05c54816526ac60fdfaabd1f53b723e0bb4bf1', '[\"*\"]', '2024-07-05 01:27:15', NULL, '2024-07-05 01:26:02', '2024-07-05 01:27:15'),
(423, 'App\\Models\\User', 28, 'app', 'a7b47239f1ecce9c91590e267b789d29c182415cf149cc805587577a007f4837', '[\"*\"]', '2024-07-05 01:28:06', NULL, '2024-07-05 01:27:26', '2024-07-05 01:28:06'),
(424, 'App\\Models\\User', 28, 'app', 'ebb427183308e1601b38db1deaae6a48a8488d4c3bd91874bf449bf5ac868d9a', '[\"*\"]', '2024-07-05 01:29:59', NULL, '2024-07-05 01:28:15', '2024-07-05 01:29:59'),
(425, 'App\\Models\\User', 28, 'app', '1f2bc370b6449f0fbf89a80eb56e10465a0c97aa412cb270424aa2e6807c1015', '[\"*\"]', '2024-07-05 01:30:58', NULL, '2024-07-05 01:30:08', '2024-07-05 01:30:58'),
(426, 'App\\Models\\User', 28, 'app', 'eac20deeb60462edafe02e5f8e1e97e0216e149dc1f03ebd50dc788f696c3b3b', '[\"*\"]', '2024-07-05 01:31:49', NULL, '2024-07-05 01:31:08', '2024-07-05 01:31:49'),
(427, 'App\\Models\\User', 28, 'app', '2132e326dbcd07648e2825a741bf9e36d0229980db87b5a0cf84183a1a2fa69b', '[\"*\"]', '2024-07-05 01:36:43', NULL, '2024-07-05 01:31:56', '2024-07-05 01:36:43'),
(428, 'App\\Models\\User', 28, 'app', '5296458707e97a0c7aa7dad05a2e3e293f0e1ca907b63f4151f662e0c5b4b9d3', '[\"*\"]', '2024-07-05 01:37:10', NULL, '2024-07-05 01:36:52', '2024-07-05 01:37:10'),
(429, 'App\\Models\\User', 28, 'app', '932af74edfd3aa1c4873642881f418d734312ffb7cae0179af688ee3dc77ca72', '[\"*\"]', '2024-07-05 02:19:29', NULL, '2024-07-05 01:37:19', '2024-07-05 02:19:29'),
(430, 'App\\Models\\User', 28, 'app', 'e015f1e5279c622ce8bd8c82f90af25c47ccf94ff4945d930b86a02be86bc89a', '[\"*\"]', '2024-07-05 03:02:44', NULL, '2024-07-05 02:23:02', '2024-07-05 03:02:44'),
(431, 'App\\Models\\User', 63, 'app', 'b0037c3f40338f82accac38ac6e580dda260d319f67bfa359a7ddfda521cb06d', '[\"*\"]', '2024-07-05 03:06:21', NULL, '2024-07-05 03:03:20', '2024-07-05 03:06:21'),
(432, 'App\\Models\\User', 28, 'app', 'ba87beff7ece91e545efc9d73e14f44281072519faa8f4ecb3f4827a6fc29687', '[\"*\"]', '2024-07-05 03:27:05', NULL, '2024-07-05 03:06:28', '2024-07-05 03:27:05'),
(433, 'App\\Models\\User', 28, 'app', '0e06c42981d7528ef6790f13c0eb3631da72072c495a27d7c1e24fc04529b9cb', '[\"*\"]', '2024-07-05 03:27:31', NULL, '2024-07-05 03:27:21', '2024-07-05 03:27:31'),
(434, 'App\\Models\\User', 28, 'app', '65191cd7575ede58022541258f91ae879e70b5e37478017ea0fe0fb93dff6cc3', '[\"*\"]', '2024-07-05 03:37:49', NULL, '2024-07-05 03:37:29', '2024-07-05 03:37:49'),
(435, 'App\\Models\\User', 63, 'app', '869a88f7378e19d840a06b918489c0b47d893ac7ef787b203f1eeb9906b0dc5f', '[\"*\"]', '2024-07-05 03:46:45', NULL, '2024-07-05 03:37:56', '2024-07-05 03:46:45'),
(436, 'App\\Models\\User', 63, 'app', 'ec25560b8138a9f06c3b212a47e979de00fd988bd7516e529b08a17920a867d6', '[\"*\"]', '2024-07-05 03:47:08', NULL, '2024-07-05 03:46:53', '2024-07-05 03:47:08'),
(437, 'App\\Models\\User', 28, 'app', '66039d3e04cff68de1476059b68a23fd1ae09708703cd9ce729fb43225b8b33f', '[\"*\"]', '2024-07-05 03:47:32', NULL, '2024-07-05 03:47:20', '2024-07-05 03:47:32'),
(438, 'App\\Models\\User', 63, 'app', 'a5cf8267655f62d35aa80efb020ac09f55a1a3efa627a9d332e99171f259aa55', '[\"*\"]', '2024-07-05 22:35:29', NULL, '2024-07-05 22:33:51', '2024-07-05 22:35:29'),
(439, 'App\\Models\\User', 63, 'app', '6806c29f7781497db36eea755a12b5231bcd5d789c5a81811c3e250254bf73b2', '[\"*\"]', '2024-07-09 01:00:06', NULL, '2024-07-05 22:35:37', '2024-07-09 01:00:06'),
(440, 'App\\Models\\User', 63, 'app', 'ade650b224abe31a1c54ff08b75283aa703f284a66ef353213e143f9e23328ef', '[\"*\"]', '2024-07-05 22:40:43', NULL, '2024-07-05 22:36:35', '2024-07-05 22:40:43'),
(441, 'App\\Models\\User', 63, 'app', '79fff2d2fd7d6ac1acf15b924600fec87fdc52b2e2850919b1f49d7a6d0b0219', '[\"*\"]', '2024-07-05 22:55:14', NULL, '2024-07-05 22:40:52', '2024-07-05 22:55:14'),
(442, 'App\\Models\\User', 28, 'app', 'b2bf4bce87ae2c5fbbedae65ac75fe53d46088822e8a9aa9adcfcd013d877889', '[\"*\"]', '2024-07-05 23:03:35', NULL, '2024-07-05 22:55:28', '2024-07-05 23:03:35'),
(443, 'App\\Models\\User', 28, 'app', 'b824fdb334e298cd529007b10c2ec452ed063080fb8dc8469ab03fb58d468bbb', '[\"*\"]', '2024-07-05 23:04:09', NULL, '2024-07-05 23:03:51', '2024-07-05 23:04:09'),
(444, 'App\\Models\\User', 28, 'app', '539e1321cac50a79d481989d44655cdf975c7c097381164d4f3e2eb3622150d9', '[\"*\"]', '2024-07-06 00:05:49', NULL, '2024-07-05 23:04:33', '2024-07-06 00:05:49'),
(445, 'App\\Models\\User', 28, 'app', 'e606d83bde6efbf44c632601caacb6a574145428cc91fee91c9a2b1a31fc6965', '[\"*\"]', '2024-07-06 03:44:32', NULL, '2024-07-06 02:59:10', '2024-07-06 03:44:32'),
(446, 'App\\Models\\User', 28, 'app', '757590721533f31ad7bf1b444d61f9adb5d23672a25cf68771a0f452b0001748', '[\"*\"]', NULL, NULL, '2024-07-08 21:42:46', '2024-07-08 21:42:46'),
(447, 'App\\Models\\User', 28, 'app', 'a6be858250b1f27ba97873d7c5d525ebffc83f12f3b4327d4ea23e95b46ca243', '[\"*\"]', NULL, NULL, '2024-07-08 21:43:10', '2024-07-08 21:43:10'),
(448, 'App\\Models\\User', 28, 'app', '90f20d739a2ee558990b604484a9404c6cc5675d880bd1912d266d4e047c91fd', '[\"*\"]', '2024-07-08 22:04:43', NULL, '2024-07-08 21:43:43', '2024-07-08 22:04:43'),
(449, 'App\\Models\\User', 63, 'app', '01612f8515e390d77c2c9b08b7fdb9fd515e58be6b6092f0b9e6011cd39e36bc', '[\"*\"]', '2024-07-09 02:26:37', NULL, '2024-07-08 22:05:03', '2024-07-09 02:26:37'),
(450, 'App\\Models\\User', 63, 'app', 'e3df4185a6fe17d7d895c7d4a4571f8be0ded2d26b696958fae401e01c0fbe27', '[\"*\"]', '2024-07-09 01:19:53', NULL, '2024-07-09 01:18:24', '2024-07-09 01:19:53'),
(451, 'App\\Models\\User', 63, 'app', 'fdd2435a145c23aab3648198e313734936cd8fb0d96d9184ddfe3b506e3cc70a', '[\"*\"]', '2024-07-09 01:34:19', NULL, '2024-07-09 01:28:45', '2024-07-09 01:34:19'),
(452, 'App\\Models\\User', 28, 'app', 'e1e480b8753de75d6725f0a95919ac864d762c5e5fbe3a8752230682e50aa650', '[\"*\"]', '2024-07-09 22:08:03', NULL, '2024-07-09 01:36:31', '2024-07-09 22:08:03'),
(453, 'App\\Models\\User', 69, 'app', '7db74b3934f4c844c6056d708602193dfd6e1132bb7b5b214de12ed06670c064', '[\"*\"]', '2024-07-09 02:34:26', NULL, '2024-07-09 02:29:56', '2024-07-09 02:34:26'),
(454, 'App\\Models\\User', 70, 'app', '3bd40740e1ae622266ec2f6f2968875d6eb6b6c2f97c41eaf9433e537e3d3ec8', '[\"*\"]', NULL, NULL, '2024-07-09 02:59:39', '2024-07-09 02:59:39'),
(455, 'App\\Models\\User', 71, 'app', 'c898268612cfac587366c8171d972c834ccd6061ffc447176df574a1e9d53dd6', '[\"*\"]', NULL, NULL, '2024-07-09 03:09:48', '2024-07-09 03:09:48'),
(456, 'App\\Models\\User', 72, 'app', 'dad17e2e7388cee6d9c826d09935cec06976f2c94967c020a99be7dd2b316efb', '[\"*\"]', NULL, NULL, '2024-07-09 03:16:21', '2024-07-09 03:16:21'),
(457, 'App\\Models\\User', 72, 'app', '8d5e4f9d92e3a1c623e83c55fd6f765d647c941410400c6cdf319241b9adc09b', '[\"*\"]', '2024-07-09 03:17:45', NULL, '2024-07-09 03:17:37', '2024-07-09 03:17:45'),
(458, 'App\\Models\\User', 73, 'app', '2b335f9175a2239a5eada9b007b21d6c335e48f977662498e2d220f8d56f9a77', '[\"*\"]', NULL, NULL, '2024-07-09 03:23:06', '2024-07-09 03:23:06'),
(459, 'App\\Models\\User', 73, 'app', 'f758cff8d520a5c183e8c95d3711640b9bae6eafa9cebc8cf62379fef7f68ddb', '[\"*\"]', '2024-07-09 03:37:48', NULL, '2024-07-09 03:32:49', '2024-07-09 03:37:48'),
(460, 'App\\Models\\User', 28, 'app', 'ba2c1e56e6f6ad35e1b3353d8b8bb1a9679a060ea0b5c0af815311befedacfe8', '[\"*\"]', '2024-07-09 03:40:05', NULL, '2024-07-09 03:37:56', '2024-07-09 03:40:05'),
(461, 'App\\Models\\User', 74, 'app', '8ab836c427950dbfc140026811e7011d14d5e82d0122690df64448ffc064842f', '[\"*\"]', NULL, NULL, '2024-07-09 03:41:25', '2024-07-09 03:41:25'),
(462, 'App\\Models\\User', 74, 'app', 'd11571aa13f80835c831d0eb95332ce52de4986d5a60cf150f3a2a62fb2a31ef', '[\"*\"]', '2024-07-09 03:43:39', NULL, '2024-07-09 03:41:48', '2024-07-09 03:43:39'),
(463, 'App\\Models\\User', 75, 'app', '5d781fd31ae2eeac930377282f65f0dd3b8b54ba7caaa9099e5bb9aea4f219b3', '[\"*\"]', NULL, NULL, '2024-07-09 03:47:39', '2024-07-09 03:47:39'),
(464, 'App\\Models\\User', 76, 'app', 'af2a76db6f3a4ea5a70417defdc5293baa60525395d21aa7fa6e84c6d2a51feb', '[\"*\"]', NULL, NULL, '2024-07-09 03:48:38', '2024-07-09 03:48:38'),
(465, 'App\\Models\\User', 77, 'app', 'caab3634245112c10d152cb949971b26c75c942e9a110f58c56ee3d1c38dcc6c', '[\"*\"]', NULL, NULL, '2024-07-09 03:50:34', '2024-07-09 03:50:34'),
(466, 'App\\Models\\User', 78, 'app', '385b93fb903caba5afa18f81484b8d53b7d56b97c6c9741f9316120aeeef0400', '[\"*\"]', NULL, NULL, '2024-07-09 03:54:48', '2024-07-09 03:54:48'),
(467, 'App\\Models\\User', 79, 'app', '28dff0dc1dd4b8ae77306d2ec5564baeeb199e019c0fc3649c4b4f959207a1e2', '[\"*\"]', NULL, NULL, '2024-07-09 03:55:35', '2024-07-09 03:55:35'),
(468, 'App\\Models\\User', 80, 'app', 'e09c7813f1a3d489edafaca51580ccad6586bd66aec29efa43c7b7f556c5d296', '[\"*\"]', NULL, NULL, '2024-07-09 03:59:47', '2024-07-09 03:59:47'),
(469, 'App\\Models\\User', 62, 'app', '009277d6d2a009d85de69c1fab74aee86fa78f0a8c9423950639c27189bb67f3', '[\"*\"]', '2024-07-09 04:19:38', NULL, '2024-07-09 04:04:17', '2024-07-09 04:19:38'),
(470, 'App\\Models\\User', 81, 'app', '0372dc52713c43b4927769158dc9c594216c668cbe3a952edee9220ad0dcd207', '[\"*\"]', NULL, NULL, '2024-07-09 04:20:34', '2024-07-09 04:20:34'),
(471, 'App\\Models\\User', 28, 'app', 'b901f12bd5565f9c678a74693206fc80f4ae00a1bfcdf434048d427179cb01cd', '[\"*\"]', '2024-07-09 04:28:12', NULL, '2024-07-09 04:21:07', '2024-07-09 04:28:12'),
(472, 'App\\Models\\User', 81, 'app', 'f7dd961ae332f8890e89e01c74d1b7ca1195e9216747517c49021c1599542ba2', '[\"*\"]', '2024-07-09 05:05:06', NULL, '2024-07-09 04:28:51', '2024-07-09 05:05:06'),
(473, 'App\\Models\\User', 62, 'app', '9fa1480ad4fc7b5c1076f08035d7c13ad7825975539a0c4eb6cb4bb2272aed71', '[\"*\"]', '2024-07-09 05:13:48', NULL, '2024-07-09 05:05:27', '2024-07-09 05:13:48'),
(474, 'App\\Models\\User', 62, 'app', '2ea61d7030fc49838d415fe35025613ad0f2145eac7580f515d2380cac7d8641', '[\"*\"]', '2024-07-09 05:31:19', NULL, '2024-07-09 05:14:14', '2024-07-09 05:31:19'),
(475, 'App\\Models\\User', 28, 'app', 'bc8c9490f53a5425fa290b22c6887193a7007fcb59a821f4d66552e3febeb41d', '[\"*\"]', '2024-07-09 05:59:44', NULL, '2024-07-09 05:39:43', '2024-07-09 05:59:44'),
(476, 'App\\Models\\User', 89, 'app', 'b1cb69fe254fa9d9bfbce269eceab7fa7a91c8647db24b23fc1b558ce0af1031', '[\"*\"]', NULL, NULL, '2024-07-09 06:10:13', '2024-07-09 06:10:13'),
(477, 'App\\Models\\User', 103, 'app', '7e4dda177b539567791a29ac4cf68fa1e4c9d4e7ef4c9b28438947833df6be03', '[\"*\"]', NULL, NULL, '2024-07-09 06:29:21', '2024-07-09 06:29:21'),
(478, 'App\\Models\\User', 105, 'app', '4b2791d88c4ccde8cfea4611670f5bb2c1381535be369ae8b850f0c8c138685e', '[\"*\"]', NULL, NULL, '2024-07-09 06:33:07', '2024-07-09 06:33:07'),
(479, 'App\\Models\\User', 105, 'app', 'e00c46131be956a581541cef260b5ad06e6fe38ef2e28bf4a0ebb570d63cfc32', '[\"*\"]', NULL, NULL, '2024-07-09 06:37:45', '2024-07-09 06:37:45'),
(480, 'App\\Models\\User', 105, 'app', 'eab8b0314556123de46be4fb7f81f62e214209ea969779784a014141b53e12f9', '[\"*\"]', NULL, NULL, '2024-07-09 06:38:21', '2024-07-09 06:38:21'),
(481, 'App\\Models\\User', 105, 'app', '08d716ec3f47340a150eca20165a3c75abb2bdc54e159cb625fd93509aac9f7e', '[\"*\"]', NULL, NULL, '2024-07-09 06:38:54', '2024-07-09 06:38:54'),
(482, 'App\\Models\\User', 105, 'app', 'dba65351d3c3e563e7e0a37a7c8a5f3bf0176872d6c310ad4f68030e8b31db1c', '[\"*\"]', NULL, NULL, '2024-07-09 06:39:21', '2024-07-09 06:39:21'),
(483, 'App\\Models\\User', 105, 'app', 'b186c1d98c1adbc2a11c8296a1de1cb72de59ab7d835880799b839a96b1cbf37', '[\"*\"]', NULL, NULL, '2024-07-09 06:40:37', '2024-07-09 06:40:37'),
(484, 'App\\Models\\User', 105, 'app', 'a4182d118b14ce8be71274c5bf8234aade276bd7fd51910d149685eb9615910a', '[\"*\"]', NULL, NULL, '2024-07-09 06:40:57', '2024-07-09 06:40:57'),
(485, 'App\\Models\\User', 105, 'app', '528b6545d67184cb533e68a582b86af1261102f4713117db2625f70373267dc0', '[\"*\"]', NULL, NULL, '2024-07-09 06:43:41', '2024-07-09 06:43:41'),
(486, 'App\\Models\\User', 105, 'app', 'dd338b0d04fc89db8598923225e842fed69b700d971a1c20bd47fc112de75c78', '[\"*\"]', NULL, NULL, '2024-07-09 06:43:57', '2024-07-09 06:43:57'),
(487, 'App\\Models\\User', 105, 'app', '02159cfdc62493a2bd380f7b2d858041983e3d51d21f98a1588e1f141b5f7ac4', '[\"*\"]', NULL, NULL, '2024-07-09 06:45:00', '2024-07-09 06:45:00'),
(488, 'App\\Models\\User', 105, 'app', '998e5f7308409241d4e5e7e4fb2f4af4e5e847b082d91133ebc5f9f9ab81209f', '[\"*\"]', NULL, NULL, '2024-07-09 06:45:26', '2024-07-09 06:45:26'),
(489, 'App\\Models\\User', 105, 'app', 'e5b65a6a5aa78a1044277c31e78e16b8f45dfc779bff367a1a376688046aa101', '[\"*\"]', NULL, NULL, '2024-07-09 06:47:24', '2024-07-09 06:47:24'),
(490, 'App\\Models\\User', 105, 'app', '78d947f75dd59cd286a0f7eae967d73fedbdfaf979219148154ad2db95c32a5a', '[\"*\"]', NULL, NULL, '2024-07-09 06:48:00', '2024-07-09 06:48:00'),
(491, 'App\\Models\\User', 28, 'app', 'e71122b47469b9f918752f9aaef695acdfc65d4dc7f3b6788e0c4ccca39f805b', '[\"*\"]', NULL, NULL, '2024-07-09 22:10:48', '2024-07-09 22:10:48'),
(492, 'App\\Models\\User', 28, 'app', '2a2438c0a1defd16220f5cc0ec90d9da6c21af15eaef67589f0186c2fc0307b6', '[\"*\"]', NULL, NULL, '2024-07-09 22:11:23', '2024-07-09 22:11:23'),
(493, 'App\\Models\\User', 28, 'app', 'fe8f8a321631b80ea366c4783724dfa99e9ca4dddb204fa5b764251269956af3', '[\"*\"]', NULL, NULL, '2024-07-09 22:12:13', '2024-07-09 22:12:13'),
(494, 'App\\Models\\User', 28, 'app', '232a77936fa2c91cadd47337e4b70044e9746320f85bd8f80011a3b92edbc1dd', '[\"*\"]', '2024-07-09 22:17:54', NULL, '2024-07-09 22:14:38', '2024-07-09 22:17:54'),
(495, 'App\\Models\\User', 28, 'app', '17bc8da8669e5442b2cd404a69ba26a21e4ee1c56bebad2b5c60307a552541ec', '[\"*\"]', '2024-07-09 22:26:28', NULL, '2024-07-09 22:17:56', '2024-07-09 22:26:28'),
(496, 'App\\Models\\User', 28, 'app', 'd888b49d85fed1a4770167ca793919bf3a17e8a4916720beed12306b8cdb82be', '[\"*\"]', '2024-07-09 22:45:04', NULL, '2024-07-09 22:26:36', '2024-07-09 22:45:04'),
(497, 'App\\Models\\User', 28, 'app', '27479aa1277f94ae9e1c0f27170f84316500d1ed60d9dc81c3ddaf8bed724bd8', '[\"*\"]', '2024-07-09 22:45:54', NULL, '2024-07-09 22:45:34', '2024-07-09 22:45:54'),
(498, 'App\\Models\\User', 28, 'app', 'a7fe619f06535c7ff786c5f7b5bb1bde0bbb4370de801c23e929a4d29e9288ef', '[\"*\"]', '2024-07-09 22:47:19', NULL, '2024-07-09 22:46:09', '2024-07-09 22:47:19'),
(499, 'App\\Models\\User', 28, 'app', '1971936ae57793365b3a369752a6893dd17bd43c27ef4ae057574660a6e9902a', '[\"*\"]', '2024-07-09 22:47:43', NULL, '2024-07-09 22:47:32', '2024-07-09 22:47:43'),
(500, 'App\\Models\\User', 62, 'app', '38f11cd5fbce61583ba2533c9a26e31ccaf038958a2f03c709b79b9b40376546', '[\"*\"]', '2024-07-09 22:49:15', NULL, '2024-07-09 22:47:52', '2024-07-09 22:49:15'),
(501, 'App\\Models\\User', 62, 'app', 'ea4369eec76b1bd2cd59e46b8c55863fa8e231e7b7060638c2c910910ef2e14a', '[\"*\"]', NULL, NULL, '2024-07-09 22:49:53', '2024-07-09 22:49:53'),
(502, 'App\\Models\\User', 62, 'app', 'd0275b60c26aeb2822f66d6a3d4495903d7ab881beb3b30f73a4186e3c75bd4c', '[\"*\"]', NULL, NULL, '2024-07-09 22:50:10', '2024-07-09 22:50:10'),
(503, 'App\\Models\\User', 62, 'app', '11a4e7e43a916a403e00971fb3fd92927bf2a841d772b5627af846041580a9de', '[\"*\"]', NULL, NULL, '2024-07-09 22:50:45', '2024-07-09 22:50:45'),
(504, 'App\\Models\\User', 62, 'app', 'bd1e73400ddcfbcd69993b27f74b273522ad50a1dc2b59baced954d2bbed2a8b', '[\"*\"]', NULL, NULL, '2024-07-09 22:55:19', '2024-07-09 22:55:19'),
(505, 'App\\Models\\User', 62, 'app', 'fd335bb8cdf6838b599d6865e68ae73cf984c3358c6975fab188a460edbcd10c', '[\"*\"]', '2024-07-09 22:56:09', NULL, '2024-07-09 22:56:01', '2024-07-09 22:56:09'),
(506, 'App\\Models\\User', 62, 'app', 'eee930aa1154cb905fbbb57eb35856ce33f5cda24fae8e92a1b2d5831be0122c', '[\"*\"]', '2024-07-09 22:56:44', NULL, '2024-07-09 22:56:19', '2024-07-09 22:56:44'),
(507, 'App\\Models\\User', 28, 'app', '4239d002ed59885e85a68a816145e72919cc4dc23289ad501e68f736cd1bc8ad', '[\"*\"]', '2024-07-09 22:57:48', NULL, '2024-07-09 22:56:53', '2024-07-09 22:57:48'),
(508, 'App\\Models\\User', 62, 'app', 'b467c6c1cc8762231419e5b56e9a8c936652b9f26e72538e08afd36f43086fa3', '[\"*\"]', '2024-07-09 22:58:05', NULL, '2024-07-09 22:57:59', '2024-07-09 22:58:05'),
(509, 'App\\Models\\User', 28, 'app', '3b148334735c1002c6e3e50cd4ad537f0d795048be1f1cd0e7e8e6ccf25ddf75', '[\"*\"]', '2024-07-09 22:59:06', NULL, '2024-07-09 22:58:15', '2024-07-09 22:59:06'),
(510, 'App\\Models\\User', 28, 'app', '7f1512cc4906596d5908321fdf7da905857ac2b64a4e536ef8bffd27c5487ead', '[\"*\"]', '2024-07-09 22:59:29', NULL, '2024-07-09 22:59:24', '2024-07-09 22:59:29'),
(511, 'App\\Models\\User', 28, 'app', 'b4ccbe48de2821b62d030142307f00ed11103a9b26e82fcfec406655cacd55be', '[\"*\"]', '2024-07-09 23:00:34', NULL, '2024-07-09 23:00:01', '2024-07-09 23:00:34'),
(512, 'App\\Models\\User', 62, 'app', '578146531332aab1dd0946133eec093673fe3999d89efe64547e136f1f882101', '[\"*\"]', '2024-07-09 23:01:23', NULL, '2024-07-09 23:00:42', '2024-07-09 23:01:23'),
(513, 'App\\Models\\User', 62, 'app', '74b7414d1ee4694a4651e2d7f5ffb680a4a086128d4ba7ed4554b5e211bb8454', '[\"*\"]', NULL, NULL, '2024-07-09 23:01:36', '2024-07-09 23:01:36'),
(514, 'App\\Models\\User', 62, 'app', 'ad11d5b88acd01dea12e6cbb92f963ee3101a7df0fb966f3c64ddad84b6d6e60', '[\"*\"]', NULL, NULL, '2024-07-09 23:01:54', '2024-07-09 23:01:54'),
(515, 'App\\Models\\User', 62, 'app', 'd63ad0c188e4a504e9a10cf62e5302fc63137bfc82735fc42d78c97a57022082', '[\"*\"]', '2024-07-09 23:02:27', NULL, '2024-07-09 23:02:16', '2024-07-09 23:02:27'),
(516, 'App\\Models\\User', 62, 'app', 'ea1280569ec9ae041815238c96f8044374155a91871fd5ee4f5be4fc812a864a', '[\"*\"]', '2024-07-09 23:02:44', NULL, '2024-07-09 23:02:39', '2024-07-09 23:02:44'),
(517, 'App\\Models\\User', 28, 'app', 'cb79bdf7430f5448c155971db57b5ed3bf87ab57ae58cb008604cf6f159d81e1', '[\"*\"]', '2024-07-09 23:08:09', NULL, '2024-07-09 23:02:52', '2024-07-09 23:08:09'),
(518, 'App\\Models\\User', 28, 'app', 'ae04ac5001ee2f164a3cf56208656d675547c7ee2be27e0fbe941cbb8df6dfa8', '[\"*\"]', '2024-07-09 23:09:46', NULL, '2024-07-09 23:08:19', '2024-07-09 23:09:46'),
(519, 'App\\Models\\User', 28, 'app', '3cac84587fad8b5930f247d776669a6783bbacc89f223d8d7a870cf76e4a9e2c', '[\"*\"]', '2024-07-09 23:17:36', NULL, '2024-07-09 23:10:52', '2024-07-09 23:17:36'),
(520, 'App\\Models\\User', 62, 'app', '95d6e658ecd3685fd37c405598c3aa501d702711d9360c7247c0c0734e16342f', '[\"*\"]', '2024-07-09 23:27:30', NULL, '2024-07-09 23:17:58', '2024-07-09 23:27:30'),
(521, 'App\\Models\\User', 28, 'app', '2105a2227308b0143f7d6488fabb6038728b48883a6f718a8e56a32201f43ff0', '[\"*\"]', '2024-07-09 23:37:09', NULL, '2024-07-09 23:27:41', '2024-07-09 23:37:09'),
(522, 'App\\Models\\User', 62, 'app', '9dacebdb3eb1add97a6d80263e58060faec9957ecdac96540c1c6ff497acf357', '[\"*\"]', '2024-07-09 23:37:31', NULL, '2024-07-09 23:37:19', '2024-07-09 23:37:31'),
(523, 'App\\Models\\User', 28, 'app', 'db30fcb920d41e49017313a439b2d13b51bc51101aa998a37b3d0433c75f6f4d', '[\"*\"]', '2024-07-09 23:38:38', NULL, '2024-07-09 23:37:40', '2024-07-09 23:38:38'),
(524, 'App\\Models\\User', 28, 'app', '586ad77118224dabfe35330d2dc61e944a695807e7746488681c415fc8785d51', '[\"*\"]', '2024-07-10 00:36:01', NULL, '2024-07-09 23:38:47', '2024-07-10 00:36:01'),
(525, 'App\\Models\\User', 62, 'app', 'f5dddcbe2e78a16d44f64614e892d067ac5c6552b847e7e8e53d7cb93dd356cb', '[\"*\"]', '2024-07-10 00:03:19', NULL, '2024-07-09 23:57:07', '2024-07-10 00:03:19'),
(526, 'App\\Models\\User', 62, 'app', '336cdce0fb2d895981b0f06d760f7b4b604ca2b5a13e80ce61856906a86c0183', '[\"*\"]', '2024-07-10 00:03:54', NULL, '2024-07-10 00:03:28', '2024-07-10 00:03:54'),
(527, 'App\\Models\\User', 28, 'app', 'dfc24a70e0c55a5117d060378d66185f9a295f32dff2af7b25621b0a321a484b', '[\"*\"]', '2024-07-10 00:07:14', NULL, '2024-07-10 00:05:03', '2024-07-10 00:07:14'),
(528, 'App\\Models\\User', 28, 'app', 'a908fd9964d2b10d1924f5cfd726cb26d18934309321e98e057693a1407ae484', '[\"*\"]', '2024-07-10 00:19:00', NULL, '2024-07-10 00:07:24', '2024-07-10 00:19:00'),
(529, 'App\\Models\\User', 62, 'app', '5a03dd08c2bb4a421090b5bd26731f3989ebaaeeb7ea71e0ccb8d42455c77ef0', '[\"*\"]', '2024-07-10 00:20:51', NULL, '2024-07-10 00:19:22', '2024-07-10 00:20:51'),
(530, 'App\\Models\\User', 62, 'app', 'dd2e70d918bfea560790554032f80b8e7841e5d9d475b43ce867b698acf2bf1a', '[\"*\"]', '2024-07-10 00:21:38', NULL, '2024-07-10 00:21:07', '2024-07-10 00:21:38'),
(531, 'App\\Models\\User', 28, 'app', '0d1d75ef1b396a510e5a5837a34a26d236e805dd9f7a3fb675accc50de31b61e', '[\"*\"]', '2024-07-10 00:22:54', NULL, '2024-07-10 00:21:48', '2024-07-10 00:22:54'),
(532, 'App\\Models\\User', 62, 'app', 'a24477d415a273b447ad8be0be7e5d7cde1d893dfcfcfcabc63a15afb4145f95', '[\"*\"]', '2024-07-10 00:23:18', NULL, '2024-07-10 00:23:02', '2024-07-10 00:23:18'),
(533, 'App\\Models\\User', 28, 'app', 'e82fd776963a69e5236063d5e004780b49b52e902c5a8a171f3e6113a97f613b', '[\"*\"]', '2024-07-10 00:54:22', NULL, '2024-07-10 00:23:28', '2024-07-10 00:54:22'),
(534, 'App\\Models\\User', 62, 'app', 'a7e403c6c9171ee0afa0da74822495228c5b0fc05c06e4505b62d8317f59cadb', '[\"*\"]', '2024-07-10 00:44:56', NULL, '2024-07-10 00:44:22', '2024-07-10 00:44:56'),
(535, 'App\\Models\\User', 28, 'app', 'a34dc48e852e46f4d8b06f89e465d4940b3cbb394751c93c956b0c90ba92aaaa', '[\"*\"]', '2024-07-10 02:05:52', NULL, '2024-07-10 00:45:07', '2024-07-10 02:05:52'),
(536, 'App\\Models\\User', 28, 'app', '8c18dfa3aeb7c46550a413f50917ed248a712766f5fd79d36be5e3eed96388c5', '[\"*\"]', '2024-07-10 01:09:56', NULL, '2024-07-10 00:56:05', '2024-07-10 01:09:56');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(537, 'App\\Models\\User', 62, 'app', 'f7d2b92274beddf2f031dc8b3d14e8121366f30c1868ec2842c1504185099371', '[\"*\"]', '2024-07-10 01:10:19', NULL, '2024-07-10 01:10:02', '2024-07-10 01:10:19'),
(538, 'App\\Models\\User', 28, 'app', '4a8195ed62df300c6eca90c872ac350c990f00796164700ff0335e64b46900fe', '[\"*\"]', '2024-07-10 01:54:50', NULL, '2024-07-10 01:53:37', '2024-07-10 01:54:50'),
(539, 'App\\Models\\User', 62, 'app', 'bf93c6dd56911ce15b36cba7675ad509f9db80e46273eba85d9cb98c967acace', '[\"*\"]', '2024-07-10 01:55:16', NULL, '2024-07-10 01:54:58', '2024-07-10 01:55:16'),
(540, 'App\\Models\\User', 28, 'app', '453bf0f2befe8fc1d7c3e016fcb6a3eccc8b0bb9cfce9ecd81e8870875b29f31', '[\"*\"]', '2024-07-10 01:57:08', NULL, '2024-07-10 01:55:26', '2024-07-10 01:57:08'),
(541, 'App\\Models\\User', 28, 'app', 'ebcc02a853101f79e39c366b512fcffce30cf8f9f0d932cad3cd401c605d87d3', '[\"*\"]', '2024-07-11 05:44:03', NULL, '2024-07-10 01:57:18', '2024-07-11 05:44:03'),
(542, 'App\\Models\\User', 28, 'app', '377eb297420b3800fc1b51f4cf0bbd8c25c44bbecb2c196c5a0dcb3c7956dfce', '[\"*\"]', '2024-07-10 02:15:59', NULL, '2024-07-10 02:06:05', '2024-07-10 02:15:59'),
(543, 'App\\Models\\User', 28, 'app', '1453b492fd5a0bcc4320fd924db910ba591b8319e3272973ba24850a977dab98', '[\"*\"]', '2024-07-10 02:28:45', NULL, '2024-07-10 02:16:08', '2024-07-10 02:28:45'),
(544, 'App\\Models\\User', 28, 'app', '0050ce045d553e5b7cd120b1173b008e7a4a77a20ca80d9718a546a5b9f5bd00', '[\"*\"]', '2024-07-10 02:32:32', NULL, '2024-07-10 02:28:53', '2024-07-10 02:32:32'),
(545, 'App\\Models\\User', 28, 'app', '01a8b48b9b15547735d0a40e8405224dc0b9e095faf4c532a777fa88565453e7', '[\"*\"]', '2024-07-10 02:36:46', NULL, '2024-07-10 02:32:43', '2024-07-10 02:36:46'),
(546, 'App\\Models\\User', 28, 'app', '188dd81e3dcbd784b9bff6ef6a2080f65411f4f03a6f07fdf170b4e980fd5cdc', '[\"*\"]', '2024-07-10 02:37:23', NULL, '2024-07-10 02:36:53', '2024-07-10 02:37:23'),
(547, 'App\\Models\\User', 28, 'app', '1e60f058a9acdac75b71980781d050c0dcd9fd377df8e7c307517d522b6defb3', '[\"*\"]', '2024-07-10 02:42:02', NULL, '2024-07-10 02:37:35', '2024-07-10 02:42:02'),
(548, 'App\\Models\\User', 62, 'app', '52308086fdb1ce4acb69108e8595fc7153470b11b0b359a928ea03ddd8ff925b', '[\"*\"]', '2024-07-10 02:42:31', NULL, '2024-07-10 02:42:11', '2024-07-10 02:42:31'),
(549, 'App\\Models\\User', 28, 'app', 'b865e5a095b0f911ee2248858a4aa16bc378f1b9ae43ce1a812590ba1cc91e1e', '[\"*\"]', '2024-07-10 03:22:53', NULL, '2024-07-10 02:42:42', '2024-07-10 03:22:53'),
(550, 'App\\Models\\User', 28, 'app', 'b47608347b99b40aa962f9ff3104bcea54b416c87c79d678902f428e8a160c72', '[\"*\"]', '2024-07-11 05:52:34', NULL, '2024-07-11 05:44:19', '2024-07-11 05:52:34'),
(551, 'App\\Models\\User', 28, 'app', 'e2d2b4d4fd375a329196ba8ca35f73142313473f4f496b16a77ac6ce4f72a55a', '[\"*\"]', '2024-07-11 05:53:34', NULL, '2024-07-11 05:52:46', '2024-07-11 05:53:34'),
(552, 'App\\Models\\User', 28, 'app', 'bde3f5bcc7b06f4cfb7717cf876ebc45d467c2145951d6e4434fbda0e9d6f21a', '[\"*\"]', NULL, NULL, '2024-07-11 05:53:42', '2024-07-11 05:53:42'),
(553, 'App\\Models\\User', 28, 'app', '8de941d50e729423f4ae33e6e8b99ea2fb5e16f7cf24cf1a84ec0adc046ba03a', '[\"*\"]', NULL, NULL, '2024-07-11 05:54:16', '2024-07-11 05:54:16'),
(554, 'App\\Models\\User', 28, 'app', '085611e36168deeb8f3684ae3713bdfa652b4d2ab96e95038d7287ff2f5a41bc', '[\"*\"]', NULL, NULL, '2024-07-11 05:54:49', '2024-07-11 05:54:49'),
(555, 'App\\Models\\User', 28, 'app', '57facb0d2f12c4e3a8ed7a8d10a6c5ae7dcd37fd7e9a3d60518f1a1a755d4e4e', '[\"*\"]', '2024-07-11 05:54:59', NULL, '2024-07-11 05:54:53', '2024-07-11 05:54:59'),
(556, 'App\\Models\\User', 28, 'app', '497bb0070459994666c39f89d2110a1be7bf3d1802ad36d6aeeac60ad55cdbb1', '[\"*\"]', '2024-07-13 06:21:03', NULL, '2024-07-11 05:55:04', '2024-07-13 06:21:03'),
(557, 'App\\Models\\User', 28, 'app', '1fcaee8cb049c3c97769da43dfdc0a63cca5ed548b52a9cd2161c65591037e26', '[\"*\"]', NULL, NULL, '2024-07-17 10:52:11', '2024-07-17 10:52:11'),
(558, 'App\\Models\\User', 28, 'app', '385e8573bd633023d0d37942c81b23d6773cc4c60f869478fe5e3560641606e0', '[\"*\"]', NULL, NULL, '2024-07-17 10:52:20', '2024-07-17 10:52:20'),
(559, 'App\\Models\\User', 28, 'app', '33a5415822d168337d8559c62021faaae14a14ee9c347fe93cba68e206f37541', '[\"*\"]', NULL, NULL, '2024-07-17 10:52:30', '2024-07-17 10:52:30'),
(560, 'App\\Models\\User', 28, 'app', 'da339b37c5c5ff7451730badbda51ad583683835c7de562502b5b6897f992205', '[\"*\"]', '2024-07-17 15:47:48', NULL, '2024-07-17 10:53:43', '2024-07-17 15:47:48'),
(561, 'App\\Models\\User', 110, 'app', '044ed9d94133f1545439c0488cc9adf531f40b48ee1030198f01980843fbbf98', '[\"*\"]', NULL, NULL, '2024-07-17 16:06:13', '2024-07-17 16:06:13'),
(562, 'App\\Models\\User', 110, 'app', '5de96453a0163e7c48344ef509f8f32d767a7bff8209888c4829fa07a7afab76', '[\"*\"]', NULL, NULL, '2024-07-17 16:06:28', '2024-07-17 16:06:28'),
(563, 'App\\Models\\User', 110, 'app', '295a38e1740bbdd060dcfc8d6da6452da5ee4b863cb68fde2a37547d7c124259', '[\"*\"]', NULL, NULL, '2024-07-17 16:15:52', '2024-07-17 16:15:52'),
(564, 'App\\Models\\User', 28, 'app', 'c825839956705c3db26f5ea89b9e46d96c0e9805195271d7c186ea9f7072d0fb', '[\"*\"]', NULL, NULL, '2024-07-17 16:17:35', '2024-07-17 16:17:35'),
(565, 'App\\Models\\User', 28, 'app', '714e7d29f84c36351818fd39f53e10f76a7eaf7125cf1edf18ff477cdf4e2eba', '[\"*\"]', '2024-07-17 16:36:19', NULL, '2024-07-17 16:17:53', '2024-07-17 16:36:19'),
(566, 'App\\Models\\User', 113, 'app', '793016833192ef31c2743fe32e5a37a608eb7d6afdb4bcfe904a61a029fdea71', '[\"*\"]', '2024-07-17 17:05:43', NULL, '2024-07-17 16:58:59', '2024-07-17 17:05:43'),
(567, 'App\\Models\\User', 114, 'app', 'd29009628a7b61ab98ca56ea3c1aeb2907f1f3d099a6cc4a2f650c62808e9c06', '[\"*\"]', '2024-07-17 20:03:10', NULL, '2024-07-17 17:11:36', '2024-07-17 20:03:10'),
(568, 'App\\Models\\User', 114, 'app', '973c21cd2d73e9e84a62048d717fa6b2d9e89f773e44ce262974a05dd9e6e7e1', '[\"*\"]', '2024-07-17 20:06:17', NULL, '2024-07-17 20:03:18', '2024-07-17 20:06:17'),
(569, 'App\\Models\\User', 62, 'app', '7cd80d3b9cbfa0d787fa10417266f47b36740b77e7b8e21a68a9787d67f0e12f', '[\"*\"]', '2024-07-17 20:06:31', NULL, '2024-07-17 20:06:23', '2024-07-17 20:06:31'),
(570, 'App\\Models\\User', 28, 'app', '827ead582befeaa62c92282657d29fb2132a76785c1eda6eaf21d77e05d6e6e5', '[\"*\"]', '2024-07-17 20:30:17', NULL, '2024-07-17 20:06:38', '2024-07-17 20:30:17'),
(571, 'App\\Models\\User', 62, 'app', '20316e1d5a34c36da13a7a7cb993ee12fd9d235a1b5c7dbaf359f42f9282991e', '[\"*\"]', '2024-07-18 02:58:57', NULL, '2024-07-17 20:30:31', '2024-07-18 02:58:57'),
(572, 'App\\Models\\User', 62, 'app', 'cb4ff0d2bb73b77a483aacd419d82bb72b3cb5e19fc59a901df6dbb37378da55', '[\"*\"]', NULL, NULL, '2024-07-17 20:30:32', '2024-07-17 20:30:32'),
(573, 'App\\Models\\User', 115, 'app', 'a26231c317ece5b5f2d4966ef7a628c2ed205423e6500d732d8e54b4e1b43abf', '[\"*\"]', NULL, NULL, '2024-07-18 02:59:41', '2024-07-18 02:59:41'),
(574, 'App\\Models\\User', 115, 'app', '08f6a56ede0f5ab7e240b846fc67219857695dcfd47208cc0801194f7476d723', '[\"*\"]', '2024-07-18 03:00:18', NULL, '2024-07-18 03:00:03', '2024-07-18 03:00:18'),
(575, 'App\\Models\\User', 116, 'app', 'c5b3f46a7d64629aa0e93880155e5a76d9803ac2886d1a760479f9663509cb8c', '[\"*\"]', NULL, NULL, '2024-07-18 03:01:25', '2024-07-18 03:01:25'),
(576, 'App\\Models\\User', 116, 'app', 'cbfad6f181420be119415ff663e8931cc4fcec844cec302bb71e257339495329', '[\"*\"]', '2024-07-18 03:03:19', NULL, '2024-07-18 03:01:51', '2024-07-18 03:03:19'),
(577, 'App\\Models\\User', 115, 'app', 'fb903d07a8e6dc20ddaa2b0a30b7275a0b64647c66c1fcdf4cfaf314d22a6f89', '[\"*\"]', '2024-07-18 03:29:47', NULL, '2024-07-18 03:29:41', '2024-07-18 03:29:47'),
(578, 'App\\Models\\User', 62, 'app', '89391ef2b1153e41d016bc8ec17b23481343099953da3053c7aa54b00f71546a', '[\"*\"]', '2024-07-18 04:29:06', NULL, '2024-07-18 03:29:53', '2024-07-18 04:29:06');

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `code` varchar(100) NOT NULL,
  `amount` varchar(20) NOT NULL,
  `action` varchar(200) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `name`, `code`, `amount`, `action`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Free', 'free', '0', 'free', 1, '2023-04-28 10:58:26', '0000-00-00 00:00:00'),
(2, 'Premium', 'premium', '35000', 'sponsored', 1, '2023-04-28 10:58:26', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `keypoint` text NOT NULL,
  `content` text NOT NULL,
  `photos` varchar(255) NOT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `user_id`, `keypoint`, `content`, `photos`, `views`, `created_at`, `updated_at`) VALUES
(1, 'CAR WORLD', 28, 'The first, as the name implies, will create an array of named routes pointing to the real Route instance', '<h3><strong class=\"ql-font-monospace\">For more information, kindly visit </strong><a href=\"https://www.autohub.ng\" rel=\"noopener noreferrer\" target=\"_blank\" class=\"ql-font-monospace\"><strong>AUTOHUB</strong></a></h3><p><br></p><p><span class=\"ql-size-large\">We hare here to give you the latest information about automobile.</span></p><p><br></p><p><strong style=\"color: rgb(36, 36, 36);\">In other words, adding the name and action in the Route instance before registering will allow Laravel to add them to the lookup tables immediately. Since the name and action will exist in the Route instance&nbsp;<em>before the registration occurs,&nbsp;</em>there is no need to invoke a lookup table refresh.</strong></p>', '1717214791-232480431202912-8882d2bfc3da4fecba1a9bb0f6203a18.jpg', 0, '2024-06-01 04:06:31', '2024-06-01 04:06:31'),
(2, 'What is Lorem Ipsum?', 28, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', '<h2><strong><u>Where does it come from?</u></strong></h2><p><br></p><p class=\"ql-align-justify\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance.</p><p><br></p>', '1717541421-890762208886379-cde6b41cc66c4b6fa1807e274e35a043.jpg', 0, '2024-06-04 22:50:21', '2024-06-04 22:50:21'),
(3, 'Greatness', 28, 'Greatness Greatness Greatness Greatness Greatness Greatness Greatness Greatness Greatness Greatness Greatness Greatness Greatness Greatness', '<p><strong>Hello</strong></p>', '1717821158-281618263167663-240af995210d4e37b85b91dcce531c27.jpg', 0, '2024-06-08 04:32:38', '2024-06-08 04:32:38');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `avatar` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT 'placard.png',
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_price` bigint(20) NOT NULL DEFAULT 0,
  `max_price` bigint(20) NOT NULL DEFAULT 0,
  `category_id` int(11) NOT NULL,
  `make_id` bigint(11) DEFAULT NULL,
  `model_id` bigint(11) DEFAULT NULL,
  `chasis_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transmission_id` bigint(20) NOT NULL,
  `trim` bigint(20) NOT NULL,
  `colour` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `door` int(11) NOT NULL DEFAULT 4,
  `seat` int(11) NOT NULL DEFAULT 4,
  `mileage` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fuel_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'petrol',
  `drive_train` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `engine_size` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cylinder` int(11) DEFAULT 1,
  `condition_id` varchar(100) DEFAULT NULL,
  `year_of_production` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_id` int(11) NOT NULL,
  `lga_id` int(11) NOT NULL DEFAULT 1,
  `plan_id` int(11) NOT NULL,
  `featured` int(11) NOT NULL DEFAULT 0,
  `exhautic` int(11) NOT NULL DEFAULT 0,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `draft` varchar(10) NOT NULL DEFAULT 'no',
  `views` int(11) NOT NULL DEFAULT 0,
  `watermark` varchar(100) NOT NULL DEFAULT 'the-logo.png',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `user_id`, `avatar`, `title`, `slug`, `description`, `price`, `min_price`, `max_price`, `category_id`, `make_id`, `model_id`, `chasis_no`, `transmission_id`, `trim`, `colour`, `door`, `seat`, `mileage`, `body_type`, `fuel_type`, `drive_train`, `engine_size`, `cylinder`, `condition_id`, `year_of_production`, `state_id`, `lga_id`, `plan_id`, `featured`, `exhautic`, `status`, `draft`, `views`, `watermark`, `created_at`, `updated_at`) VALUES
(71, 28, '2818039146046657fbee2780b.jpg', '1997 Green Audi 80', '6657fbee27bba', 'Strong, Durable and Reliable', '100000000', 0, 0, 4, 5, 51, 'GYAOLMNXDGE', 2, 3, '27', 4, 4, NULL, NULL, 'petrol', NULL, NULL, 1, '2', '1997', 3, 1, 1, 0, 0, 'active', 'no', 7, 'the-logo.png', '2024-05-30 04:09:18', '2024-07-17 12:16:32'),
(72, 28, '2816021201156658025b66a46.jpg', '1996 Charcoal Alfa Romeo 8C Competizione', '6658025b67618', 'Strong, Durable and Reliable', '450540000', 0, 0, 2, 2, 26, 'KASWCIKJ34098', 1, 1, '18', 4, 4, NULL, NULL, 'petrol', NULL, NULL, 1, '3', '1996', 2, 1, 1, 0, 0, 'active', 'no', 16, 'the-logo.png', '2024-05-30 04:36:43', '2024-07-17 12:16:29'),
(73, 28, '286746062276659027ac2dc4.jpg', '1997 27 Avanti Sedan', '6659027ac3029', 'Strong, Durable and Reliable', '100000000', 750000, 0, 4, 6, 82, 'GYAOLMNXDGE', 2, 3, '27', 4, 4, NULL, NULL, 'petrol', NULL, NULL, 1, '3', '1997', 6, 1, 1, 0, 0, 'active', 'no', 58, 'the-logo.png', '2024-05-30 22:49:30', '2024-07-17 12:16:22'),
(75, 28, '281369224617665947f07eeb8.jpg', '2000 Grey Acura MDX', '665947f08274e', 'Strong, Durable and Reliable', '650000000', 0, 0, 2, 1, 9, 'GYAOLMNXDGE', 4, 3, '3', 4, 4, NULL, NULL, 'petrol', NULL, NULL, 1, '1', '2000', 15, 1, 1, 0, 0, 'active', 'no', 193, 'the-logo.png', '2024-05-31 03:45:52', '2024-07-17 12:16:18'),
(77, 28, '281115466323665fed645795c.jpg', '2010  Toyota Corolla', '665fed645ad43', 'Supper clean and neat', '30000000', 0, 0, 1, 67, 1226, 'TKNBK5876266', 1, 1, '1', 4, 4, NULL, NULL, 'petrol', NULL, NULL, 1, '3', '2010', 25, 1, 1, 1, 0, 'active', 'no', 60, 'the-logo.png', '2024-06-05 04:45:24', '2024-07-17 12:16:07'),
(85, 28, '282718827556664df0c1099b.jpg', '2007 10 Chevrolet Chevette', '6664df0c10f3d', 'Great', '3580000000', 0, 0, 2, 11, 249, 'AQ134DXSAQ', 2, 2, '10', 4, 4, NULL, NULL, 'petrol', NULL, NULL, 1, '2', '2007', 2, 1, 1, 1, 0, 'active', 'yes', 12, 'the-logo.png', '2024-06-08 22:45:32', '2024-07-09 05:42:55'),
(87, 28, '286889151546664e0ec45bd0.jpg', '2005 6 Aston Martin Lagonda', '6664e0ec4679b', 'Interesting', '100000000', 0, 0, 4, 4, 40, 'GYAOLMNXDGE', 2, 2, '6', 4, 4, NULL, NULL, 'petrol', NULL, NULL, 1, '2', '2005', 8, 1, 1, 0, 0, 'active', 'yes', 0, 'the-logo.png', '2024-06-08 22:53:32', '2024-06-08 22:53:32'),
(93, 28, '2814718629176664e340725c8.jpg', '2008 1 AMC Spirit', '6664e3407292a', 'Machine', '650000000', 0, 0, 4, 3, 35, 'TKNBK58762', 3, 1, '1', 4, 4, NULL, NULL, 'petrol', NULL, NULL, 1, '2', '2008', 2, 1, 1, 0, 0, 'active', 'no', 31, 'the-logo.png', '2024-06-08 23:03:28', '2024-07-17 15:24:24'),
(97, 28, '2818729176516664eb1795909.jpg', '2001 10 Aston Martin Lagonda', '6664eb1795bfa', 'Speed', '3580000000', 0, 0, 2, 4, 40, 'TKNBK5876266', 2, 1, '10', 4, 4, NULL, NULL, 'petrol', NULL, NULL, 1, '1', '2001', 3, 1, 1, 0, 0, 'active', 'yes', 106, 'the-logo.png', '2024-06-08 23:36:55', '2024-07-03 23:53:41'),
(98, 28, '283782270606664f10d0b270.jpg', '1997 6 AMC Eagle', '6664f10d0b559', 'Speed', '550000000', 0, 0, 4, 3, 33, 'TKNBK5876266', 2, 2, '6', 4, 4, NULL, NULL, 'petrol', NULL, NULL, 1, '3', '1997', 4, 1, 1, 0, 0, 'active', 'yes', 4, 'the-logo.png', '2024-06-09 00:02:21', '2024-06-09 00:30:41'),
(100, 28, '28806182969666508024b3f3.jpg', '1998 15 My My My My mymy', '666508026c423', 'Fast And Furious', '30000000', 0, 0, 1, 73, 1315, 'TKNBK5876266', 1, 2, '15', 4, 4, NULL, NULL, 'petrol', NULL, NULL, 1, '1', '1998', 2, 1, 1, 0, 0, 'active', 'no', 208, 'the-logo.png', '2024-06-09 01:40:18', '2024-07-17 12:15:58'),
(102, 28, '281750354683666d23b513d3c.jpg', '2010 31 Acura ZDX', '666d23b51450d', 'Good, clean, everything in fantastic working condition.', '10000000', 0, 0, 1, 1, 23, '', 2, 2, '31', 4, 4, NULL, NULL, 'petrol', NULL, NULL, 1, '3', '2010', 25, 1, 1, 0, 0, 'active', 'no', 51, 'the-logo.png', '2024-06-15 05:16:37', '2024-07-18 02:55:21'),
(105, 28, '2862190725466871f9fee4f6.jpg', '2004 27 Acura RDX', '66871f9feeb47', 'Great Option', '2000000', 0, 0, 1, 1, 11, 'ODHFOER9374934ZQ', 1, 1, '27', 4, 4, NULL, NULL, 'petrol', NULL, NULL, 1, '2', '2004', 1, 1, 1, 1, 0, 'active', 'no', 42, 'the-logo.png', '2024-07-04 22:18:07', '2024-07-18 02:56:12'),
(106, 28, '28130448406566874eb518458.jpg', '2003 Green Alfa Romeo 8C Competizione', '66874eb518726', 'Great', '25200000', 0, 0, 2, 2, 26, 'JFUEYDJOJYGB', 1, 2, '27', 4, 4, NULL, NULL, 'petrol', NULL, NULL, 1, '2', '2003', 12, 1, 1, 0, 0, 'active', 'no', 337, 'the-logo.png', '2024-07-05 01:39:01', '2024-07-18 02:55:47'),
(107, 81, '63282179434668c881ae5c09.jpg', '2004 1 AMC Concord', '668c881ae65ea', 'In good condition', '45000000', 0, 0, 5, 3, 32, 'AUJEUR76432QAS', 2, 2, '1', 4, 4, NULL, NULL, 'petrol', NULL, NULL, 1, '2', '2004', 3, 1, 1, 0, 0, 'active', 'no', 30, 'the-logo.png', '2024-07-09 00:45:14', '2024-07-17 15:23:58'),
(108, 62, '62560561615668cb82bd00ca.jpg', '1996 10 AMC Encore', '668cb82bd0638', 'Great', '30000000', 0, 0, 2, 3, 34, 'AQ134DXSAQ', 1, 1, '10', 4, 4, NULL, NULL, 'petrol', NULL, NULL, 1, '1', '1996', 3, 1, 1, 0, 0, 'active', 'no', 30, 'the-logo.png', '2024-07-09 04:10:19', '2024-07-18 02:56:20'),
(110, 62, '626695891766982c9a2cb1c.jpg', '1998 Blue Alfa Romeo 8C Competizione', '66982c9a2d327', '<p>Durable</p><p><br></p><p>Strong</p><p><br></p><ol><li>Fast</li><li><br></li><li>Great</li></ol><p><br></p><p><strong class=\"ql-size-huge\">Blue</strong></p>', '45000600', 0, 0, 3, 2, 26, 'AQ134DXSAQKA99', 3, 1, '2', 4, 4, NULL, NULL, 'petrol', NULL, NULL, 1, '2', '1998', 2, 1, 1, 0, 0, 'active', 'no', 18, 'the-logo.png', '2024-07-17 20:42:02', '2024-07-18 03:31:35'),
(111, 62, '6269556409266982d20d7e56.jpg', '2001 Crimson Aston Martin V12 Vantage', '66982d20d89f2', 'In Good Condition', '95000600', 0, 0, 5, 4, 42, 'AQ134DXSAQKA99', 2, 2, '20', 4, 4, NULL, NULL, 'petrol', NULL, NULL, 1, '2', '2001', 5, 1, 1, 0, 0, 'active', 'no', 1, 'the-logo.png', '2024-07-17 20:44:16', '2024-07-18 02:55:36'),
(112, 62, '62172631167166982e7a3f15a.jpg', '2007 Lime Aston Martin Vanquish', '66982e7a40495', 'Good', '45000600', 0, 0, 3, 4, 44, 'AQ134DXSBBB', 4, 2, '8', 4, 4, NULL, NULL, 'petrol', NULL, NULL, 1, '1', '2007', 4, 1, 1, 0, 0, 'active', 'no', 0, 'the-logo.png', '2024-07-17 20:50:02', '2024-07-17 20:50:18'),
(113, 62, '623877337896698327bf393d.jpg', '2024 2 Bentley Brooklands', '6698327c00a8b', 'Great', '45000600', 0, 0, 4, 7, 86, 'AQ134DXSBBB', 2, 1, '2', 4, 4, NULL, NULL, 'petrol', NULL, NULL, 1, '3', '2024', 9, 1, 1, 0, 0, 'active', 'no', 2, 'the-logo.png', '2024-07-17 21:07:08', '2024-07-18 03:26:24'),
(114, 62, '6218726315536698332a308a1.jpg', '2004 Biege BMW  - 325e', '6698332a31579', 'Great', '90000000', 0, 0, 2, 8, 108, 'AQ134DXSAQKA44', 1, 1, '5', 4, 4, NULL, NULL, 'petrol', NULL, NULL, 1, '1', '2004', 3, 1, 1, 0, 0, 'active', 'no', 5, 'the-logo.png', '2024-07-17 21:10:02', '2024-07-18 03:29:59');

-- --------------------------------------------------------

--
-- Table structure for table `qualifications`
--

CREATE TABLE `qualifications` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `qualifications`
--

INSERT INTO `qualifications` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Bachelor\'s Degree', 1, '2023-05-05 13:28:31', '2023-05-05 13:28:31'),
(2, 'National Diploma', 1, '2023-05-05 13:28:31', '2023-05-05 13:28:31'),
(3, 'Master\'s Degree', 1, '2023-05-05 13:28:31', '2023-05-05 13:28:31'),
(4, 'Higher National Diploma', 1, '2023-05-05 13:28:31', '2023-05-05 13:28:31'),
(5, 'No degree at the moment', 1, '2023-05-05 13:28:31', '2023-05-05 13:28:31');

-- --------------------------------------------------------

--
-- Table structure for table `running`
--

CREATE TABLE `running` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_type`
--

CREATE TABLE `sales_type` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales_type`
--

INSERT INTO `sales_type` (`id`, `name`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'DISTRESSED SALE', 'Please note that any vehicle submitted under DISTRESSED SALE must at least be offered at a discounted rate of 10% from the regular price in the open market so as to encourage swift sales.\r\nOur sales c', 1, '2023-02-28 14:00:55', '2023-02-28 14:01:06'),
(2, 'REGULAR SALE', 'A vehicle under REGULAR SALES is to be offered at a price comparative to the price in the open market.\r\nOur sales capacity under Regular Sales is a maximum of TWO WEEKS for Nigerian Used Vehicles and ', 1, '2023-02-28 14:00:55', '2023-02-28 14:01:09');

-- --------------------------------------------------------

--
-- Table structure for table `sells`
--

CREATE TABLE `sells` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL,
  `condition_id` int(11) NOT NULL,
  `colour_id` int(11) NOT NULL,
  `chasis_number` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fault` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` int(11) NOT NULL DEFAULT 1,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `leave_vehicle_time` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sale_type` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sells`
--

INSERT INTO `sells` (`id`, `user_id`, `brand_id`, `model_id`, `condition_id`, `colour_id`, `chasis_number`, `name`, `fault`, `rate`, `description`, `price`, `leave_vehicle_time`, `sale_type`, `images`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 4, 4, 2, 1, 'ftybvvbhj', 'Samji', 'no', 3, 'the vehicle is cool for ladies', '6500', 'the vehicle is cool for ladies', 'DISTRESSED SALE', '[\"https:\\/\\/storage.autohub.ng\\/public\\/sell\\/3889545856456d6a5471aa.jpg\",\"https:\\/\\/storage.autohub.ng\\/public\\/sell\\/3889545856456d6a843f29.jpg\",\"https:\\/\\/storage.autohub.ng\\/public\\/sell\\/3889545856456d6a875bb6.jpg\"]', 0, '2023-05-06 17:37:28', '2023-05-06 17:37:28'),
(2, 3, 3, 2, 1, 2, 'ffgggvy', 'Samiji', 'no', 3, 'good good good', '5000', 'good good good', 'DISTRESSED SALE', '[\"https:\\/\\/storage.autohub.ng\\/public\\/sell\\/318497456156456d73eacf50.jpg\",\"https:\\/\\/storage.autohub.ng\\/public\\/sell\\/318497456156456d73f1f1ed.jpg\",\"https:\\/\\/storage.autohub.ng\\/public\\/sell\\/318497456156456d73f6586c.jpg\"]', 0, '2023-05-06 17:39:59', '2023-05-06 17:39:59'),
(3, 3, 2, 1, 2, 1, '4444444', 'samji sam', 'no', 4, 'good gooda', 'samji', 'good gooda', 'DISTRESSED SALE', '[\"https:\\/\\/storage.autohub.ng\\/public\\/sell\\/320013342376456d7cc2376e.jpg\",\"https:\\/\\/storage.autohub.ng\\/public\\/sell\\/320013342376456d7cc8f1d9.jpg\"]', 0, '2023-05-06 17:42:20', '2023-05-06 17:42:20'),
(4, 20, 8, 15, 2, 1, '4997yjr57999556', 'jjjjjk', 'no', 5, 'have no fault', 'jsu jay', 'have no fault', 'DISTRESSED SALE', '[\"https:\\/\\/storage.autohub.ng\\/public\\/sell\\/2036346853646ea193c1788.jpg\",\"https:\\/\\/storage.autohub.ng\\/public\\/sell\\/2036346853646ea194e756a.jpg\"]', 0, '2023-05-24 18:45:25', '2023-05-24 18:45:25'),
(5, 24, 1, 1, 1, 1, '7277247281412', 'Samuel Samji', 'The leg is shaking', 5, 'The vehicle is cool and awesome, fast and furious', '2000', '20', 'DISTRESSED SALE', '[\"https:\\/\\/storage.autohub.ng\\/public\\/sell\\/241571973277652fb912d4831.jpg\",\"https:\\/\\/storage.autohub.ng\\/public\\/sell\\/241571973277652fb912e5f12.jpg\"]', 0, '2023-10-18 09:53:06', '2023-10-18 09:53:06'),
(6, 24, 2, 2, 1, 1, 'anything', 'me', 'no', 2, 'description', '3000000', 'description', 'REGULAR SALE', '[\"https:\\/\\/storage.autohub.ng\\/public\\/sell\\/24747715509652ff3cdc0720.jpg\"]', 0, '2023-10-18 14:03:42', '2023-10-18 14:03:42'),
(7, 24, 1, 1, 1, 1, '7277247281412', 'Samuel Samji', 'The leg is shaking', 5, 'The vehicle is cool and awesome, fast and furious', '2000', '20', 'DISTRESSED SALE', '[\"https:\\/\\/storage.autohub.ng\\/public\\/sell\\/2472999487655dd5b520274.jpg\",\"https:\\/\\/storage.autohub.ng\\/public\\/sell\\/2472999487655dd5b5b12fc.jpg\"]', 0, '2023-11-22 10:19:33', '2023-11-22 10:19:33');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `code` varchar(200) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `code`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Mechanic', 'Mechanic', 1, '2023-05-05 12:49:05', '2023-05-05 12:49:05'),
(2, 'Electrician', 'Electrician', 1, '2023-05-05 12:49:05', '2023-05-05 12:49:05'),
(3, 'Body Builder', 'Body Builder', 1, '2023-05-05 12:49:05', '2023-05-05 12:49:05'),
(4, 'Painter', 'Painter', 1, '2023-05-05 13:10:47', '2023-05-05 13:10:47'),
(5, 'Upholsterer', 'Upholsterer', 1, '2023-05-05 13:10:47', '2023-05-05 13:10:47'),
(6, 'Battery Charger', 'Battery Charger', 1, '2023-05-05 13:10:47', '2023-05-05 13:10:47'),
(7, 'Vulganiser', 'Vulganiser', 1, '2023-05-05 13:10:47', '2023-05-05 13:10:47'),
(8, 'Towing operator', 'Towing operator', 1, '2023-05-05 13:10:47', '2023-05-05 13:10:47'),
(9, 'Accessories Installer', 'Accessories Installer', 1, '2023-05-05 13:10:47', '2023-05-05 13:10:47');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('09AcxevEY1qKq4deJLYRaGZNDRVnCPSDx2uRAmUM', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMkV2T1d6S1hYUkxaemVxTHlRRGg5d3BvdTczQkh2UTZtbzZ5cXFOSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721246785),
('0pKyq46M3yybeUZAQDJY5KFCqtoMnrAT4v6tl2Kv', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS2lEbHQxMWJ3UWRlc0J2R1BHd3d2bnpVMzBKNk01aDQydjViaFAwVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721273394),
('0tAB2GFnAUWZKbDqGMmmFJAXKfWCqXHGEdA2ZY6m', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiemJyOVJ3b2dCRDdydnJMNXpUUmhHVDdMVUlZSlp1emQxWlI5TU1IaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721227884),
('0Z3s5Xh425CsfXksdtrvawoQZK7yPoByJ6sd03RB', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ1VJNWtDQWt3cHM0bk8ydGRYcjkzdnBXMkROb2V4UkI0VEpqN216biI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721247132),
('28ncR8s3FifPU9Y2r1zdWGTgDjPje2OwpEs66roj', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ0dBU2xkeFdEaEtqeWwxS1dtQlU4bEZid0V5aGQ5OWRJOGJBeWZBeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721227769),
('2PYgkMZqyiDVKfbRrIP92Tu6M1fgrkLcxiGKvt3b', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTVgyVmpNM1Y4aVRXNElVdzJNYnV0UnpkWUZmQUd3NXpTd0k0ZzE0NyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721271713),
('3IICHovngjwqZ4qa1VoNKErLOiBE0dDy9xnGsB8E', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaHA2b0ViTzB2VE5UdHVZMWpXYWd5eU5LcDVEbUloR0ZjZkdBcVFlQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721250020),
('3N4WlDvUVSWPx9tyhPtbeHMKAscC843xOxQzYEOx', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieDdrZVI5MGdzMUs3dVU1MjZrRnlQOGVnMnp0bGpTV3FEaDdSV3VvOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721228163),
('3YcVgGUNm9kKiSUdKxfSmKDvDQjLqlqxtGIL6vz2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiejdaWnI1YUlOcGpnYlhpM2VSM3J1R0NzbFlha2gwZ09RcVNVMktaYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721273495),
('4ikreMvuhMLqDEU2lecBTaRy9NtKMPv3Fgzgrh5L', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRDczU2Yyamk3Z3RDNE1KTGNLQ2UxcEFyRGV2OVNJWGw2c2JDckk5ciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721266877),
('4pgi1nXJmuYGJSG5MGLPHrWZfTsT7Px9FXdgjv4i', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia0dlSVVZRnFVQ25KOWNJbDI4alBoQUhVaHEzcmVRWjN2T0dqelR4UCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721268502),
('4QqT0lgF7uwoHxFfYVZsB9nMYptf37GSox4Zc1Y1', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRWdBRG4wWXpIZTBHYUJrb2VoS250cWsyeWE1SmU0cE1zeTZXYkQ0dyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721273382),
('6lRgia12UwOGxwtDiGlQTVABijHjDErtoflZj7QZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSXdNUVFrb0R2VnQzdDE1bHV6NUR3UEVraHgzb3V6MGZmVWhmSkJuZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721271144),
('6NgpIeFQCqC5LYQ4qWTDDkJPHZ6Lc6qaBud61Mrf', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTXZ3bzMwTmRMbFBLSnRTb2V4MTFXSW1Sbk1YTEhyczR2VkF3b3hTRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721225162),
('6zF1RZ2fYrBLLkEzJyMpIU2HGj6Z1Zkf20H3VlkU', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTGVQd1JRVkxkcm8xWWF2UWl1dzVld0pBbUlidDhnWWRSU3NZb0EzVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721246830),
('73JjQxClcbuKzjRDMW2OR2fTLSXZDSPrrjimGCV1', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSzZaTGZaY0o0Mk1NNDRMd3hld28zWnBraVFnaWVDRjBQWkpKOHZ6NCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721246955),
('76C1E10bUj0e3zgQIANHOgMklMK6RXj3b3Z1SZlL', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUzFkTWRYZnFIeVUzR2hiMGNyRjlFV1BEUG9Yc0J4UDV2amxJVTZWWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721246228),
('78KvjyC0lXG23YZhgeAQRTVTmtGtbb2OVarUWsfO', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieXNUdHJHWGI5eU9vTUtQMG5UeGY2ckIyalRkdVZ6THpxQTdvWWVJdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721220836),
('7djZxmHZAO57y5JDO7Eyw0wDkWE5mLH7sV0QC1q9', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYlNReWFjeGtsR3JTYkNzbm1iNUdNa0x0VHVQclltSWVxNmg3RUJyOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721227789),
('7h7dx9BENqdDez4mC62pmKxDj7wpddDQa3zaAPGv', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaE9Ta21FTVVQZVlZMktMd0xlUTh2dVoyb01naTR1ZHA4T1g4M0hIRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721271374),
('84sIov9uh6s94MQO4Qo4kzRJiCMBt5jSFz9xEkwv', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOERrMUxRb0RQeHBwVzVhanpUeGhrUDlFeHhkZWNQZDVUVjBzWHN5eSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdHJ1ZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1721236319),
('8WDkZcISkPW3TghWhvgEXwkN0p5YMxP3eD30tbQV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQzdzSGhFdlB5NllxcTBMTDFucnFBS01OeWQwM2ZQWjVjUDVLc3JQWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721228103),
('9CwyhORldCOs3RFZYreLvJGzndenEX1SdhhHlwDR', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieDIzWFR2dDM2dWUzRUlqZ1podmxiTU5sTmZ0SDdHa0FzMjZLZjhPTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721249468),
('9Non7W5yqTFbYWDZxiDOUXLGJzDUFMjZNA9q6Bsc', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaFp5ZGlOU3h3UXpoZGRmekJqZWxPWXhpb2phWUhrNU5nbk1JS3pTVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721235543),
('9OIAirjH9OVeXp4151LHuSuwAa8zc8gX1fukaFgR', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicDM4OERPWDAxU2FqMlE0dFJUemVvMDBLeFRLcDJuUVJVWTJheGxGcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721228110),
('9tNbkHJAZc9NqIujORUcUOJQC4qfPYY6Ct11WYbo', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNktYc04zc3RzNEQ5RGhIbFhyTm9aeTYydWZEYjkxQUdyTjNHdmxhSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721227911),
('9YXUFBigLCm63CBuZAysj3vDBNKSmfR7MIOTBXwn', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibDF4cmtCcXRXQVZKWmgxbTNEem5PbnRqSVh0RExhYkMzQ05RS1pSciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721249818),
('A2tzAdHUSvCW3NYhWDPckF5KRfP7aKwKTLB5eP8Y', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoianlxWXJNbzBhcDZaWGFmM3c3V0M2cEsyeVRqTldNTWgwSXVVRlhDYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721249717),
('A8LVi2gVb25UbSC2tsUpHkG5Mo0eQZkTgficV0zi', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVm1YZG50V2JSUmxWME1yelJ6dGFwb0JSSmRxTGE0RWtmR2t2WVp4QyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721224675),
('abdn7hvlXKNvGYZwmuFCqFh2yf09oyXIZL7qdu7j', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWDJEbTlaWlEyZTVFQnh4S01aenFTU2NyM0dycGZTc2NyZGlmSmwyZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721227761),
('AD1nCR7Fc8GdMZvIcFLP4ENzv7d8L3i3jElwka6r', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTTFJQXg3dkVPR1ByTHJXS2lsakFWdWZYdUpqM3RHZTJpeUNQZE9KUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721248429),
('amz7AYe2eaGh9xwhXVMGtEnAlnzsRVVDXtnaGPoY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN3liV3hVQ3BZa09jdlNHd2VNR1ZEbUNSTk1VbUhQblZXQ2s5Ulg2MiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721269739),
('aZCSrOUuKVvsG5Z219NTOkRUOeHzaGXehIi8dy7q', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTFNOQ2VhamhoeGJ4NzR0dENDVzVEa0M0TTdkRDQ4OFk2T0pBa2diYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721249626),
('b8ZxGTZLl55AhPpbT1ulWWuyjVFXzmBW3wwCE7P6', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQWlMQ1dCRVYyVjR5SE9Cd2Z4cFlVRVBYR1QwM3dEbzByWUp1M3pTWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721269880),
('BMmkTwGHCePIoEembSiymtniTFyzE6SIVOHNCWxO', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieTRUVEM1N1lrV0IwaTJyc05VT21sblk5RHcxcVNGSmFKQm5kVURpViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721268343),
('c93bBtYHsi7D6X0YiLtg0B7gX2EOad2NCBgvfc7T', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUXhtWnFXZXR0VUdvMWNKaU1oN2l4cVVRQ3FXTXVmOXdleUVKaTJ6cSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721250664),
('C94oHmmm8W9zIrho1sZtOMx1V8YnNlmLGVjj32ps', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQlhoWGxRcHBFOXFsclQyRzFqVVRyd2VoQkdEZDZPVkM5eUdLOXdjRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721268532),
('cbROlAzzeY6CGVVhPzslEhKifvEXSFLFQ0tHsXH9', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRjNHRHl5bUpkYXIwZDFkcjFZOFpEaUFoNmJaQnQxUUZ3dXNzTDlSVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721228152),
('ce1XefmNQnspz1e4rKJwjox5PcILnva25wXzs0BP', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieDFzOVgwYTFmMUl4VGw0eFhKdVdBbVNGdlBYSlBhMG9Vd0IxekRXWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721220666),
('Ch3vSwz3RDDEWXISOnBiv3VIkz3vuRGSaLRUnraH', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicTV1V08xb1cyZUpCT01Qdm1nNE9wOEJteUsxOFRSZ3ZNamplSDZYNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721269738),
('chdfklJcotC9MkTs0g1SnPYO48Tf8eOhnF3UPF0q', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMndhSlVrRVRKTjFQTDM5SEpyalE1MkFmVGRiQ1FneXpoOHVpMDJURyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721220664),
('crDi0s2oYcs183sPa5nq2cAg5vggI1fVaBEpqwzX', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib1o4R1lDdlVuQ3ExMmZ3VkhkQWdNMklMSWR4SWV0MTFzVXV2ODM1SCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721267350),
('d1F9qLqQGmpNeDfbJhoDXMfQRK6ydKfwcujDVtPN', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVThpbUJ3V290ODFWVlplV2tYMVVMSmgwbXFIR2NPME9BYXo5RTBkOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721222653),
('DO2c3DuQ3NL3zjQR5RV3Amg4N5ciPoAH9peAz9gZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR1U4bmlFRUVGVEc3QkRLbTAwak5jaDE4cGV0UWU5c0Y4a29IZnYycCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721225004),
('DozrxYfyunEpdmmq6jLSkYJodFCCq1jAOYpg9XOO', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMVVYR2YzWnoyaDdlN0s3M0V1bDRzOEZVZUg2aVVhM1JjRTczTnZaYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721270436),
('Dz9YIAs4l63h7M8KzijrmFhG4jxHjagssufhtIR1', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYTY0Y0I4WnZqNTdzalRuZ01uNnU0TGVoTG43YURYNVN2OFpvODVydiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721273517),
('e7HW0ryeO8cVGjkLOnAmXhZIsFnTCarFV7S4A6A0', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia0dhY2tWb0JMcURhakR1RWhWT3JzTm9hWTFXNU9DVkVlZGZGYVRObCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721229767),
('Ee8CtdBCfcMh3DTRRl3Ntm5HrQB8eGeKY35KN8C8', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNXlhczR4S2c0SXVoakN3WWswYzhUQVNQbDJHakpwOG9QN2tNR08zUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721227822),
('eqqZTRvCNmyjf0xgUa6fAhdJaM9pDB3dpSXzDv23', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSHNnTk10dGxsUUJQZVVaT29tSExjQmEwUGdXYmhwY01jVXB0b2JqdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721227852),
('EvCaeoxzjdzc1ZSUKs39zH3K9NSgnNQpY3mSDX6V', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNEdyNU8xYVJNTnBWVmdjZGtRZjRrRkVwbThGY1BqeDVRZVd4a3F6diI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721269810),
('fbFX7sXBI8uLLY08UfdS5hdVuAr18N63La2BqBIp', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUmpUdU1obWh1Tm9ORVQxVkF6V2NFV0RvbE5xNGlobk93dnVSYUVIcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721246246),
('FFsd8aY23Sh10rJ12aK8l163195k6zv1TMgXkpKk', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZmt5b1NNbHhlOEkzZVdTWm1LYXFWTkpvYjdZOGY0UG1zb3k4NWxvbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721268183),
('FkeuXxtTHXd4FkwIoIHr82FrAjDZj4y4C0Q1YTRl', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMFZkTndtbmNLS00yS1FDU3NJeTlVVHdsUVhIdFJDTnRIQWRJcXdZdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721229744),
('FQjOJXIlL63cCZmeDUgVNzv2gEGyi0s5PJwLDxVh', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieTUxaVRPbkVMQlJTUUE3UkRNVnRoUk9pa0NLZnpneUZHS3dCZ1VoayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721247126),
('g5pKHs31FSv0hqHw423nDjpsgDXuzDerAVh8nV8w', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVUFEOUVzeTJJSWNmd3lyNjZNQU1CR3NkQzdQbDVWMEJocDlKWDBycyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721228150),
('Gbnts7dXtbgT69eiuWtt6l6iVTO1DKuBuB6zJJKN', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYlRERm5OQ1NOMzZjVVlFMHh2SlUxekdaa2Yzck9MYzBVZ3REaDFTZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721247267),
('gLoN2FjpMrqTtbKQJ5BT7n9antrLoXnAJS6RgYIP', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSUpNWTdxWjNhbHBNYmVrY1BLaDZWUThMQ3VlMDJCaUZ6Q0hKMHRZRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721273472),
('Hh887YIELYpfevaupLdpAocS1ozcF5cMQOQqruPw', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQnlrMXVTS3NWZnpGMnplaVFDQWJScTJFaGEwNFNuZGpYVlFiYnQwSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721271120),
('HhHQ92C9SWNKRA7dMHOAfFcmTg7bYF8nzRvNyX9C', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMTJhdFVVRkFraG96WERLSzV2RHVJWVhZNW1tQ0NEZXdpbVcwTTRIVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721229771),
('hQ7wiu8b91iyE7EzYmhC0cvL3hDVl2oUfJaf9Lkr', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQzBkUzFwWXkzcFBpUnhMbGFxVEVYUmtrME45UmxkR2NZd1NRVzg3USI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721227959),
('Hu77va5IIFf2AVJpICJKLAS1hDRBWux1mIbHpUaH', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicGtmR1d2STZjTWg0dUhKRVp4QkdkTkFoV01zaEFoZXduMGNlQmtxayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721228127),
('hxiLxe5AmNNoxJuKiPp3WhnDAjuZTb3IFxRbwTQf', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSFFtUk84cVJMZ2UzblpXd1F3NzJSc0dpdkxOU1pKZ0F4Q1FPZmpJNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721235558),
('hZxmfx3oymkobrsT28lHcg64TZElLU4ILbrdafef', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTjZiblhmUnd6SDBXOUVtZDR6ajR2S2FOdzZRSDh6WFM4aG5UYlNzOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721267419),
('iHnlI6JkbJGy2CQbLYPlmisWD03sfS9YR8NSN7dT', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibFlWUE1jeTVlWDcyZmpkYzdDUGNDRHFPWVNDODNXZ3NRRTNtSUpHTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721227782),
('irlFH6HW7iKeh1ArZTDGlbAOdRX1KldlXTsLPabL', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiblA1c3gyZVcyUmhkRFY0ajhLOWxwWks1dkN6UGVENm5rYTEwTW9HZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721248233),
('IvUwPjnawZI3orpPtYmYIBxHkrdib8nlr9lEKIdA', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieEVZN3NYa2NhdXlLaGlTU0cwZlpKQThpWTlFTWdXaERmTDBxYzJuNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721268395),
('jHejc957tsDUlpKmrpkNaa7mxjrdJbT8Inpxf0k1', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSnZINVpGSHgyMHVmZVUzWHlHVk9McjJwaTNRenBpMUMzZGpYQnA5RSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721269765),
('jOkumhYb2TcXCQUgadcpAuAxFlyadXCloxNcQOVB', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSE0wVzA3ZHo0OXg2NHNSMEQ0VGdyaVJ0dlljTkt2Z3lhR1NvNmZZayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721246034),
('Ju4ZgyxyH2LMqHWpiei3PZtXYMVYTh4NwqUUHgfR', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUFZ3a2ZjTDhiT3d4akdnMTFJMmpMNWZjVDFUOXY4QVJOUDU3eDFhciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721228101),
('JuBq4uDaQ9Ei2ncicwIpoqZ8WkiCsi2w82BZeAUd', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaXduMWJYUktLbzFHbHhaQWdhNmgyc3JMenh1TkZlRDB1dWJndTJ1TCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721220919),
('kjjLpZB2Pc8gjFmGZAzxNxRrL2uaORdbWGAWc81A', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYWZTd004ZmZ6MkVaZ2k5b1lobVdySGNRS1VNd2RXUjRTRTBPRW5WeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721268159),
('kNLyPXBkm90Zt4mKHkQtsrM0uzfKrMaBPtMqx64o', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUGNFSmc3bXNoalpYUDJrUGN4c2RYdHBxRG1VWUdSZGMwT0lMcFRGTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721225003),
('kOliLUid119OjgMK8Hfz0yozlJGPqQiUwcASNCgJ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidmQwaGNCV1hDWUh0QXZaaDBpRnhEdDVFa052b2V6NjViYzNjUWNQZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721267047),
('KZfEenSRQmL65DxauthdKIu6oDUOHWCrSyvIwbmx', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWGJCOE9GRnU5YW5CUFphNHFURkZ6ekQyWlN0YWU0QVpCMEZCa1RuVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721221454),
('LC3fMidLd5eDWxhS6izBKXHBLA1X6iSCTcypAHqg', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid09SMUpuRkNoVTd1YVJydVBQam1BblM4N3N1RUZTa1pPcE14VTFnUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721246769),
('LKTg7wb6pshy5oK28EMA0nigfzLRnMtSItIngUmY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT1pRTzQ1OGkyYkVEb0FIZkRITUk5Q0FBS3VRQmdaaG16SWx4dzIyRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721227864),
('LubJUCA6mcp07cEhFtjZCQPHcB5nxPdhdKGM11fY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNGJqME4wZE5ibUtDSTFNUk9QOEtMaEJJVFQ0U2VNakJaUmo0TTRXdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721267193),
('Mi86dYrMRkrOlLvBwUrMiEv4lIEnJKeF7fgoa4xC', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidmY1d3pvMWdMNEc3MnA5bVNnQ21Ydzh2RzNlNnVQRE9kSXphUjdsayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721230955),
('mWAMwbLNPHVqDYMWVZII83HyW7k7dEh0KZh7O2UD', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTWVuYk5IbXU0Sll2cnV3VXR2TzA4WUhKbmRkV0NpOHltTTNyeHJOaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721234178),
('N3N5piAEtxGhcKmRQXMiluERhXR9k3w98BN1TxOV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib3hLSGx1VkhSbDBJdUV4OG40dGZDOVE2Y0JUbVppN2pyc3RyWUJBayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721248245),
('N4cyd2IUPcTDHUnz6DtEo8mfTjUdt95JYYtOrCoJ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib29kN2xWZnhiOWp4cGFtQjVIUFNRZVp1cXhidXFpdXIwTjZxMUdlSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721266975),
('N9VgYvQXgnj5xdPCZh3ec4MEVQSPDoJcBbxPJPt7', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNUs3WUVtYWxKeWFyVHFwMlQ2M0R5anJ3eTc1SFJvQkIzSGJhUUcwWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721266711),
('NbIwdf1j2V4NWENuRuaPOs3ANkkdd3DgM0UB9Xws', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVTR2dThRdm1ZUkFpVmlpR0hweEE5ck5JZ3VlejFBSDJwQW56akpSeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721269777),
('NBzxGUSFFXyLwiifzNgstytyzMzbqALozwsThibN', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicjI5eFZxNnpaT1NhRGpSdEZtUzQ1OU0xczJmS2ZaOHVRVHhlR21zOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721220733),
('no8HPZU6hKtPYGdLk4MTfvemLR7YICSKmewYcyXN', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQXNIb0d3MTU0MXNubHM1dVJteHdIMmQ4T2tDTTQyc2NUb0gxQTZRUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721248543),
('NOVc6s72UAmfAUA0eocDYu0bCEFX9ttTvy0sasq2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU1VxWlZzU1F2bW5EU3M4emRGcktzdzQydzRxR0xoZmdWbnIwY2JpUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721222610),
('NXevhnkSUxv2itJuTjqd17ijQIGAebDDCWb9qQ4g', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicGZqV3ZrY3pMck5XcVRHWW1JNTYwdFg4WVZublJSelNmRFE3c053YyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721224278),
('OofOYSN68AajpwoGV7SLXs7fWFC4RZFjI74scOqY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibXduT2x5d3ZZWDY0VU9zSnhVRXlHSkNCcjNMSmpZcnQ2dFowTGU1QSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721228133),
('OOZbp0IhkeZ8mCKZ2VMs3mUiMVctNdeyCbKG8yZr', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieDhMM293TjNNYXBnQ3RKTUY2Vk9zQ2REaUZPWDZ3aHJORTluWnlIciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721268134),
('p2y9NYYeu9PVrCqMGqv32eM40dJmDWIAIIAj23lI', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU3lOZUhVZUxoVmJEbDJxN1dVRUs0blJWRjNOS2ttOTdDekFNcEtXbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721270308),
('pi365K0KuvnLiG1IsBqP495vpPjhX7nKHvz6T4BT', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRmFHaUhwMlFvTE5lZnpRTjJ6a1RTVUt2ZEh1ajNiSkJMc2t1V3R1ciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721231180),
('piECU2fcOZvDZzM4m2hrI9zZxCwEUcDMP3IUKHL6', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidFB2MUh4N1JBeElPbWtYeDlvczRabmd2MHZxNVE2enpEd3YzMzlpYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721270877),
('pzXrlD3KT2WwKRhYIwSuqjFDvCbVoiZRjgBIrvzu', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidFdwdzJhWTZRdWJHb1NiUWlnMVVPMlJ5R3NQcnAzMzdtblI0S2d4eCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721271604),
('Q73HkslCBen6u9qi0l9noaMslkQUyuLW3YHKmy53', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWDNlYzZCekRJU2hJWHV2aHZ3T1g5Ym9oTWthWFNKaUxRVUp5cGs2bSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721224906),
('qaiZsdZ3eiIi4WDRZWTgpkyovGiCRFQm1cbzmtwN', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUVpINGN4cldMd000dUV6MEJaYmkzeWFuT2JKNzMxZHNmRnNJejM2YSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721267394),
('QCZSKF6eD3dWkqWzvWa9U5c7j0P3HYQJLaO4XKOL', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoianJUOWZ3T21xZkxGSjB4VDFCTGxjQ0Z1YTExbHJlSFZYM1ViTzRCSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721221006),
('qEcgQFmvy7OsnLLMLOiOsEVVNv1f3Ff0nyJrwTu4', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVmt5UzB1cnJNYk9JTTQ3Y1ZmdjBHVWdOa0lQOEJQb243c3VVQ0VkOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721269882),
('QLW6MYREWQrT9x4bJRtClUrizUatbhcCkFc2T2tn', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSkMxeTRnMEZuNWwwUmVrN2k0Zmc3UWZDZnRpQ2syMUtSY3NkdHJ4RyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721227845),
('Qm22UCwUf8ncitkRqtjIlI2p7rARhuWjXytVUtEs', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZXRuaTk2WWpjQU1UalNEQ3ZjcllHUHU5dzVQV2M3TTVMRlYzOEJDRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721246583),
('qw3IknxSMARIciCHyy9JfQcxiJB6wG888gujajm0', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRG5BbksyY1RxZXlFMGdTZEFoUnh4d3M3clJXUXV1NXNNaFBQY21xNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721249837),
('R3KtwKoW9E9j8JLCyewAOUu47S9ZPLaHJ3F2w56j', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVkh0RTNybDJvYlMzbFN5YVd0Q0F3N2JnTU9tbllLTG56UHBMbWxkdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721246599),
('re3X2M7P2fqMaEhZvVNrU2NrsTUKXT8jRokALIo8', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSE9aMEk1YXBVQzJ0bmNtMGhPVW00U2I1R1RWRDZhVlVFaEV0Z3dmUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721246903),
('RUszr6HTK7CKDbPFtGZkcBYDXKICT9Y1Go1ljtAC', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidjRYM1Z0ZFpoM1p2VHNpdjBHNGdUNVNVVjV3OW1UdWtkbWxPQnU2TiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721268392),
('rwS3DUBKBKESBxz9vyvaEOAdCJ1eXGWtyPYaf2m2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicFBLU0NqYXBLd3hRdkpoTDlzMUd4eEpTaUQ1R29ocm9qUXNhdlVxTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721246800),
('s3tA76oBOK9shGhgHz8uzmHkSIU1dxSNJLKJUJz1', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaWx2VU8wMWE1c01CUVVmQjlkN0ZnZmVKZHVRSTU1dER1MVJCTWNPTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721229765),
('S9T1oISAfmiQfeL9lQ4TWRmgSWEClNfe5EEGAKaj', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZTRyNFRlNHRRNHBaNzM5cUVPQ2ZjSjhLV0RwaldZWHlrcHZBcGFZUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721224874),
('saR84rHUuRaVOI1OeL07HfKF0EtWpgGQR6GoC6MH', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTE03cmJTQnp5RVU3SE50SVZjTkw1eTlpNmE5N051NmlOQU9zaHlZaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721230947),
('Si6BZ7nWcMw09aOX7lo5xHNsE65krWLYT6IOvQ4o', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYW85QmY3ZWhKbmFTVTBtSGFGdTcxaDZCdnE2c2c4UmpuNUYwNFZoRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721250337);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('Swrh12lQoVQyHy0YD9xkpC2I3e2OWyoRRM1piBvO', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOFhHUjQwbW5uRXFxN2h2enpoNGI4WUNVZk03Y0lMU09rU3pXeEFrVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721267209),
('SWshxSNHKHyhUFob57BUminaOTUNpbzGmjJTIZa5', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNWNCYUp0cXhMaDA1TG1YM0M1UEQydlNNRTF5NDlUdFZiY2RiU0hLOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721246243),
('T5xMJJR59c8eKK5D20jemmKth5Xq5Y1pwHQCYNKW', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieVlxNFBMdFZjaFI0S3k5VDRnRUJKeHZFNkpGenNiRmV0ZkxRVjB5cCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721225160),
('TCnbO33LVJL7FCdBrc48DCzsyyBqR4SBuaPCmHVj', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV2hJNWE5dG0yN0dVU1pBTWlibmtkYU9vcGdsdWU0Um1pUnVrVHpGVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721267990),
('Th8BYuknkqUjrTngLsGrhW7H7pbY7zHwLt00WBx8', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT1FhRENlMzIyT0tFVDZNcWV4R0VRV2F3TU5UVTRXdmpTTkRHWjFucyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721228125),
('tL4dvNn92i71Cm9jkJhJdhabdurlOZkJplcLCDSz', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMWZ6ZUtlNGxoeHI2TVpxOHVIRW5xQldnWjI3R3hnVHV2YWhOM1hFRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721269775),
('Uetj4CfzqKjuLa4xvqMeQm2NwibmGhZz2TH6bW6m', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNWllSk9QUFdqUTAwaXlYYXhzemVHUndMWjc5d0RJUUw1ZW1NM1F5SyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721269816),
('VLNM7dooOACiza83S7ZLbx1mf6814RnFp2x6bbRh', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRnIwVkRheHRTdGlsZ3UwTnc4MWRrQm1INWtaYXZpN1RzOUpKM1M4diI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721270323),
('vqll56POPCrUeaSkPe15DzMfiPMkHnJUunfBrBea', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZldBN3RvcmRPVXZCTVZMSm1mTzRhcGZjdDJsT1pQMXlwVjc3ZnRYUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721245912),
('VUtnYOnidQkYqYjoWh7SYhquOXFt4aLppzo4fabY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibzdIcG41dTZmMGFSd3lPU1FJeldYcHpydk5NZUJSa0JSNExwOWcxbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721270835),
('Vxkl0mCoJGaWJ2ddBjMfzMJQrA5bJNFM4yWzMMK8', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia1FVd1Z6aGpDSUtPdVdrcm1NSlQ1Y2V1VUsyclkwdkZKeFluTHFneCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721220835),
('WlF5EN1pIXvyHtf6QJMLLssZYlHVu0f5yvml7A7a', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZHl5RUpJMWRiNWlmejJ0MnZXa2ZYd1hkTTl1S2JxQkkyamUxc1NDcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721227875),
('x65yHPnHJcEqbwoDfS0LIlnus5k96RXjF08Dko1r', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVXJwM3AxODYwWkJ6Z20wYUZjUlN0WTlOc0RHWU5CdUNQMXpjSmE0TiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721236298),
('XFGr9QZMgtVZcdsHTACV17wgzTrWHodg4bFB9yZH', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNVpOTVdVckgwUFZLbWV2MWRSQWt6TEViVjBnQ1BzTTVSbHE3VHhvayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721222364),
('xPxc4Or9HUb76mREnEDiva1J8mBL7P3SOi1BGGim', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY0tNdnAxZmhhaERRQ3ZYdXI2SDNLY3hLSTI3QVV2WkxCZFNLWVRMQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721268128),
('Y0EjDjcmvFFUgaUsM4MvZ9mxUv9oM0e40SVywWBj', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZUpEc29mamZFNDZIOXpWN29zcVdRQzVQQm9pUnNEVFYwN2ZtS25HSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721267456),
('YaBqNgc6uZhxkpBerlmeB6VU63k0NLvJ21qjkKVa', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOFhueXdWd1Z5dU95ejhDVFdxR1FuYzBxNHQzeFNuS2Z0NTVJNlA2ciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721230974),
('Ych2LPnAkUhXkcS681lndfuYQoEamiI6p9rKjCbu', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicW1CVDhEcG81VGM1dVgyb3Z5eEpWSzVQbENZUGJPSzZzM2FXdmFFNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721227837),
('YsOe8v87XSC9kcdlYygDAYBFanwowmTZXAHdVust', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNU02ZXZqODlGMVJJbzd4Sk91M1FPVjB1RGdBcWhBOG1SOGx1QU9TRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721269763),
('zE5LYEetXgD9JM9P4smtKdajJgrSyNEW1neOvP24', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWnRKQXphamJHeWRralVQQjNpdU5CZUszQXlNd2dTRU95Zk4wdGx2MiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721276947),
('zPDG3IoFttE9RsNVN8p0WXjZgYG3uDS22FJnqhNr', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRlVqRGdzWTRoaGVMM1VORGt1UUJKUGVhN054RFIwc2dQQXM4TnpJbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721248277),
('zvltPxu7PzVotImAo59Yjt0hdtVVrmUzREc5QzKl', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaHRMeWJmOUFjOGhJQ3NVRXpVYkYzdXlpSHVpbG9wWVNYM1R6RFU1dSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdmF0YXIvdW5kZWZpbmVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721269813);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(11) NOT NULL,
  `url` varchar(200) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `url`, `status`, `created_at`, `updated_at`) VALUES
(1, 'sliders/slider1.png', 1, '2023-03-09 20:40:32', '2023-03-09 20:40:32'),
(2, 'sliders/slider2.png', 1, '2023-03-09 20:40:32', '2023-03-09 20:40:32'),
(3, 'sliders/slider3.png', 1, '2023-03-09 20:40:32', '2023-03-09 20:40:32'),
(4, 'sliders/slider4.png', 1, '2023-03-09 20:40:32', '2023-03-09 20:40:32');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `rate` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  `updated_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='States in Nigeria.';

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`, `rate`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Abia', 0, 1, '2020-06-05 19:00:00', '2021-03-25 00:32:54'),
(2, 'Adamawa', 0, 1, '2020-06-05 19:00:00', '2021-03-25 00:51:02'),
(3, 'Akwa Ibom', 0, 1, '2020-06-05 19:00:00', '2020-06-13 12:56:10'),
(4, 'Anambra', 0, 1, '2020-06-05 19:00:00', '2020-06-13 12:56:18'),
(5, 'Bauchi', 0, 1, '2020-06-05 19:00:00', '2020-06-13 12:56:23'),
(6, 'Bayelsa', 0, 1, '2020-06-05 19:00:00', '2020-06-13 12:56:27'),
(7, 'Benue', 0, 1, '2020-06-05 19:00:00', '2020-06-13 12:57:05'),
(8, 'Borno', 0, 1, '2020-06-05 19:00:00', '2020-06-13 12:56:59'),
(9, 'Cross River', 0, 1, '2020-06-05 19:00:00', '2021-03-25 00:51:07'),
(10, 'Delta', 0, 1, '2020-06-05 19:00:00', '2021-03-25 00:51:14'),
(11, 'Ebonyi', 0, 1, '2020-06-05 19:00:00', '2020-06-13 12:56:39'),
(12, 'Edo', 0, 1, '2020-06-05 19:00:00', '2020-06-13 12:56:33'),
(13, 'Ekiti', 0, 1, '2020-06-05 19:00:00', '2020-06-13 12:57:15'),
(14, 'Enugu', 0, 1, '2020-06-05 19:00:00', '2020-06-05 19:00:00'),
(15, 'FCT', 0, 1, '2020-06-05 19:00:00', '2020-06-05 19:00:00'),
(16, 'Gombe', 0, 1, '2020-06-05 19:00:00', '2020-06-13 12:57:22'),
(17, 'Imo', 0, 1, '2020-06-05 19:00:00', '2021-03-25 00:51:54'),
(18, 'Jigawa', 0, 1, '2020-06-05 19:00:00', '2020-06-05 19:00:00'),
(19, 'Kaduna', 0, 1, '2020-06-05 19:00:00', '2020-06-05 19:00:00'),
(20, 'Kano', 0, 1, '2020-06-05 19:00:00', '2020-06-05 19:00:00'),
(21, 'Katsina', 0, 1, '2020-06-05 19:00:00', '2020-06-05 19:00:00'),
(22, 'Kebbi', 0, 1, '2020-06-05 19:00:00', '2020-06-05 19:00:00'),
(23, 'Kogi', 0, 1, '2020-06-05 19:00:00', '2020-06-05 19:00:00'),
(24, 'Kwara', 0, 1, '2020-06-05 19:00:00', '2021-03-25 00:52:03'),
(25, 'Lagos', 0, 1, '2020-06-05 19:00:00', '2020-06-05 19:00:00'),
(26, 'Nasarawa', 0, 1, '2020-06-05 19:00:00', '2020-06-05 19:00:00'),
(27, 'Niger', 0, 1, '2020-06-05 19:00:00', '2021-03-25 00:52:21'),
(28, 'Ogun', 0, 1, '2020-06-05 19:00:00', '2021-03-25 00:52:25'),
(29, 'Ondo', 0, 1, '2020-06-05 19:00:00', '2021-03-25 00:52:17'),
(30, 'Osun', 0, 1, '2020-06-05 19:00:00', '2021-03-25 00:52:09'),
(31, 'Oyo', 0, 1, '2020-06-05 19:00:00', '2020-06-05 19:00:00'),
(32, 'Plateau', 0, 1, '2020-06-05 19:00:00', '2020-06-05 19:00:00'),
(33, 'Rivers', 0, 1, '2020-06-05 19:00:00', '2021-03-25 00:51:37'),
(34, 'Sokoto', 0, 1, '2020-06-05 19:00:00', '2020-06-05 19:00:00'),
(35, 'Taraba', 0, 1, '2020-06-05 19:00:00', '2020-06-05 19:00:00'),
(36, 'Yobe', 0, 1, '2020-06-05 19:00:00', '2020-06-05 19:00:00'),
(37, 'Zamfara', 0, 1, '2020-06-05 19:00:00', '2020-06-13 12:59:07');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `company_address` varchar(1000) NOT NULL,
  `specialization` varchar(100) NOT NULL,
  `years_in` int(11) NOT NULL,
  `region` varchar(50) NOT NULL,
  `city` varchar(30) NOT NULL,
  `birth` date NOT NULL,
  `gender` varchar(10) NOT NULL,
  `academic` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `user_id`, `company_name`, `company_address`, `specialization`, `years_in`, `region`, `city`, `birth`, `gender`, `academic`, `created_at`, `updated_at`) VALUES
(3, 111, 'AutoHub', 'Festac', 'Electrician', 8, 'Nigeria', 'Lagos', '2024-07-14', '1', 'jomoney@yahoo.com', '2024-07-17 17:56:57', '2024-07-17 17:56:57'),
(4, 113, 'AutoHub', 'Festac', 'Electrician', 8, 'Nigeria', 'Lagos', '2024-07-14', '1', 'jomoney@yahoo.com', '2024-07-17 17:58:31', '2024-07-17 17:58:31'),
(5, 114, 'AutoHub', 'Gbagada', 'Electrician', 9, 'Nigeria', 'Edo', '2024-07-12', '1', 'jomoney@yahoo.com', '2024-07-17 18:11:25', '2024-07-17 18:11:25');

-- --------------------------------------------------------

--
-- Table structure for table `swaps`
--

CREATE TABLE `swaps` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL,
  `condition_id` int(11) NOT NULL,
  `colour_id` int(11) NOT NULL,
  `chasis_number` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fault` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` int(11) NOT NULL DEFAULT 1,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `leave_vehicle_time` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sale_type` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `swaps`
--

INSERT INTO `swaps` (`id`, `user_id`, `brand_id`, `model_id`, `condition_id`, `colour_id`, `chasis_number`, `name`, `fault`, `rate`, `description`, `price`, `leave_vehicle_time`, `sale_type`, `images`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 2, 11, 1, 5, 'uyhjkooiuhhh', 'samuel', 'no', 4, 'Very long bus with black bumbum', '658000', 'Very long bus with black bumbum', 'DISTRESSED SALE', '[\"https:\\/\\/storage.autohub.ng\\/public\\/swap\\/314295016064520e4b4071b.jpg\",\"https:\\/\\/storage.autohub.ng\\/public\\/swap\\/314295016064520e4bd8234.jpg\"]', 0, '2023-05-03 02:33:32', '2023-05-03 02:33:32'),
(2, 3, 5, 2, 1, 1, 'fffg', 'samji', 'no', 4, 'good day please find the attached', '258008', 'good day please find the attached', 'DISTRESSED SALE', '[\"https:\\/\\/storage.autohub.ng\\/public\\/swap\\/39984796196456d84d19f38.jpg\",\"https:\\/\\/storage.autohub.ng\\/public\\/swap\\/39984796196456d84d84bf3.jpg\",\"https:\\/\\/storage.autohub.ng\\/public\\/swap\\/39984796196456d84dc54d0.jpg\",\"https:\\/\\/storage.autohub.ng\\/public\\/swap\\/39984796196456d84e10b43.jpg\"]', 0, '2023-05-06 17:44:30', '2023-05-06 17:44:30'),
(3, 20, 59, 4, 2, 4, 'yooyt5578i9pppyre', 'chika joel', 'no fault', 4, 'sound and clean', '2000000', 'sound and clean', 'DISTRESSED SALE', '[\"https:\\/\\/storage.autohub.ng\\/public\\/swap\\/20780190010646ea0d46944e.jpg\",\"https:\\/\\/storage.autohub.ng\\/public\\/swap\\/20780190010646ea0d5b0c7d.jpg\",\"https:\\/\\/storage.autohub.ng\\/public\\/swap\\/20780190010646ea0d5f16c6.jpg\",\"https:\\/\\/storage.autohub.ng\\/public\\/swap\\/20780190010646ea0d644b4c.jpg\"]', 0, '2023-05-24 18:42:14', '2023-05-24 18:42:14'),
(4, 24, 1, 1, 1, 1, '7277247281412', 'Samuel Samji', 'The leg is shaking', 5, 'The vehicle is cool and awesome, fast and furious', '2000', '20', 'DISTRESSED SALE', '[\"https:\\/\\/storage.autohub.ng\\/public\\/swap\\/241389452873652fb84759cc7.jpg\",\"https:\\/\\/storage.autohub.ng\\/public\\/swap\\/241389452873652fb847e19b4.jpg\"]', 0, '2023-10-18 09:49:43', '2023-10-18 09:49:43'),
(5, 24, 2, 2, 2, 6, 'thhhhhhhh', 'proof', 'no', 3, 'description', '2000000', 'description', 'DISTRESSED SALE', '[\"https:\\/\\/storage.autohub.ng\\/public\\/swap\\/241340836121652ff2e60d06a.jpg\"]', 0, '2023-10-18 13:59:50', '2023-10-18 13:59:50');

-- --------------------------------------------------------

--
-- Table structure for table `talks`
--

CREATE TABLE `talks` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `talks`
--

INSERT INTO `talks` (`id`, `post_id`, `user_id`, `comment`, `created_at`, `updated_at`) VALUES
(1, 3, 28, 'Am coming down for inspection', '2024-06-15 00:06:00', '2024-06-15 00:06:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_webhook_paylony`
--

CREATE TABLE `tbl_webhook_paylony` (
  `id` int(11) NOT NULL,
  `payment_reference` varchar(900) NOT NULL,
  `payment_id` varchar(900) NOT NULL,
  `status` varchar(90) DEFAULT NULL,
  `amount` varchar(900) NOT NULL,
  `fees` varchar(90) NOT NULL,
  `receiving_account` varchar(90) NOT NULL,
  `paid_at` text NOT NULL,
  `channel` text NOT NULL,
  `remote_address` text DEFAULT NULL,
  `extra` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Table log for Paystack Webhook';

--
-- Dumping data for table `tbl_webhook_paylony`
--

INSERT INTO `tbl_webhook_paylony` (`id`, `payment_reference`, `payment_id`, `status`, `amount`, `fees`, `receiving_account`, `paid_at`, `channel`, `remote_address`, `extra`, `created_at`, `updated_at`) VALUES
(1, 'Vfd-x-20221226145000', '202212261450837964477', '00', '5000', '50', '1010011220', '2023-05-17 17:44:30', 'bank_transfer', '154.120.106.7', '{\"status\":\"00\",\"currency\":\"NGN\",\"amount\":\"5000\",\"fee\":\"50\",\"receiving_account\":\"1010011220\",\"sender_account_name\":\"Tolulope Oyeniyi\",\"sender_account_number\":\"00012302099\",\"sender_bank_code\":\"999999\",\"sender_narration\":\"Gift bills deposit\",\"sessionId\":\"0000929120221226145000\",\"trx\":\"202212261450837964477\",\"reference\":\"Vfd-x-20221226145000\",\"channel\":\"bank_transfer\",\"type\":\"reserved_account\",\"domain\":\"test\",\"gateway\":\"vfd\"}', '2023-05-17 16:44:30', '2023-05-17 16:44:30'),
(2, 'Paylony-x-1481445387', '2023110519431758015621', '00', '35000', '350', '6005034836', '2023-11-05 19:43:01', 'checkout', '89.117.60.210', '{\"status\":\"00\",\"event\":\"collection\",\"currency\":\"NGN\",\"amount\":\"35000\",\"fee\":\"350\",\"receiving_account\":\"6005034836\",\"sender_account_name\":\"Paylony Simulator\",\"sender_account_number\":\"0000001234\",\"sender_bank_code\":\"999999\",\"sender_narration\":\"5Star Inn Company | plan payment\",\"sessionId\":\"00001905202311051942\",\"trx\":\"2023110519431758015621\",\"reference\":\"Paylony-x-1481445387\",\"channel\":\"checkout\",\"type\":\"checkout_account\",\"domain\":\"test\",\"gateway\":\"vfd\",\"customer_email\":\"toluxsys@gmail.com\",\"customer_reference\":\"6547db56cac24_6547db5841365\",\"timestamp\":\"2023-11-05T18:43:00.000000Z\"}', '2023-11-05 18:43:01', '2023-11-05 18:43:01'),
(3, 'Paylony-x-1234187084', '202311061042756266482', '00', '35000', '350', '6005035235', '2023-11-06 10:42:08', 'checkout', '89.117.60.210', '{\"status\":\"00\",\"event\":\"collection\",\"currency\":\"NGN\",\"amount\":\"35000\",\"fee\":\"350\",\"receiving_account\":\"6005035235\",\"sender_account_name\":\"Paylony Simulator\",\"sender_account_number\":\"0000001234\",\"sender_bank_code\":\"999999\",\"sender_narration\":\"5Star Inn Company | test\",\"sessionId\":\"00001905202311061042\",\"trx\":\"202311061042756266482\",\"reference\":\"Paylony-x-1234187084\",\"channel\":\"checkout\",\"type\":\"checkout_account\",\"domain\":\"test\",\"gateway\":\"vfd\",\"customer_email\":\"devdoctor001@gmail.com\",\"customer_reference\":\"6548b1a153ee0_6548b1a1e3f27\",\"timestamp\":\"2023-11-06T09:42:08.000000Z\"}', '2023-11-06 09:42:08', '2023-11-06 09:42:08'),
(4, 'Paylony-x-663318648', '2023110610441224123348', '00', '35000', '350', '6005035235', '2023-11-06 10:44:10', 'checkout', '89.117.60.210', '{\"status\":\"00\",\"event\":\"collection\",\"currency\":\"NGN\",\"amount\":\"35000\",\"fee\":\"350\",\"receiving_account\":\"6005035235\",\"sender_account_name\":\"Paylony Simulator\",\"sender_account_number\":\"0000001234\",\"sender_bank_code\":\"999999\",\"sender_narration\":\"5Star Inn Company | test\",\"sessionId\":\"00001905202311061044\",\"trx\":\"2023110610441224123348\",\"reference\":\"Paylony-x-663318648\",\"channel\":\"checkout\",\"type\":\"checkout_account\",\"domain\":\"test\",\"gateway\":\"vfd\",\"customer_email\":\"devdoctor001@gmail.com\",\"customer_reference\":\"6548b1a153ee0_6548b1a1e3f27\",\"timestamp\":\"2023-11-06T09:44:10.000000Z\"}', '2023-11-06 09:44:10', '2023-11-06 09:44:10'),
(5, 'Paylony-x-373915065', '2023110610581929475802', '00', '35000', '350', '6005035235', '2023-11-06 10:58:56', 'checkout', '89.117.60.210', '{\"status\":\"00\",\"event\":\"collection\",\"currency\":\"NGN\",\"amount\":\"35000\",\"fee\":\"350\",\"receiving_account\":\"6005035235\",\"sender_account_name\":\"Paylony Simulator\",\"sender_account_number\":\"0000001234\",\"sender_bank_code\":\"999999\",\"sender_narration\":\"5Star Inn Company | test\",\"sessionId\":\"00001905202311061058\",\"trx\":\"2023110610581929475802\",\"reference\":\"Paylony-x-373915065\",\"channel\":\"checkout\",\"type\":\"checkout_account\",\"domain\":\"test\",\"gateway\":\"vfd\",\"customer_email\":\"devdoctor001@gmail.com\",\"customer_reference\":\"6548b1a153ee0_6548b1a1e3f27\",\"timestamp\":\"2023-11-06T09:58:55.000000Z\"}', '2023-11-06 09:58:56', '2023-11-06 09:58:56'),
(6, 'Paylony-x-1038919859', '202311061104333766458', '00', '35350', '350', '6005035235', '2023-11-06 11:04:21', 'checkout', '89.117.60.210', '{\"status\":\"00\",\"event\":\"collection\",\"currency\":\"NGN\",\"amount\":\"35350\",\"fee\":\"350\",\"receiving_account\":\"6005035235\",\"sender_account_name\":\"Paylony Simulator\",\"sender_account_number\":\"0000001234\",\"sender_bank_code\":\"999999\",\"sender_narration\":\"5Star Inn Company | test\",\"sessionId\":\"00001905202311061104\",\"trx\":\"202311061104333766458\",\"reference\":\"Paylony-x-1038919859\",\"channel\":\"checkout\",\"type\":\"checkout_account\",\"domain\":\"test\",\"gateway\":\"vfd\",\"customer_email\":\"devdoctor001@gmail.com\",\"customer_reference\":\"6548b1a153ee0_6548b1a1e3f27\",\"timestamp\":\"2023-11-06T10:04:20.000000Z\"}', '2023-11-06 10:04:21', '2023-11-06 10:04:21'),
(7, 'Paylony-x-1477418203', '2023110611122000895604', '00', '35000', '350', '6005035297', '2023-11-06 11:12:00', 'checkout', '89.117.60.210', '{\"status\":\"00\",\"event\":\"collection\",\"currency\":\"NGN\",\"amount\":\"35000\",\"fee\":\"350\",\"receiving_account\":\"6005035297\",\"sender_account_name\":\"Paylony Simulator\",\"sender_account_number\":\"0000001234\",\"sender_bank_code\":\"999999\",\"sender_narration\":\"5Star Inn Company | test\",\"sessionId\":\"00001905202311061111\",\"trx\":\"2023110611122000895604\",\"reference\":\"Paylony-x-1477418203\",\"channel\":\"checkout\",\"type\":\"checkout_account\",\"domain\":\"test\",\"gateway\":\"vfd\",\"customer_email\":\"devdoctor001@gmail.com\",\"customer_reference\":\"6548bbcaadaf0_6548bbcb2d0be\",\"timestamp\":\"2023-11-06T10:12:00.000000Z\"}', '2023-11-06 10:12:00', '2023-11-06 10:12:00'),
(8, 'Paylony-x-112701311', '202311061133944471162', '00', '35000', '350', '6005035307', '2023-11-06 11:33:10', 'checkout', '89.117.60.210', '{\"status\":\"00\",\"event\":\"collection\",\"currency\":\"NGN\",\"amount\":\"35000\",\"fee\":\"350\",\"receiving_account\":\"6005035307\",\"sender_account_name\":\"Paylony Simulator\",\"sender_account_number\":\"0000001234\",\"sender_bank_code\":\"999999\",\"sender_narration\":\"5Star Inn Company | test\",\"sessionId\":\"00001905202311061133\",\"trx\":\"202311061133944471162\",\"reference\":\"Paylony-x-112701311\",\"channel\":\"checkout\",\"type\":\"checkout_account\",\"domain\":\"test\",\"gateway\":\"vfd\",\"customer_email\":\"devdoctor001@gmail.com\",\"customer_reference\":\"6548c00f3ae41_6548c00fd2568\",\"timestamp\":\"2023-11-06T10:33:09.000000Z\"}', '2023-11-06 10:33:10', '2023-11-06 10:33:10'),
(9, 'Paylony-x-1222400096', '2023110611361379794827', '00', '35000', '350', '6005035307', '2023-11-06 11:36:58', 'checkout', '89.117.60.210', '{\"status\":\"00\",\"event\":\"collection\",\"currency\":\"NGN\",\"amount\":\"35000\",\"fee\":\"350\",\"receiving_account\":\"6005035307\",\"sender_account_name\":\"Paylony Simulator\",\"sender_account_number\":\"0000001234\",\"sender_bank_code\":\"999999\",\"sender_narration\":\"5Star Inn Company | Paylony-wu6z002mh8vkb1znd90si\",\"sessionId\":\"00001905202311061136\",\"trx\":\"2023110611361379794827\",\"reference\":\"Paylony-x-1222400096\",\"channel\":\"checkout\",\"type\":\"checkout_account\",\"domain\":\"test\",\"gateway\":\"vfd\",\"customer_email\":\"devdoctor001@gmail.com\",\"customer_reference\":\"6548c00f3ae41_6548c00fd2568\",\"timestamp\":\"2023-11-06T10:36:57.000000Z\"}', '2023-11-06 10:36:58', '2023-11-06 10:36:58'),
(10, 'Paylony-x-1710422242', '2023110611371421370477', '00', '35000', '350', '6005035307', '2023-11-06 11:37:43', 'checkout', '89.117.60.210', '{\"status\":\"00\",\"event\":\"collection\",\"currency\":\"NGN\",\"amount\":\"35000\",\"fee\":\"350\",\"receiving_account\":\"6005035307\",\"sender_account_name\":\"Paylony Simulator\",\"sender_account_number\":\"0000001234\",\"sender_bank_code\":\"999999\",\"sender_narration\":\"5Star Inn Company | 6548c00f3ae41_6548c00fd2568\",\"sessionId\":\"00001905202311061137\",\"trx\":\"2023110611371421370477\",\"reference\":\"Paylony-x-1710422242\",\"channel\":\"checkout\",\"type\":\"checkout_account\",\"domain\":\"test\",\"gateway\":\"vfd\",\"customer_email\":\"devdoctor001@gmail.com\",\"customer_reference\":\"6548c00f3ae41_6548c00fd2568\",\"timestamp\":\"2023-11-06T10:37:43.000000Z\"}', '2023-11-06 10:37:43', '2023-11-06 10:37:43'),
(11, 'Paylony-x-1998888889', '202311061210907963349', '00', '35000', '350', '6005035307', '2023-11-06 12:10:54', 'checkout', '89.117.60.210', '{\"status\":\"00\",\"event\":\"collection\",\"currency\":\"NGN\",\"amount\":\"35000\",\"fee\":\"350\",\"receiving_account\":\"6005035307\",\"sender_account_name\":\"Paylony Simulator\",\"sender_account_number\":\"0000001234\",\"sender_bank_code\":\"999999\",\"sender_narration\":\"5Star Inn Company | 6548c00f3ae41_6548c00fd2568\",\"sessionId\":\"00001905202311061210\",\"trx\":\"202311061210907963349\",\"reference\":\"Paylony-x-1998888889\",\"channel\":\"checkout\",\"type\":\"checkout_account\",\"domain\":\"test\",\"gateway\":\"vfd\",\"customer_email\":\"devdoctor001@gmail.com\",\"customer_reference\":\"6548c00f3ae41_6548c00fd2568\",\"timestamp\":\"2023-11-06T11:10:53.000000Z\"}', '2023-11-06 11:10:54', '2023-11-06 11:10:54'),
(12, 'Paylony-x-31811412', '202311061238763264516', '00', '35000', '350', '6005035307', '2023-11-06 12:38:04', 'checkout', '89.117.60.210', '{\"status\":\"00\",\"event\":\"collection\",\"currency\":\"NGN\",\"amount\":\"35000\",\"fee\":\"350\",\"receiving_account\":\"6005035307\",\"sender_account_name\":\"Paylony Simulator\",\"sender_account_number\":\"0000001234\",\"sender_bank_code\":\"999999\",\"sender_narration\":\"5Star Inn Company | 6548c00f3ae41_6548c00fd2568\",\"sessionId\":\"00001905202311061238\",\"trx\":\"202311061238763264516\",\"reference\":\"Paylony-x-31811412\",\"channel\":\"checkout\",\"type\":\"checkout_account\",\"domain\":\"test\",\"gateway\":\"vfd\",\"customer_email\":\"devdoctor001@gmail.com\",\"customer_reference\":\"6548c00f3ae41_6548c00fd2568\",\"timestamp\":\"2023-11-06T11:38:04.000000Z\"}', '2023-11-06 11:38:04', '2023-11-06 11:38:04'),
(13, 'Paylony-x-1852027805', '202311061238387816579', '00', '35350', '350', '6005035307', '2023-11-06 12:38:39', 'checkout', '89.117.60.210', '{\"status\":\"00\",\"event\":\"collection\",\"currency\":\"NGN\",\"amount\":\"35350\",\"fee\":\"350\",\"receiving_account\":\"6005035307\",\"sender_account_name\":\"Paylony Simulator\",\"sender_account_number\":\"0000001234\",\"sender_bank_code\":\"999999\",\"sender_narration\":\"5Star Inn Company | 6548c00f3ae41_6548c00fd2568\",\"sessionId\":\"00001905202311061238\",\"trx\":\"202311061238387816579\",\"reference\":\"Paylony-x-1852027805\",\"channel\":\"checkout\",\"type\":\"checkout_account\",\"domain\":\"test\",\"gateway\":\"vfd\",\"customer_email\":\"devdoctor001@gmail.com\",\"customer_reference\":\"6548c00f3ae41_6548c00fd2568\",\"timestamp\":\"2023-11-06T11:38:39.000000Z\"}', '2023-11-06 11:38:40', '2023-11-06 11:38:40'),
(14, 'Paylony-x-1246615165', '2023110612412091805441', '00', '35000', '350', '6005035307', '2023-11-06 12:41:48', 'checkout', '89.117.60.210', '{\"status\":\"00\",\"event\":\"collection\",\"currency\":\"NGN\",\"amount\":\"35000\",\"fee\":\"350\",\"receiving_account\":\"6005035307\",\"sender_account_name\":\"Paylony Simulator\",\"sender_account_number\":\"0000001234\",\"sender_bank_code\":\"999999\",\"sender_narration\":\"5Star Inn Company | Paylony-wu6z002mh8vkb1znd90si\",\"sessionId\":\"00001905202311061241\",\"trx\":\"2023110612412091805441\",\"reference\":\"Paylony-x-1246615165\",\"channel\":\"checkout\",\"type\":\"checkout_account\",\"domain\":\"test\",\"gateway\":\"vfd\",\"customer_email\":\"devdoctor001@gmail.com\",\"customer_reference\":\"6548c00f3ae41_6548c00fd2568\",\"timestamp\":\"2023-11-06T11:41:48.000000Z\"}', '2023-11-06 11:41:48', '2023-11-06 11:41:48'),
(15, 'Paylony-x-1784457746', '202311061243343817018', '00', '35350', '350', '6005035307', '2023-11-06 12:43:34', 'checkout', '89.117.60.210', '{\"status\":\"00\",\"event\":\"collection\",\"currency\":\"NGN\",\"amount\":\"35350\",\"fee\":\"350\",\"receiving_account\":\"6005035307\",\"sender_account_name\":\"Paylony Simulator\",\"sender_account_number\":\"0000001234\",\"sender_bank_code\":\"999999\",\"sender_narration\":\"5Star Inn Company | 6548c00f3ae41_6548c00fd2568\",\"sessionId\":\"00001905202311061243\",\"trx\":\"202311061243343817018\",\"reference\":\"Paylony-x-1784457746\",\"channel\":\"checkout\",\"type\":\"checkout_account\",\"domain\":\"test\",\"gateway\":\"vfd\",\"customer_email\":\"devdoctor001@gmail.com\",\"customer_reference\":\"6548c00f3ae41_6548c00fd2568\",\"timestamp\":\"2023-11-06T11:43:33.000000Z\"}', '2023-11-06 11:43:34', '2023-11-06 11:43:34'),
(16, 'Paylony-x-1146195936', '202311061245278707664', '00', '35000', '350', '6005035307', '2023-11-06 12:45:47', 'checkout', '89.117.60.210', '{\"status\":\"00\",\"event\":\"collection\",\"currency\":\"NGN\",\"amount\":\"35000\",\"fee\":\"350\",\"receiving_account\":\"6005035307\",\"sender_account_name\":\"Paylony Simulator\",\"sender_account_number\":\"0000001234\",\"sender_bank_code\":\"999999\",\"sender_narration\":\"5Star Inn Company | 6548c00f3ae41_6548c00fd2568\",\"sessionId\":\"00001905202311061245\",\"trx\":\"202311061245278707664\",\"reference\":\"Paylony-x-1146195936\",\"channel\":\"checkout\",\"type\":\"checkout_account\",\"domain\":\"test\",\"gateway\":\"vfd\",\"customer_email\":\"devdoctor001@gmail.com\",\"customer_reference\":\"6548c00f3ae41_6548c00fd2568\",\"timestamp\":\"2023-11-06T11:45:46.000000Z\"}', '2023-11-06 11:45:47', '2023-11-06 11:45:47'),
(17, 'Paylony-x-2041814637', '2023110613021717883216', '00', '35000', '350', '6005035424', '2023-11-06 13:02:55', 'checkout', '89.117.60.210', '{\"status\":\"00\",\"event\":\"collection\",\"currency\":\"NGN\",\"amount\":\"35000\",\"fee\":\"350\",\"receiving_account\":\"6005035424\",\"sender_account_name\":\"Paylony Simulator\",\"sender_account_number\":\"0000001234\",\"sender_bank_code\":\"999999\",\"sender_narration\":\"5Star Inn Company | 6548d5c2a854d_6548d5c3351c4\",\"sessionId\":\"00001905202311061302\",\"trx\":\"2023110613021717883216\",\"reference\":\"Paylony-x-2041814637\",\"channel\":\"checkout\",\"type\":\"checkout_account\",\"domain\":\"test\",\"gateway\":\"vfd\",\"customer_email\":\"devdoctor001@gmail.com\",\"customer_reference\":\"6548d5c2a854d_6548d5c3351c4\",\"timestamp\":\"2023-11-06T12:02:54.000000Z\"}', '2023-11-06 12:02:55', '2023-11-06 12:02:55'),
(18, 'Paylony-x-976139005', '2023110616521223046802', '00', '35000', '350', '6005035424', '2023-11-06 16:52:55', 'checkout', '89.117.60.210', '{\"status\":\"00\",\"event\":\"collection\",\"currency\":\"NGN\",\"amount\":\"35000\",\"fee\":\"350\",\"receiving_account\":\"6005035424\",\"sender_account_name\":\"Paylony Simulator\",\"sender_account_number\":\"0000001234\",\"sender_bank_code\":\"999999\",\"sender_narration\":\"5Star Inn Company | 6548d5c2a854d_6548d5c3351c4\",\"sessionId\":\"00001905202311061652\",\"trx\":\"2023110616521223046802\",\"reference\":\"Paylony-x-976139005\",\"channel\":\"checkout\",\"type\":\"checkout_account\",\"domain\":\"test\",\"gateway\":\"vfd\",\"customer_email\":\"devdoctor001@gmail.com\",\"customer_reference\":\"6548d5c2a854d_6548d5c3351c4\",\"timestamp\":\"2023-11-06T15:52:54.000000Z\"}', '2023-11-06 15:52:55', '2023-11-06 15:52:55'),
(19, 'Paylony-x-56413575', '202311061654649617065', '00', '35000', '350', '6005035747', '2023-11-06 16:54:44', 'checkout', '89.117.60.210', '{\"status\":\"00\",\"event\":\"collection\",\"currency\":\"NGN\",\"amount\":\"35000\",\"fee\":\"350\",\"receiving_account\":\"6005035747\",\"sender_account_name\":\"Paylony Simulator\",\"sender_account_number\":\"0000001234\",\"sender_bank_code\":\"999999\",\"sender_narration\":\"5Star Inn Company | 6548d5c2a854d_65490c22b9078\",\"sessionId\":\"00001905202311061654\",\"trx\":\"202311061654649617065\",\"reference\":\"Paylony-x-56413575\",\"channel\":\"checkout\",\"type\":\"checkout_account\",\"domain\":\"test\",\"gateway\":\"vfd\",\"customer_email\":\"devdoctor001@gmail.com\",\"customer_reference\":\"6548d5c2a854d_65490c22b9078\",\"timestamp\":\"2023-11-06T15:54:44.000000Z\"}', '2023-11-06 15:54:44', '2023-11-06 15:54:44');

-- --------------------------------------------------------

--
-- Table structure for table `test_marks`
--

CREATE TABLE `test_marks` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `test_question_id` int(11) NOT NULL,
  `selected` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `test_questionaires`
--

CREATE TABLE `test_questionaires` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `test_questions`
--

CREATE TABLE `test_questions` (
  `id` int(11) NOT NULL,
  `test_questionaire_id` int(11) NOT NULL,
  `question` varchar(500) NOT NULL,
  `option_a` int(11) NOT NULL,
  `option_b` int(11) NOT NULL,
  `option_c` int(11) NOT NULL,
  `option_d` int(11) NOT NULL,
  `answer` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transmissions`
--

CREATE TABLE `transmissions` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transmissions`
--

INSERT INTO `transmissions` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'AMT', 1, '2023-02-26 17:18:30', '2023-02-26 17:18:30'),
(2, 'Automatic', 1, '2023-02-26 17:18:30', '2023-02-26 17:18:30'),
(3, 'CVY', 1, '2023-02-26 17:18:30', '2023-02-26 17:18:30'),
(4, 'Manual', 1, '2023-02-26 17:18:30', '2023-02-26 17:18:30');

-- --------------------------------------------------------

--
-- Table structure for table `trims`
--

CREATE TABLE `trims` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trims`
--

INSERT INTO `trims` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'S 4dr SUV (2.5L 4cyl 6A)', 1, '2023-02-26 17:39:46', '2023-02-26 17:39:46'),
(2, 'SE 4dr SUV (1.6L 4cyl Turbo 6A)', 1, '2023-02-26 17:39:46', '2023-02-26 17:39:46'),
(3, 'SE 4dr SUV AWD (1.6L 4cyl Tu)', 1, '2023-02-26 17:39:46', '2023-02-26 17:39:46'),
(4, 'Titanium 4dr SUV AWD (1.6L 4cyl Turbo 6A)', 1, '2023-02-26 17:39:46', '2023-02-26 17:39:46');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `middlename` varchar(30) DEFAULT NULL,
  `lastname` varchar(30) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phoneno` varchar(20) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(200) NOT NULL DEFAULT 'https://storage.autohub.ng/public/product/3435098384.jpg',
  `id_card_front` varchar(200) DEFAULT NULL,
  `id_card_back` varchar(200) DEFAULT NULL,
  `type` varchar(15) NOT NULL DEFAULT 'buyer',
  `specialization` varchar(100) DEFAULT NULL,
  `year_of_experience` varchar(10) DEFAULT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `admin` int(11) NOT NULL DEFAULT 0,
  `status` varchar(50) NOT NULL DEFAULT 'active',
  `online` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `middlename`, `lastname`, `email`, `phoneno`, `email_verified_at`, `password`, `avatar`, `id_card_front`, `id_card_back`, `type`, `specialization`, `year_of_experience`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `admin`, `status`, `online`, `created_at`, `updated_at`) VALUES
(1, 'Sammy Baba', '', '', 'samji@gmail.com', '08166939207', NULL, '$2y$10$vX/d7opf2zjHS4q9nGrDEeV3OTG22/i7vEkaV6srirVkAkqdjr7E2', 'https://storage.autohub.ng/public/product/3435098384.jpg', NULL, NULL, 'buyer', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', 0, '2023-02-26 12:32:23', '2023-02-28 08:29:32'),
(3, 'Samji', '', '', 'samji2@gmail.com', '081669392051', NULL, '$2y$10$BldY4AeFKVwyYrDkrmSJOOAU9WSYz3CWSukeSIzNW15iWRw0olINm', 'https://storage.autohub.ng/public/avatar/31248036314.jpg', NULL, NULL, 'affiliate', 'I dont know', '2018', NULL, NULL, NULL, NULL, 0, 'active', 0, '2023-02-26 13:49:33', '2023-05-20 23:30:27'),
(4, 'Samuel', '', '', 'odejinmisamuel@gmail.com', '08166939205', NULL, '$2y$10$syWcu1i/nRdqzh82LV26wOoh8d7L5CRjibm8ohaqUGnC7cvwTrkRq', 'https://storage.autohub.ng/public/avatar/4140698238.jpg', NULL, NULL, 'buyer', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', 0, '2023-03-18 18:41:00', '2023-06-21 03:18:31'),
(5, 'Samuel', '', '', 'odejinmisamuel11@gmail.com', '08166939205', NULL, '$2y$10$TwPsxIAf1WYK601DhIvBnOWJzJByB/Wy.J9KQBIkfAjYSzFwf6FMW', 'https://storage.autohub.ng/public/avatar/19487801891.jpg', NULL, NULL, 'buyer', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', 0, '2023-03-18 18:57:44', '2023-03-18 18:57:44'),
(6, 'Samuel', '', '', 'odejinmisamuel111@gmail.com', '08166939205', NULL, '$2y$10$PmHTJ0OAOct.sHevai9fK.nHnnGrjVkjucjJnz4CD1s6Quj7WQcG6', 'https://storage.autohub.ng/public/avatar/19487801891.jpg', NULL, NULL, 'buyer', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', 0, '2023-03-18 18:58:31', '2023-03-18 18:59:04'),
(7, 'Samuel O', '', '', 'samjiven@gmail.com', '08166939205', NULL, '$2y$10$XfLj9wafNy8oSDqCEksUEeQ4MQY.rZGEGd7fAX0Sx.7QhOOIAdVrm', 'https://storage.autohub.ng/public/avatar/19487801891.jpg', NULL, NULL, 'affiliate', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', 0, '2023-03-20 18:21:01', '2023-03-20 18:21:01'),
(8, 'Samuel Lad', '', '', 'samlad@gmail.com', '08166939205', NULL, '$2y$10$PNO3Ik1v9Xo2TFXZrUASqee9mR6TozwuRXXuMIDmVYCIj161E10zO', 'https://storage.autohub.ng/public/avatar/19487801891.jpg', NULL, NULL, 'affiliate', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', 0, '2023-03-20 18:22:47', '2023-03-20 18:23:26'),
(9, 'Team Autohub Nigeria', '', '', 'autohubnigeria@gmail.com', '09094300096', NULL, '$2y$10$jSAr/RwmjhwioDlJErOk9OQEO7huLz9O6Iuf/udyGbHPiTNuB3Iuy', 'https://storage.autohub.ng/public/avatar/19487801891.jpg', NULL, NULL, 'admin', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', 0, '2023-03-28 01:14:51', '2024-07-01 23:01:04'),
(10, 'Samuel Owolabi', '', '', 'owolabisamuel15@gmail.com', '08039497203', NULL, '$2y$10$ZwhjbAUjWTLQ7UCQpnfxyObO5UzuQFsrNBhNv0fC8hzKBVHVi1hc6', 'https://storage.autohub.ng/public/avatar/19487801891.jpg', NULL, NULL, 'buyer', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', 0, '2023-04-12 15:52:12', '2023-04-12 15:52:12'),
(11, 'Chika Joel', '', '', 'autohubnigeria1@gmail.com', '09094300096', NULL, '$2y$10$3p9ywXZSqQT3DCgnSbGWmeZ.dIeE77HruYc0QRAlmNjG8M7jek/Ca', 'https://storage.autohub.ng/public/product/3435098384.jpg', NULL, NULL, 'affiliate', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', 0, '2023-04-24 09:03:02', '2023-04-24 09:03:41'),
(12, 'Samuel Doe', '', '', 'samdoe@gmail.com', '898959', NULL, '$2y$10$PM/mRXbWqR.MKIyH3.wCu.SPfvVMLljydhrbDW6ZvACUx/IZoJDFq', 'https://storage.autohub.ng/public/avatar/5376569531751776851.jpg', 'https://storage.autohub.ng/public/kyc/id_front_1762957929941815578.jpg', 'https://storage.autohub.ng/public/kyc/id_back_16129432791734298590.jpg', 'vendor', '3', '5656', NULL, NULL, NULL, NULL, 0, 'active', 0, '2023-05-13 04:40:02', '2023-05-13 04:40:02'),
(13, 'Tolulope', '', '', 'toluxsys@gmail.com', '08057037413', NULL, '$2y$10$emlE4.tqOTXjlJzb1AH3MuXLkRc0cP/Pu9XPSXx4J.3o4.i/1EANW', 'https://storage.autohub.ng/public/avatar/19487801891.jpg', NULL, NULL, 'affiliate', NULL, NULL, NULL, NULL, NULL, NULL, 1, 'active', 0, '2023-05-15 06:05:24', '2023-05-15 06:05:24'),
(14, 'Chika Joel', '', '', 'jib.ng44@gmail.comj', '08065999122', NULL, '$2y$10$POGZzEAXvbivaaQyMJLxle02Kn3/Pi.AxjiwrLaHFT30ebDiCTPfW', 'https://storage.autohub.ng/public/avatar/19487801891.jpg', NULL, NULL, 'buyer', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', 0, '2023-05-18 15:23:02', '2023-05-18 15:25:11'),
(15, 'J-ib', '', '', 'jib.ng44@gmail.com', '08065999122', NULL, '$2y$10$/UDRtOftqq4hldk.URiM0.nt0Lvq04V0t9ysXrM2iPx.a.yAn32W6', 'https://storage.autohub.ng/public/avatar/19487801891.jpg', NULL, NULL, 'buyer', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', 0, '2023-05-18 16:38:48', '2023-05-18 16:39:13'),
(16, 'Joel', '', '', 'autohubnigeria2@gmail.com', '08065999122', NULL, '$2y$10$.rIuxtmj1W2JNLMS.RX.VumRvRZfLdKCiWOtBxC5Ie.jKhAU13VeC', 'https://storage.autohub.ng/public/avatar/19487801891.jpg', NULL, NULL, 'buyer', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', 0, '2023-05-20 01:52:27', '2023-05-20 01:53:40'),
(17, 'bdbd', '', '', 'hdhxhd@gmail.com', '65655', NULL, '$2y$10$hk36O0kK3qDh1I7GokMJ7OVtOX3IJGXMfLsN/gpmMJa8xGKjyX0ZG', 'https://storage.autohub.ng/public/avatar/19487801891.jpg', NULL, NULL, 'buyer', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', 0, '2023-05-20 13:50:56', '2023-05-20 13:51:19'),
(18, 'bdbdbdh', '', '', 'sam@gg.com', '6748764978', NULL, '$2y$10$N.Ncl2qY08WBWwjhemft.OKZ/4ry/6Ebcf6Dgqv/uU6Fv1VBYMmq6', 'https://storage.autohub.ng/public/avatar/19487801891.jpg', NULL, NULL, 'buyer', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', 0, '2023-05-20 13:56:48', '2023-05-20 13:56:48'),
(19, 'Lamidi', '', '', 'oyedare@gmail.com', '08166939205', NULL, '$2y$10$QbhXLArt8oTwy.oQWGUg6eO2u.J4azbZlesgG5K6hzjCWJ8Suwgsi', 'https://storage.autohub.ng/public/avatar/19487801891.jpg', NULL, NULL, 'buyer', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', 0, '2023-05-20 23:33:54', '2023-05-20 23:34:31'),
(20, 'Yanachi', '', '', 'Jib.ng@yahoo.com', '09094300096', NULL, '$2y$10$WOnJwpQfMIwXuJKyD52yqeKuGRfy1opJ/OxDk1pTRlCSf8SgdWmvK', 'https://storage.autohub.ng/public/avatar/202000532191.jpg', NULL, NULL, 'buyer', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', 0, '2023-05-24 17:22:43', '2023-05-24 17:23:57'),
(21, 'Ugo Nelson', '', '', 'nelugon@gmail.com', '08034945978', NULL, '$2y$10$Dc0sMJoyOgxVW/tZPxppuufQoRZnNL5iahkTF8iHohy3MEtFqY/4W', 'https://storage.autohub.ng/public/avatar/4140698238.jpg', NULL, NULL, 'buyer', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', 0, '2023-07-09 09:50:09', '2023-07-09 09:50:09'),
(22, 'Sammy Baba', '', '', 'samji1@gmail.com', '08166939207', NULL, '$2y$10$ftcxkyOpmv.fgN3UwxPOQ.rMh5Lz0d.kwciud41UZnvwPp80QLIZO', 'https://storage.autohub.ng/public/avatar/4140698238.jpg', NULL, NULL, 'buyer', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', 0, '2023-10-04 02:51:51', '2023-10-10 15:22:20'),
(23, 'Samji', '', '', 'samji21@gmail.com', '08166939205', NULL, '$2y$10$2IBXi.ZGXckOsTxmBy1s8../KAPpOu4oPsyCKMZHYsOGVId1UdDGG', 'https://storage.autohub.ng/public/avatar/4140698238.jpg', NULL, NULL, 'affiliate', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', 0, '2023-10-04 02:58:22', '2023-10-04 02:58:22'),
(24, 'Dev Doctor', '', '', 'devdoctor001@gmail.com', '09000000001', NULL, '$2y$10$PyVEB6IVQv9i.vFiy2RXh.FHbp9WO0HY3WofSgxd3MEbmADfoa5v.', 'https://storage.autohub.ng/public/avatar/241670312413.jpg', NULL, NULL, 'buyer', NULL, NULL, NULL, NULL, NULL, NULL, 1, 'active', 0, '2023-10-11 14:00:41', '2023-12-05 11:52:56'),
(25, 'Ifeoluwa Mary Peter', '', '', 'ifemhi090@gmail.com', '07032998015', NULL, '$2y$10$EFn9RKIfhQwt5RWKDxiKDutTx6Kfv2vlJAzP/AOCUz2j0t88v.kBO', 'https://storage.autohub.ng/public/avatar/4140698238.jpg', NULL, NULL, 'buyer', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', 0, '2023-10-15 16:34:09', '2023-10-15 16:34:09'),
(26, 'Akinrinde Joel', '', '', 'softwareengineerjoycy@gmail.com', '08060929341', NULL, '$2y$10$QLT78ybH.lJ53Jp2Kxv9ru57Jt5aHi2B20FFs7Mun5qdxyZkJhdVC', 'https://storage.autohub.ng/public/avatar/4140698238.jpg', NULL, NULL, 'buyer', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', 0, '2023-10-18 12:14:33', '2023-10-18 12:14:33'),
(27, 'J-ib', '', '', 'j.j1eternal@gmail.com', '09133333357', NULL, '$2y$10$2dy2ljT3.7X7zbNrbBaIIORBpdnta1X3BTtj3RxgJrqDjQXdjOLXe', 'https://storage.autohub.ng/public/avatar/4140698238.jpg', NULL, NULL, 'buyer', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', 0, '2023-12-01 16:43:41', '2023-12-01 16:43:41'),
(28, 'Jojo', 'Maxwell', '', 'jomoney@yahoo.com', '41941941941', NULL, '$2y$10$jSAr/RwmjhwioDlJErOk9OQEO7huLz9O6Iuf/udyGbHPiTNuB3Iuy', '1721246897-193086755720359-IMG-20240715-WA0013.jpg', NULL, NULL, 'student', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', 0, '2023-12-05 11:52:27', '2024-07-17 20:30:17'),
(29, 'Jojo', '', '', 'jomoney1@gmail.com', '08166939205', NULL, '$2y$10$nLOoZ3Y/BAVTa3W.CDPl2e9rxz8rUoTbH4Nqg8Dk1ZWCq18slj9C.', 'https://storage.autohub.ng/public/avatar/4140698238.jpg', NULL, NULL, 'buyer', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', 0, '2023-12-05 15:19:16', '2023-12-05 15:19:16'),
(30, 'Xamiie', '', '', 'xamiie@duck.com', '12315648054', NULL, '$2y$10$YRQcWJG3y8/1TG7H5mPm8OoUUPxVQyPFe9TRQT0u9T/JqGYvplOmS', 'https://storage.autohub.ng/public/avatar/4140698238.jpg', NULL, NULL, 'buyer', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', 0, '2023-12-16 08:08:19', '2023-12-16 08:08:19'),
(31, 'Nbxn d', '', '', 'fasan.michael12@gmail.com', '08037053214', NULL, '$2y$10$pvnqx3j6NQw5jTFMSHHNTO.qQgeCXCTYZ9PUhP2BkvrX.uBdzT6.q', 'https://storage.autohub.ng/public/avatar/4140698238.jpg', NULL, NULL, 'buyer', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', 0, '2023-12-17 16:58:07', '2023-12-17 16:58:07'),
(62, 'Solomon', '', '', 'solomon@yahoo.com', '98987654129', NULL, '$2y$10$pPgaovaSgGmBEdBlKy2/feMnyKJF3abKIR0AnLprMsdrPKpXDf9p.', 'placard.png', NULL, NULL, 'buyer', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', 1, '2024-06-07 22:57:37', '2024-07-18 03:29:53'),
(81, 'Nelson', '', '', 'autohubafrica@gmail.com', '98987656438', NULL, '$2y$10$odufPnvIwLrMkH8NAZAYqOnj6WQYPB0q9YvM4zFVYavDpWAmscLym', '811841813201668cba9b0f44f.jpg', NULL, NULL, 'affiliate', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', 0, '2024-07-09 04:20:34', '2024-07-09 05:05:06'),
(103, 'Greatness', '', '', 'greatone@gmail.com', '08098237362', NULL, '$2y$10$asclwDee9J6tjUwHqu1fJu71hsc27EhwimdT338xC.96PkAMiIewC', '1031971073940668cd8c78168f.jpg', NULL, NULL, 'buyer', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', 0, '2024-07-09 06:29:21', '2024-07-09 06:29:27'),
(105, 'Green Festac', '', '', 'autohubafricaa@gmail.com', '98987656438', NULL, '$2y$10$jSAr/RwmjhwioDlJErOk9OQEO7huLz9O6Iuf/udyGbHPiTNuB3Iuy', '1051238337488668cd9abd3c10.jpg', NULL, NULL, 'affiliate', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', 1, '2024-07-09 06:33:07', '2024-07-09 06:48:00'),
(113, 'Gabriel', 'Maxwell', 'Kelechi', 'crazyme@yahoo.com', '08986574', NULL, '$2y$10$hlrR/j4u4TF7aC4rjgcrpuUMa9CzjjTcFT4EyDfO4DmZ5a2GB/WSC', '1721235554-400693501192146-IMG-20240715-WA0010.jpg', NULL, NULL, 'student', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', 0, '2024-07-17 16:58:31', '2024-07-17 17:05:43'),
(114, 'Julius', 'Maxwell', 'Akpan', 'hellome@yahoo.com', '9783434342', NULL, '$2y$10$.0QdB9IJnKsxmFSm8HfTGu0QmC/TUjRjpd6AUNNddtrahy3mHKddu', '1721236351-785689334118703-IMG-20240715-WA0012.jpg', NULL, NULL, 'student', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', 0, '2024-07-17 17:11:25', '2024-07-17 20:06:17'),
(115, 'Five', NULL, 'Five', 'fivefive@gmail.com', '09087654111', NULL, '$2y$10$EczipP7qSGLEOoA.tNmVf.iD.pIAaYJg2BKPhVXtBbDD3.LoeI6UK', '115966076309669885229fda9.jpg', NULL, NULL, 'buyer', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', 0, '2024-07-18 02:59:41', '2024-07-18 03:29:47'),
(116, 'Alphabet', NULL, 'Alphabet', 'alphabet@mail.com', '09890987654', NULL, '$2y$10$L9dGCIfSAVq3im.FmrFBHeKSqRtSD2vLrPVIoXXryCHLZSivO1kXC', '116402208341669885907b4b2.jpg', NULL, NULL, 'affiliate', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', 0, '2024-07-18 03:01:25', '2024-07-18 03:03:19');

-- --------------------------------------------------------

--
-- Table structure for table `user_logins`
--

CREATE TABLE `user_logins` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_ip` varchar(191) DEFAULT NULL,
  `location` varchar(191) DEFAULT NULL,
  `details` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

CREATE TABLE `user_types` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `slug` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_types`
--

INSERT INTO `user_types` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'member', 'member', '2024-06-22 01:17:56', NULL),
(2, 'student', 'student', '2024-06-22 01:17:56', NULL),
(3, 'supervisor', 'supervisor', '2024-06-22 01:19:14', NULL),
(4, 'admin', 'admin', '2024-06-22 01:19:14', NULL),
(5, 'affliate', 'affliate', '2024-06-22 01:17:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `watchlists`
--

CREATE TABLE `watchlists` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `watchlists`
--

INSERT INTO `watchlists` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 20, 7, '2023-05-24 17:27:14', '2023-05-24 17:27:14'),
(2, 4, 19, '2023-05-31 10:48:28', '2023-05-31 10:48:28'),
(3, 13, 5, '2023-06-04 05:58:55', '2023-06-04 05:58:55'),
(4, 4, 21, '2023-06-13 10:19:33', '2023-06-13 10:19:33'),
(5, 21, 19, '2023-07-09 09:57:36', '2023-07-09 09:57:36'),
(7, 4, 3, '2023-09-28 22:06:02', '2023-09-28 22:06:02'),
(8, 22, 1, '2023-10-08 10:02:49', '2023-10-08 10:02:49'),
(33, 21, 5, '2023-10-20 09:52:45', '2023-10-20 09:52:45'),
(23, 23, 13, '2023-10-18 10:27:01', '2023-10-18 10:27:01'),
(27, 13, 27, '2023-10-18 12:47:20', '2023-10-18 12:47:20'),
(30, 13, 15, '2023-10-18 12:47:43', '2023-10-18 12:47:43'),
(28, 13, 9, '2023-10-18 12:47:29', '2023-10-18 12:47:29'),
(29, 13, 20, '2023-10-18 12:47:39', '2023-10-18 12:47:39'),
(52, 28, 73, '2023-12-11 18:53:08', '2024-06-01 01:27:10'),
(50, 288, 74, '2023-12-11 18:52:58', '2024-07-04 00:07:49'),
(55, 288, 96, '2024-06-12 05:03:09', '2024-07-04 00:08:06'),
(54, 28, 72, '2024-06-01 01:28:22', '2024-06-01 01:28:22'),
(56, 28, 100, '2024-06-13 05:04:04', '2024-06-13 05:04:04'),
(57, 28, 51, '2024-06-20 05:16:35', '2024-06-20 05:16:35'),
(58, 28, 103, '2024-07-03 23:57:52', '2024-07-03 23:57:52'),
(61, 62, 114, '2024-07-18 03:31:42', '2024-07-18 03:31:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_logins`
--
ALTER TABLE `admin_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `asked`
--
ALTER TABLE `asked`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `basic_settings`
--
ALTER TABLE `basic_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_images`
--
ALTER TABLE `blog_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colours`
--
ALTER TABLE `colours`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companys`
--
ALTER TABLE `companys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conditions`
--
ALTER TABLE `conditions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversations_users`
--
ALTER TABLE `conversations_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_attendee`
--
ALTER TABLE `course_attendee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_sliders`
--
ALTER TABLE `home_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `local_governments`
--
ALTER TABLE `local_governments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `state_id` (`state_id`);

--
-- Indexes for table `make`
--
ALTER TABLE `make`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model`
--
ALTER TABLE `model`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `persins`
--
ALTER TABLE `persins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `qualifications`
--
ALTER TABLE `qualifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `running`
--
ALTER TABLE `running`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_type`
--
ALTER TABLE `sales_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sells`
--
ALTER TABLE `sells`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `swaps`
--
ALTER TABLE `swaps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `talks`
--
ALTER TABLE `talks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_webhook_paylony`
--
ALTER TABLE `tbl_webhook_paylony`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_marks`
--
ALTER TABLE `test_marks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_questionaires`
--
ALTER TABLE `test_questionaires`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_questions`
--
ALTER TABLE `test_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transmissions`
--
ALTER TABLE `transmissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trims`
--
ALTER TABLE `trims`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_logins`
--
ALTER TABLE `user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_types`
--
ALTER TABLE `user_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `watchlists`
--
ALTER TABLE `watchlists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_logins`
--
ALTER TABLE `admin_logins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `asked`
--
ALTER TABLE `asked`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_images`
--
ALTER TABLE `blog_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `colours`
--
ALTER TABLE `colours`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `companys`
--
ALTER TABLE `companys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `conditions`
--
ALTER TABLE `conditions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `conversations_users`
--
ALTER TABLE `conversations_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_attendee`
--
ALTER TABLE `course_attendee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `followers`
--
ALTER TABLE `followers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `home_sliders`
--
ALTER TABLE `home_sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `local_governments`
--
ALTER TABLE `local_governments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=775;

--
-- AUTO_INCREMENT for table `make`
--
ALTER TABLE `make`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `model`
--
ALTER TABLE `model`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1316;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `persins`
--
ALTER TABLE `persins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=579;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `qualifications`
--
ALTER TABLE `qualifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `running`
--
ALTER TABLE `running`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales_type`
--
ALTER TABLE `sales_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sells`
--
ALTER TABLE `sells`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `swaps`
--
ALTER TABLE `swaps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `talks`
--
ALTER TABLE `talks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_webhook_paylony`
--
ALTER TABLE `tbl_webhook_paylony`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `test_marks`
--
ALTER TABLE `test_marks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `test_questionaires`
--
ALTER TABLE `test_questionaires`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `test_questions`
--
ALTER TABLE `test_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transmissions`
--
ALTER TABLE `transmissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `trims`
--
ALTER TABLE `trims`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `user_logins`
--
ALTER TABLE `user_logins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_types`
--
ALTER TABLE `user_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `watchlists`
--
ALTER TABLE `watchlists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `local_governments`
--
ALTER TABLE `local_governments`
  ADD CONSTRAINT `FK` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
