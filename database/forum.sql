-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 20, 2017 at 10:45 PM
-- Server version: 10.1.8-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `forum`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `name`, `email`, `comment`, `approved`, `post_id`, `created_at`, `updated_at`) VALUES
(1, 'yeasir arafat', 'arafat@gmail.com', 'nice post', 1, 3, '2017-02-18 14:23:02', '2017-02-18 14:23:02'),
(2, 'yeasir arafat', 'arafat@gmail.com', 'nice post', 1, 3, '2017-02-18 14:24:14', '2017-02-18 14:24:14'),
(6, 'yeasir arafat', 'arafat@gmail.com', 'good!!', 1, 2, '2017-02-18 14:30:57', '2017-02-18 14:30:57'),
(7, 'yeasir arafat', 'arafat@gmail.com', 'may be work', 1, 2, '2017-02-18 14:32:57', '2017-02-18 14:32:57'),
(10, 'yeasir arafat', 'arafat@gmail.com', 'll', 1, 2, '2017-02-18 14:35:24', '2017-02-18 14:35:24'),
(11, 'yeasir arafat', 'arafat@gmail.com', 'jkloooooooooo', 1, 3, '2017-02-18 14:38:19', '2017-02-18 14:38:19'),
(13, 'Md. Golam Rabbani', 'shemul1990@yahoo.com', 'good language\r\nyou know', 1, 1, '2017-02-19 01:47:28', '2017-02-19 01:47:28'),
(26, 'yeasir arafat', 'arafat@gmail.com', 'i want to try edit', 1, 1, '2017-02-19 11:07:50', '2017-02-20 05:26:56'),
(27, 'yeasir arafat', 'arafat@gmail.com', 'ki mone hoy kaj hobe', 1, 1, '2017-02-19 11:16:21', '2017-02-19 11:16:21'),
(31, 'Md. Golam Rabbani', 'shemul1990@yahoo.com', 'At least i have done something', 1, 2, '2017-02-20 03:49:09', '2017-02-20 03:49:09'),
(32, 'yeasir arafat', 'arafat@gmail.com', 'It''s very helpful thanks....', 1, 6, '2017-02-20 11:47:29', '2017-02-20 11:47:29'),
(34, 'yeasir arafat', 'arafat@gmail.com', 'if you want to learn modern web design first learn html5', 1, 11, '2017-02-20 15:18:17', '2017-02-20 15:20:12');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(5, '2014_10_12_000000_create_users_table', 1),
(6, '2014_10_12_100000_create_password_resets_table', 1),
(7, '2017_02_16_165936_create_posts_table', 1),
(8, '2017_02_18_051141_create_comments_table', 1),
(9, '2017_02_18_061729_add_slug_to_posts', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poster_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `content`, `category`, `poster_name`, `image`, `created_at`, `updated_at`) VALUES
(1, 'php language', 'php-post-content', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At corporis culpa cumque debitis deserunt dolor fugiat laboriosam laborum molestiae mollitia natus nihil odit perspiciatis repudiandae tempora totam ullam, ut voluptatem.\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. At corporis culpa cumque debitis deserunt dolor fugiat laboriosam laborum molestiae mollitia natus nihil odit perspiciatis , ut voluptatem.Lorem ipsum dolor sit amet, consectetur adipisicing elit. At corporis culpa cumque debitis deserunt dolor fugiat laboriosam laborum molestiae mollitia natus nihil odit perspiciatis repudiandae tempora totam ullam, ut voluptatem.', 'technology', 'Md. Golam Rabbani', '', '2017-02-18 00:58:53', '2017-02-18 01:14:40'),
(2, 'JAVA Language', 'java-language', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci deserunt eum ipsam, laudantium neque nesciunt odio omnis, perspiciatis, placeat provident quisquam quos ratione sequi? Commodi in nobis nulla quaerat voluptate?\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci deserunt eum ipsam, laudantium neque nesciunt odio omnis, perspiciatis, placeat provident quisquam quos ratione sequi? Commodi in nobis nulla quaerat voluptate?\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci deserunt eum ipsam, laudantium neque nesciunt odio omnis, perspiciatis, placeat provident quisquam quos ratione sequi? Commodi in nobis nulla quaerat voluptate?', 'technology', 'Md. Golam Rabbani', '', '2017-02-18 03:07:33', '2017-02-18 03:07:33'),
(3, 'photoshop', 'photoshop', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab ad adipisci aliquam aliquid aperiam autem ea, eaque explicabo fuga hic impedit laborum odio officia porro possimus reiciendis repellendus saepe tempora.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Ab ad adipisci aliquam aliquid aperiam autem ea, eaque explicabo fuga hic impedit laborum odio officia porro possimus reiciendis repellendus saepe tempora.\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Ab ad adipisci aliquam aliquid aperiam autem ea, eaque explicabo fuga hic impedit laborum odio officia porro possimus reiciendis repellendus saepe tempora.', 'technology', 'yeasir arafat', '', '2017-02-18 03:13:23', '2017-02-18 03:13:23'),
(4, 'mobile genious', 'mobile-genious', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab ad adipisci alias atque aut blanditiis deserunt distinctio, dolor dolorum ipsam laboriosam minus, mollitia necessitatibus nobis odio quam repellendus ut vel.\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Ab ad adipisci alias atque aut blanditiis deserunt distinctio, dolor dolorum ipsam laboriosam minus, mollitia necessitatibus nobis odio quam repellendus ut vel.\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Ab ad adipisci alias atque aut blanditiis deserunt distinctio, dolor dolorum ipsam laboriosam minus, mollitia necessitatibus nobis odio quam repellendus ut vel.', 'tips', 'yeasir arafat', '', '2017-02-18 03:14:08', '2017-02-18 03:14:08'),
(5, 'English', 'english', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab ad cum deleniti dolorem, explicabo facere hic incidunt iure magni necessitatibus praesentium rem reprehenderit rerum similique sit tenetur totam! Dignissimos, itaque.', 'tips', 'Md. Golam Rabbani', '', '2017-02-19 03:06:38', '2017-02-19 03:06:38'),
(6, 'CSS', 'css-tips-for-webdesign', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ad earum enim eos, illum nesciunt vero voluptates. Atque dignissimos esse eveniet fugiat illo inventore iusto mollitia nisi omnis qui, recusandae voluptatem.\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Ad earum enim eos, illum nesciunt vero voluptates. Atque dignissimos esse eveniet fugiat illo inventore iusto mollitia nisi omnis qui, recusandae voluptatem.', 'technology', 'yeasir arafat', '', '2017-02-20 11:14:09', '2017-02-20 11:14:38'),
(10, 'php7.1', 'php7-post', 'To enable strict mode, a single declare directive must be placed at the top of the file. This means that the strictness of typing for scalars is configured on a per-file basis. This directive not only affects the type declarations of parameters, but also a function''s return type (see return type declarations, built-in PHP functions, and functions from loaded extensions.\r\n\r\nFull documentation and examples of scalar type declarations can be found in the type declaration reference.', 'technology', 'yeasir arafat', '1487623673.png', '2017-02-20 14:47:53', '2017-02-20 14:48:39'),
(11, 'HTML 5.1', 'html-5', 'In publishing and graphic design, lorem ipsum (derived from Latin dolorem ipsum, translated as "pain itself") is a filler text commonly used to demonstrate the graphic elements of a document or visual presentation. Replacing meaningful content with placeholder text allows designers to design the form of the content before the content itself has been produced.[citation needed]\r\n\r\nThe lorem ipsum text is typically a scrambled section of De finibus bonorum et malorum, a 1st-century BC Latin text by Cicero, with words altered, added, and removed to make it nonsensical, improper Latin.[citation needed]\r\n\r\nA variation of the ordinary lorem ipsum text has been used in typesetting since the 1960s or earlier, when it was popularized by advertisements for Letraset transfer sheets. It was introduced to the Information Age in the', 'tips', 'yeasir arafat', '1487624648.png', '2017-02-20 14:51:46', '2017-02-20 15:04:08'),
(12, 'Java Script', 'java-script', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae commodi consequatur culpa, cumque debitis doloribus eius et facere, in itaque laboriosam nobis pariatur quam quidem, quisquam quo saepe veritatis voluptatibus.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae commodi consequatur culpa, cumque debitis doloribus eius et facere, in itaque laboriosam nobis pariatur quam quidem, quisquam quo saepe veritatis voluptatibus.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae commodi consequatur culpa, cumque debitis doloribus eius et facere, in itaque laboriosam nobis pariatur quam quidem, quisquam quo saepe veritatis voluptatibus.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae commodi consequatur culpa, cumque debitis doloribus eius et facere, in itaque laboriosam nobis pariatur quam quidem, quisquam quo saepe veritatis voluptatibus.', 'technology', 'Rakibul Islam', NULL, '2017-02-20 15:23:36', '2017-02-20 15:23:36'),
(13, 'lorem ipsum', 'lorem', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae commodi consequatur culpa, cumque debitis doloribus eius et facere, in itaque laboriosam nobis pariatur quam quidem, quisquam quo saepe veritatis voluptatibus.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae commodi consequatur culpa, cumque debitis doloribus eius et facere, in itaque laboriosam nobis pariatur quam quidem, quisquam quo saepe veritatis voluptatibus.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae commodi consequatur culpa, cumque debitis doloribus eius et facere, in itaque laboriosam nobis pariatur quam quidem, quisquam quo saepe veritatis voluptatibus.', 'others', 'Rakibul Islam', NULL, '2017-02-20 15:26:17', '2017-02-20 15:26:17'),
(14, 'want to be a good programmer?', 'programmer', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae commodi consequatur culpa, cumque debitis doloribus eius et facere, in itaque laboriosam nobis pariatur quam quidem, quisquam quo saepe veritatis voluptatibus.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae commodi consequatur culpa, cumque debitis doloribus eius et facere, in itaque laboriosam nobis pariatur quam quidem, quisquam quo saepe veritatis voluptatibus.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae commodi consequatur culpa, cumque debitis doloribus eius et facere, in itaque laboriosam nobis pariatur quam quidem, quisquam quo saepe veritatis voluptatibus.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae commodi consequatur culpa, cumque debitis doloribus eius et facere, in itaque laboriosam nobis pariatur quam quidem, quisquam quo saepe veritatis voluptatibus.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae commodi consequatur culpa, cumque debitis doloribus eius et facere, in itaque laboriosam nobis pariatur quam quidem, quisquam quo saepe veritatis voluptatibus.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae commodi consequatur culpa, cumque debitis doloribus eius et facere, in itaque laboriosam nobis pariatur quam quidem, quisquam quo saepe veritatis voluptatibus.', 'tips', 'Rakibul Islam', '1487626198.jpg', '2017-02-20 15:29:58', '2017-02-20 15:29:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Md. Golam Rabbani', 'shemul1990@yahoo.com', '$2y$10$kiqyBt7UyGmvcl8aKPDB/e4CTCYmlXQkDwWzUbIAy9cvxonzrZz1G', '6WtlCucp3RLyQE7vpc2qvUIatM0KWMdGcrfUaXSfVR8ol28BbHFq2zldMCt2', '2017-02-18 00:49:00', '2017-02-18 00:49:00'),
(2, 'yeasir arafat', 'arafat@gmail.com', '$2y$10$/UkCOQSzq8SH7j0HqTfMou8PGzy0t.kNkvR5.V6.h0Fmqdc2YqGMC', 'uTZX4n3eRH0zBBCdGPp1s8mvdtKNx1fySiEMibSUgWkMGX8iX942PRRerOkM', '2017-02-18 03:12:34', '2017-02-18 03:12:34'),
(3, 'Rakibul Islam', 'rakibul@gmail.com', '$2y$10$uRkmA3LMDbmyRc0ALodkSOdXC0R7SnFbqOvieSi45e37XQDt2.qJ.', NULL, '2017-02-20 15:22:13', '2017-02-20 15:22:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_post_id_foreign` (`post_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
