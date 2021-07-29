PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
INSERT INTO "schema_migrations" VALUES('20210705131619');
INSERT INTO "schema_migrations" VALUES('20210705151625');
INSERT INTO "schema_migrations" VALUES('20210705153421');
INSERT INTO "schema_migrations" VALUES('20210705153610');
INSERT INTO "schema_migrations" VALUES('20210705153710');
INSERT INTO "schema_migrations" VALUES('20210720093638');
INSERT INTO "schema_migrations" VALUES('20210720133121');
INSERT INTO "schema_migrations" VALUES('20210720161942');
CREATE TABLE "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO "ar_internal_metadata" VALUES('environment','development','2021-07-27 09:48:18.113371','2021-07-27 09:48:18.113371');
CREATE TABLE "users" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar DEFAULT '' NOT NULL, "encrypted_password" varchar DEFAULT '' NOT NULL, "reset_password_token" varchar, "reset_password_sent_at" datetime, "remember_created_at" datetime, "name" varchar NOT NULL, "profile_image_id" varchar, "introduction" text, "status" boolean DEFAULT 0 NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO "users" VALUES(1,'toshi@test','$2a$12$rkd9BGW9pt8aFmOM2Vv5k.aSIk6iMO.EkfEaEgdatsvgAp7dHdj3O',NULL,NULL,NULL,'とっしー','2a8ce69b5fc5618aafad0460abe4cdd90bbf39a9d4f15630e4839c8beced','中学からサッカーをしていました。サッカーやフットサルを一緒に出来たらと思っています。よろしくお願いします！',0,'2021-07-27 09:48:22.489649','2021-07-27 09:48:22.489649');
INSERT INTO "users" VALUES(2,'natsu@test','$2a$12$0nJjU6VOgq0uqfyYXQUEGeutItGZb0tF4uD4tpZA4RKnoL2lmd/Im',NULL,NULL,NULL,'なつ','f89870b0c60de06f60f557e5b813b52d33eecfdcaea5b99c816bef419eae','野球が好きです。よろしくお願いします！',0,'2021-07-27 09:48:22.801608','2021-07-27 09:48:22.801608');
INSERT INTO "users" VALUES(3,'shinya@test','$2a$12$V6nDeBQe5iY39TqjdivBZe6JxNLz/14xm5bHPyrYns/2fN7gccz7G',NULL,NULL,NULL,'shinya','82fb489ee8e963e28207303eef3a218f6939fe8ba72bae35ceab531d6aad','楽しくスポーツできる友達募集しています！ぜひ一緒に遊びましょう！',0,'2021-07-27 09:48:23.114252','2021-07-27 09:48:23.114252');
INSERT INTO "users" VALUES(4,'misa@test','$2a$12$nhQrYjMTuBNvp/tAqzutDuxK.IC0oy0sU7xhRrpH94iswNGZsG5.y',NULL,NULL,NULL,'ミサ','7db09822bdba59547174ab6f86f35d624bf3b696cfd4b94a0e7969244258','バスケ一緒に楽しめる人を募集しています！',0,'2021-07-27 09:48:23.427006','2021-07-27 09:48:23.427006');
INSERT INTO "users" VALUES(5,'hori@test','$2a$12$J.GJ2gwN3Pl3vrbrMJEvn.wv6q81olJ3a68CvyYHnp.roVB/o2ajm',NULL,NULL,NULL,'ほり',NULL,NULL,0,'2021-07-27 09:48:23.735596','2021-07-27 09:48:23.735596');
CREATE TABLE "recruitments" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer NOT NULL, "sport" integer NOT NULL, "title" varchar NOT NULL, "event_date" datetime NOT NULL, "due_date" datetime NOT NULL, "prefecture" integer NOT NULL, "place" varchar NOT NULL, "recruit_number" integer NOT NULL, "level" integer NOT NULL, "body" text NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO "recruitments" VALUES(1,1,2,'「どなたでも歓迎！」一緒にサッカーを楽しめる方募集！','2021-07-31 13:00:00','2021-07-30 18:00:00',13,'渋谷駅そばの体育館　※詳細は個別にお伝えします',2,6,'どなたでも歓迎です！2時間ほどを予定しています。詳細は個別にお答えします。
DMお待ちしています^^','2021-07-27 09:52:19.108956','2021-07-27 09:52:19.108956');
INSERT INTO "recruitments" VALUES(2,1,3,'フットサルしませんか？','2021-08-07 13:00:00','2021-08-05 18:00:00',13,'調布',1,2,'駅の近くなので車がない方でも参加できます！
2時間ほどを予定しています。少しでも興味がある方はDMで連絡お待ちしています！！','2021-07-27 09:58:37.802070','2021-07-27 09:58:37.802070');
INSERT INTO "recruitments" VALUES(3,2,1,'楽しく野球しましょう！','2021-08-07 10:30:00','2021-08-06 17:00:00',11,'大宮',2,6,'ユニフォームがない方はサイズがあればお貸しします！ユニフォーム詳細は連絡お待ちしています。
雰囲気はだれでも楽しめるような雰囲気だと思います！年齢はバラバラなので気にしなくても大丈夫だと思います。参加お待ちしてます！','2021-07-27 10:08:36.200989','2021-07-27 10:08:36.200989');
INSERT INTO "recruitments" VALUES(4,2,1,'ゆる～くキャッチボールしませんか？','2021-08-05 11:00:00','2021-08-03 21:00:00',11,'大宮公園',2,6,'友達2人と合計3人でキャッチボールをすることになったのですがもう少し人数を増やしても楽しいかなと思って募集をかけました^^。募集人数に2人と書きましたが何人でも大丈夫です！お話ししながらゆるくキャッチボールしませんか？連絡お待ちしています！','2021-07-27 10:15:29.133191','2021-07-27 10:15:29.133191');
INSERT INTO "recruitments" VALUES(5,3,31,'最近スケボーにはまってます！','2021-08-11 18:00:00','2021-08-10 21:00:00',14,'横浜',2,6,'最近始めたのでまだまだ初心者ですが週に二回ぐらい趣味としてやっています。
初心者の方は一緒に楽しめればいいなと思ってます^^
上手な方に来てもらえたら教えてほしいです！(笑)
とにかくどなたでも歓迎なので連絡お待ちしています！','2021-07-27 10:39:16.803952','2021-07-27 10:39:16.803952');
INSERT INTO "recruitments" VALUES(6,3,5,'バスケしましょう！','2021-08-08 17:00:00','2021-08-07 21:00:00',14,'横浜',3,6,'横浜にある体育館でバスケを予定しています。現在7人ほど集まっているのであと3人ぐらいほしいところです。試合形式で3時間ほどを予定していますが予定があれば途中で退出していただいてもかまいません！
ゆるい雰囲気になると思うので経験のない方、浅い方でも楽しめるかと思います。
連絡お待ちしています！^^','2021-07-27 10:47:17.942405','2021-07-27 10:47:17.942405');
INSERT INTO "recruitments" VALUES(7,1,3,'「２回目！」フットサル仲間募集！','2021-08-20 17:00:00','2021-08-18 22:00:00',13,'渋谷駅そばの体育館　※詳細は個別にお伝えします',1,4,'前回も募集させていただいたのですが、今回は少しレベルの高い方を募集しようかと思います。
現在集まってくれている方々が全員経験者なので今回は少しレベルが高いかと思われます。
コートはこちらで予約するので、興味がある方はぜひDMお待ちしています！','2021-07-27 10:54:32.888998','2021-07-27 10:54:32.888998');
INSERT INTO "recruitments" VALUES(8,4,5,'【女性も大歓迎！】バスケ一緒にしませんか？','2021-08-10 17:30:00','2021-08-08 20:00:00',27,'HOOP7 堺店',3,6,'初めまして！ミサと申します！
女性が5名ほど参加予定なので女性も気軽に参加できると思います。
年齢は20代が多いです。良かったら参加しませんか？
メンバーや雰囲気が気になる方は連絡をいただければお答えします。
気になってもらえたらぜひ連絡お待ちしています！','2021-07-27 11:04:35.921284','2021-07-27 11:04:35.921284');
INSERT INTO "recruitments" VALUES(9,2,1,'草野球に参加してくれる方募集しています！','2021-08-21 09:30:00','2021-08-18 21:00:00',11,'大宮',2,6,'8月21日に草野球をする予定です。グローブとスパイクは持参になりますがユニフォームはお貸しいたします。
元々チームでやっているのですが参加人数が少し足りないため募集させていただきました。
勝敗にこだわらずに楽しい雰囲気でやっているので遠慮なく連絡ください！

※当日はユニフォーム、飲み物、軽食等こちらで準備しているので申し訳ございませんが1人500円徴収させていただきたいと思っています。','2021-07-27 11:14:14.677087','2021-07-27 11:14:14.677087');
INSERT INTO "recruitments" VALUES(10,4,5,'バスケしましょう！','2021-08-12 17:00:00','2021-08-10 21:00:00',27,'HOOP7 堺店',3,2,'勝敗は置いといて楽しい雰囲気でできればと考えています！
時間が平日の少し早い時間なので遅れての参加でも全然大丈夫です。
ご興味あれば連絡お待ちしています！','2021-07-27 11:18:48.953999','2021-07-27 11:18:48.953999');
INSERT INTO "recruitments" VALUES(11,3,31,'スケボー教えてください！(笑)🛹','2021-08-06 18:00:00','2021-08-05 22:00:00',14,'横浜',1,6,'スケボーを最近始めたのですが、うまい人に教えてもらいたいです！
もし教えてもいいよっていう方がいたらご連絡ください！
よろしくお願いします！！','2021-07-27 11:26:44.908971','2021-07-27 11:26:44.908971');
CREATE TABLE "blogs" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer NOT NULL, "sport" integer NOT NULL, "title" varchar NOT NULL, "blog_image_id" varchar, "body" text NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO "blogs" VALUES(1,1,3,'前回FindSportsを使ってフットサルをしました！！',NULL,'やっぱりみんなでやると楽しいですね！思ったより人数が集まってうれしかったです^^
前回参加してくれた方はまた参加してもらえると嬉しいです！
もちろん新規の方もお待ちしています！！','2021-07-27 10:18:52.151122','2021-07-27 10:18:52.151122');
CREATE TABLE "blog_likes" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer NOT NULL, "blog_id" integer NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO "blog_likes" VALUES(1,4,1,'2021-07-27 11:19:36.914074','2021-07-27 11:19:36.914074');
CREATE TABLE "blog_comments" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer NOT NULL, "blog_id" integer NOT NULL, "comment" text NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO "blog_comments" VALUES(1,4,1,'みんなでやると楽しいですよね！^^','2021-07-27 11:19:57.826627','2021-07-27 11:19:57.826627');
CREATE TABLE "chats" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "room_id" integer, "message" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "rooms" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "user1_id" integer, "user2_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "relationships" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "follower_id" integer, "followed_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO "relationships" VALUES(1,1,2,'2021-07-27 09:49:24.275324','2021-07-27 09:49:24.275324');
INSERT INTO "relationships" VALUES(2,1,3,'2021-07-27 09:49:29.602420','2021-07-27 09:49:29.602420');
INSERT INTO "relationships" VALUES(3,2,1,'2021-07-27 09:59:52.663306','2021-07-27 09:59:52.663306');
INSERT INTO "relationships" VALUES(4,2,4,'2021-07-27 10:00:21.306235','2021-07-27 10:00:21.306235');
INSERT INTO "relationships" VALUES(5,3,1,'2021-07-27 10:29:46.826702','2021-07-27 10:29:46.826702');
INSERT INTO "relationships" VALUES(6,3,5,'2021-07-27 10:29:54.782811','2021-07-27 10:29:54.782811');
INSERT INTO "relationships" VALUES(7,3,4,'2021-07-27 10:29:58.668266','2021-07-27 10:29:58.668266');
INSERT INTO "relationships" VALUES(8,4,3,'2021-07-27 11:19:22.116229','2021-07-27 11:19:22.116229');
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('users',5);
INSERT INTO "sqlite_sequence" VALUES('relationships',8);
INSERT INTO "sqlite_sequence" VALUES('recruitments',11);
INSERT INTO "sqlite_sequence" VALUES('blogs',1);
INSERT INTO "sqlite_sequence" VALUES('blog_likes',1);
INSERT INTO "sqlite_sequence" VALUES('blog_comments',1);
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
COMMIT;
