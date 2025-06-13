/*
 Navicat Premium Dump SQL

 Source Server         : driver
 Source Server Type    : SQLite
 Source Server Version : 3045000 (3.45.0)
 Source Schema         : main

 Target Server Type    : SQLite
 Target Server Version : 3045000 (3.45.0)
 File Encoding         : 65001

 Date: 22/05/2025 14:24:22
*/

PRAGMA foreign_keys = false;

-- ----------------------------
-- Table structure for android_metadata
-- ----------------------------
DROP TABLE IF EXISTS "android_metadata";
CREATE TABLE android_metadata (locale TEXT);

-- ----------------------------
-- Table structure for exam
-- ----------------------------
DROP TABLE IF EXISTS "exam";
CREATE TABLE "exam" (
	"id"	INTEGER NOT NULL,
	"character"	TEXT,
	"q_type"	INTEGER NOT NULL,
	"q_type_tag"	TEXT,
	"q_detail_tag"	TEXT,
	"q_konw_tag"	TEXT,
	"q_zone"	TEXT,
	"q_content"	TEXT,
	"q_img1"	TEXT,
	"q_img2"	TEXT,
	"q_opt"	TEXT,
	"q_answer"	TEXT,
	"q_point"	TEXT,
	"q_quickly_rem"	INTEGER NOT NULL,
	"q_skills"	INTEGER,
	"q_answer_detail"	INTEGER,
	"q_answer_status"	INTEGER NOT NULL DEFAULT 1,
	"q_change_date"	INTEGER,
	"q_collection_status"	INTEGER DEFAULT 0,
	"q_done_status"	INTEGER DEFAULT 1,
	"is_visible"	INTEGER DEFAULT 1,
	"sort"	INTEGER NOT NULL DEFAULT 0,
	PRIMARY KEY("id" AUTOINCREMENT)
);

-- ----------------------------
-- Table structure for exam_500
-- ----------------------------
DROP TABLE IF EXISTS "exam_500";
CREATE TABLE "exam_500" (
	"id"	INTEGER NOT NULL,
	"character"	TEXT,
	"q_type"	INTEGER NOT NULL,
	"q_type_tag"	TEXT,
	"q_detail_tag"	TEXT,
	"q_konw_tag"	TEXT,
	"q_zone"	TEXT,
	"q_content"	TEXT,
	"q_img1"	TEXT,
	"q_img2"	TEXT,
	"q_opt"	TEXT,
	"q_answer"	TEXT,
	"q_point"	TEXT,
	"q_quickly_rem"	INTEGER NOT NULL,
	"q_skills"	INTEGER,
	"q_answer_detail"	INTEGER,
	"q_answer_status"	INTEGER NOT NULL DEFAULT 1,
	"q_collection_status"	INTEGER DEFAULT 0,
	"step"	INTEGER,
	"sort"	INTEGER NOT NULL DEFAULT 0,
	PRIMARY KEY("id" AUTOINCREMENT)
);

-- ----------------------------
-- Table structure for exam_500_four
-- ----------------------------
DROP TABLE IF EXISTS "exam_500_four";
CREATE TABLE "exam_500_four" (
	"id"	INTEGER NOT NULL,
	"character"	TEXT,
	"q_type"	INTEGER NOT NULL,
	"q_type_tag"	TEXT,
	"q_detail_tag"	TEXT,
	"q_konw_tag"	TEXT,
	"q_zone"	TEXT,
	"q_content"	TEXT,
	"q_img1"	TEXT,
	"q_img2"	TEXT,
	"q_opt"	TEXT,
	"q_answer"	TEXT,
	"q_point"	TEXT,
	"q_quickly_rem"	INTEGER NOT NULL,
	"q_skills"	INTEGER,
	"q_answer_detail"	INTEGER,
	"q_answer_status"	INTEGER NOT NULL DEFAULT 1,
	"q_collection_status"	INTEGER DEFAULT 0,
	"step"	INTEGER,
	"sort"	INTEGER NOT NULL DEFAULT 0,
	PRIMARY KEY("id" AUTOINCREMENT)
);

-- ----------------------------
-- Table structure for exam_detail_explain
-- ----------------------------
DROP TABLE IF EXISTS "exam_detail_explain";
CREATE TABLE "exam_detail_explain" (
	"id"	INTEGER NOT NULL,
	"content"	TEXT,
	"pic"	TEXT,
	"key_word"	TEXT,
	PRIMARY KEY("id" AUTOINCREMENT)
);

-- ----------------------------
-- Table structure for exam_detail_explain_four
-- ----------------------------
DROP TABLE IF EXISTS "exam_detail_explain_four";
CREATE TABLE "exam_detail_explain_four" (
	"id"	INTEGER NOT NULL,
	"content"	TEXT,
	"pic"	TEXT,
	"key_word"	TEXT,
	PRIMARY KEY("id" AUTOINCREMENT)
);

-- ----------------------------
-- Table structure for exam_four
-- ----------------------------
DROP TABLE IF EXISTS "exam_four";
CREATE TABLE "exam_four" (
	"id"	INTEGER NOT NULL,
	"character"	TEXT NOT NULL,
	"q_type"	INTEGER NOT NULL,
	"q_type_tag"	TEXT,
	"q_detail_tag"	TEXT,
	"q_konw_tag"	TEXT,
	"q_zone"	TEXT,
	"q_content"	TEXT,
	"q_img1"	TEXT,
	"q_img2"	TEXT,
	"q_opt"	TEXT,
	"q_answer"	TEXT,
	"q_point"	TEXT,
	"q_quickly_rem"	INTEGER NOT NULL,
	"q_skills"	INTEGER,
	"q_answer_detail"	INTEGER,
	"q_answer_status"	INTEGER NOT NULL DEFAULT 1,
	"q_change_date"	INTEGER,
	"q_collection_status"	INTEGER DEFAULT 0,
	"q_done_status"	INTEGER,
	"is_visible"	INTEGER DEFAULT 1,
	"sort"	INTEGER NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);

-- ----------------------------
-- Table structure for exam_icon_detail
-- ----------------------------
DROP TABLE IF EXISTS "exam_icon_detail";
CREATE TABLE "exam_icon_detail" (
	"id"	INTEGER NOT NULL UNIQUE,
	"icon"	TEXT NOT NULL,
	"title"	TEXT NOT NULL,
	"desc"	TEXT NOT NULL,
	"sort"	INTEGER NOT NULL,
	"icon_status"	INTEGER DEFAULT 0,
	"step"	INTEGER,
	"category"	TEXT,
	PRIMARY KEY("id" AUTOINCREMENT)
);

-- ----------------------------
-- Table structure for exam_icon_group
-- ----------------------------
DROP TABLE IF EXISTS "exam_icon_group";
CREATE TABLE "exam_icon_group" (
	"id"	INTEGER NOT NULL UNIQUE,
	"name"	TEXT NOT NULL,
	"total"	INTEGER NOT NULL,
	"sort"	INTEGER NOT NULL,
	"cover"	TEXT, step INTEGER,
	PRIMARY KEY("id" AUTOINCREMENT)
);

-- ----------------------------
-- Table structure for exam_quick_rem
-- ----------------------------
DROP TABLE IF EXISTS "exam_quick_rem";
CREATE TABLE "exam_quick_rem" (
	"id"	INTEGER NOT NULL,
	"content"	TEXT,
	"pic"	TEXT,
	"key_word"	TEXT,
	"character"	TEXT,
	"rem_status"	INTEGER,
	"detail_tag"	INTEGER,
	PRIMARY KEY("id" AUTOINCREMENT)
);

-- ----------------------------
-- Table structure for exam_quick_rem_four
-- ----------------------------
DROP TABLE IF EXISTS "exam_quick_rem_four";
CREATE TABLE "exam_quick_rem_four" (
	"id"	INTEGER NOT NULL,
	"content"	TEXT,
	"pic"	TEXT,
	"key_word"	TEXT,
	"character"	TEXT,
	"rem_status"	INTEGER,
	"detail_tag"	INTEGER,
	PRIMARY KEY("id" AUTOINCREMENT)
);

-- ----------------------------
-- Table structure for exam_quick_skill
-- ----------------------------
DROP TABLE IF EXISTS "exam_quick_skill";
CREATE TABLE "exam_quick_skill" (
	"id"	INTEGER NOT NULL,
	"content"	TEXT,
	"pic"	TEXT,
	"key_word"	TEXT,
	PRIMARY KEY("id" AUTOINCREMENT)
);

-- ----------------------------
-- Table structure for exam_quick_skill_four
-- ----------------------------
DROP TABLE IF EXISTS "exam_quick_skill_four";
CREATE TABLE "exam_quick_skill_four" (
	"id"	INTEGER NOT NULL,
	"content"	TEXT,
	"pic"	TEXT,
	"key_word"	TEXT,
	PRIMARY KEY("id" AUTOINCREMENT)
);

-- ----------------------------
-- Table structure for exam_secret
-- ----------------------------
DROP TABLE IF EXISTS "exam_secret";
CREATE TABLE exam_secret (id INTEGER,character  TEXT, q_type INTEGER NOT NULL, q_type_tag TEXT, q_detail_tag TEXT, q_konw_tag TEXT, q_zone TEXT, q_content  TEXT, q_img1 TEXT, q_img2 TEXT, q_opt  TEXT, q_answer TEXT, q_point  TEXT, q_quickly_rem  INTEGER NOT NULL, q_skills INTEGER, q_answer_detail INTEGER, q_answer_status INTEGER NOT NULL DEFAULT 1, q_select_answer  TEXT, q_change_date  INTEGER, q_collection_status INTEGER DEFAULT 0, step INTEGER, PRIMARY KEY(id));

-- ----------------------------
-- Table structure for exam_secret_four
-- ----------------------------
DROP TABLE IF EXISTS "exam_secret_four";
CREATE TABLE exam_secret_four  (id INTEGER,character  TEXT, q_type INTEGER NOT NULL, q_type_tag TEXT, q_detail_tag TEXT, q_konw_tag TEXT, q_zone TEXT, q_content  TEXT, q_img1 TEXT, q_img2 TEXT, q_opt  TEXT, q_answer TEXT, q_point  TEXT, q_quickly_rem  INTEGER NOT NULL, q_skills INTEGER, q_answer_detail INTEGER, q_answer_status INTEGER NOT NULL DEFAULT 1, q_select_answer  TEXT, q_change_date  INTEGER, q_collection_status INTEGER DEFAULT 0, step INTEGER, PRIMARY KEY(id));

-- ----------------------------
-- Table structure for exam_special_group
-- ----------------------------
DROP TABLE IF EXISTS "exam_special_group";
CREATE TABLE "exam_special_group" (
	"id"	INTEGER,
	"itemName"	TEXT,
	"count"	INTEGER,
	"step"	INTEGER,
	"sort"	INTEGER,
	PRIMARY KEY("id")
);

-- ----------------------------
-- Table structure for mock_four_table
-- ----------------------------
DROP TABLE IF EXISTS "mock_four_table";
CREATE TABLE "mock_four_table" (
	"id"	INTEGER,
	"character"	TEXT,
	"q_type"	INTEGER NOT NULL,
	"q_type_tag"	TEXT,
	"q_detail_tag"	TEXT,
	"q_konw_tag"	TEXT,
	"q_zone"	TEXT,
	"q_content"	TEXT,
	"q_img1"	TEXT,
	"q_img2"	TEXT,
	"q_opt"	TEXT,
	"q_answer"	TEXT,
	"q_point"	TEXT,
	"q_quickly_rem"	INTEGER NOT NULL,
	"q_skills"	INTEGER,
	"q_answer_detail"	INTEGER,
	"q_answer_status"	INTEGER NOT NULL DEFAULT 1,
	"q_select_answer"	TEXT,
	"q_change_date"	INTEGER,
	"q_collection_status"	INTEGER DEFAULT 0, step INTEGER,
	PRIMARY KEY("id")
);

-- ----------------------------
-- Table structure for mock_table
-- ----------------------------
DROP TABLE IF EXISTS "mock_table";
CREATE TABLE "mock_table" (
	"id"	INTEGER,
	"character"	TEXT,
	"q_type"	INTEGER NOT NULL,
	"q_type_tag"	TEXT,
	"q_detail_tag"	TEXT,
	"q_konw_tag"	TEXT,
	"q_zone"	TEXT,
	"q_content"	TEXT,
	"q_img1"	TEXT,
	"q_img2"	TEXT,
	"q_opt"	TEXT,
	"q_answer"	TEXT,
	"q_point"	TEXT,
	"q_quickly_rem"	INTEGER NOT NULL,
	"q_skills"	INTEGER,
	"q_answer_detail"	INTEGER,
	"q_answer_status"	INTEGER NOT NULL DEFAULT 1,
	"q_select_answer"	TEXT,
	"q_change_date"	INTEGER,
	"q_collection_status"	INTEGER DEFAULT 0, step INTEGER,
	PRIMARY KEY("id")
);

-- ----------------------------
-- Table structure for model_residue_num
-- ----------------------------
DROP TABLE IF EXISTS "model_residue_num";
CREATE TABLE "model_residue_num" (
	"id"	INTEGER,
	"name"	TEXT,
	"rem_num"	INTEGER,
	"skill_num"	INTEGER,
	"step"	INTEGER,
	PRIMARY KEY("id")
);

-- ----------------------------
-- Table structure for progress
-- ----------------------------
DROP TABLE IF EXISTS "progress";
CREATE TABLE progress (id INTEGER PRIMARY KEY, model_name TEXT, model_index INTEGER);

-- ----------------------------
-- Table structure for sqlite_sequence
-- ----------------------------
DROP TABLE IF EXISTS "sqlite_sequence";
CREATE TABLE sqlite_sequence(name,seq);

-- ----------------------------
-- Table structure for version_table
-- ----------------------------
DROP TABLE IF EXISTS "version_table";
CREATE TABLE "version_table" (
	"id"	INTEGER,
	"table_name"	TEXT,
	"version"	INTEGER,
	PRIMARY KEY("id")
);

-- ----------------------------
-- Auto increment value for exam
-- ----------------------------
UPDATE "main"."sqlite_sequence" SET seq = 2290 WHERE name = 'exam';

-- ----------------------------
-- Auto increment value for exam_500
-- ----------------------------
UPDATE "main"."sqlite_sequence" SET seq = 2290 WHERE name = 'exam_500';

-- ----------------------------
-- Auto increment value for exam_500_four
-- ----------------------------
UPDATE "main"."sqlite_sequence" SET seq = 1790 WHERE name = 'exam_500_four';

-- ----------------------------
-- Auto increment value for exam_detail_explain
-- ----------------------------
UPDATE "main"."sqlite_sequence" SET seq = 36291 WHERE name = 'exam_detail_explain';

-- ----------------------------
-- Auto increment value for exam_detail_explain_four
-- ----------------------------
UPDATE "main"."sqlite_sequence" SET seq = 37195 WHERE name = 'exam_detail_explain_four';

-- ----------------------------
-- Auto increment value for exam_four
-- ----------------------------
UPDATE "main"."sqlite_sequence" SET seq = 1790 WHERE name = 'exam_four';

-- ----------------------------
-- Auto increment value for exam_icon_detail
-- ----------------------------
UPDATE "main"."sqlite_sequence" SET seq = 1724 WHERE name = 'exam_icon_detail';

-- ----------------------------
-- Auto increment value for exam_icon_group
-- ----------------------------
UPDATE "main"."sqlite_sequence" SET seq = 38 WHERE name = 'exam_icon_group';

-- ----------------------------
-- Auto increment value for exam_quick_rem
-- ----------------------------
UPDATE "main"."sqlite_sequence" SET seq = 16297 WHERE name = 'exam_quick_rem';

-- ----------------------------
-- Auto increment value for exam_quick_rem_four
-- ----------------------------
UPDATE "main"."sqlite_sequence" SET seq = 17203 WHERE name = 'exam_quick_rem_four';

-- ----------------------------
-- Auto increment value for exam_quick_skill
-- ----------------------------
UPDATE "main"."sqlite_sequence" SET seq = 26291 WHERE name = 'exam_quick_skill';

-- ----------------------------
-- Auto increment value for exam_quick_skill_four
-- ----------------------------
UPDATE "main"."sqlite_sequence" SET seq = 27200 WHERE name = 'exam_quick_skill_four';

PRAGMA foreign_keys = true;
