# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_09_20_213142) do

  create_table "areas", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "areaName"
    t.integer "area_level"
    t.integer "area_sequence"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "campaigns", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.date "start"
    t.float "budget"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "parent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "post_id"
    t.string "comment_content"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contracts", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "creator_id"
    t.integer "marketer_id"
    t.integer "campaigns_id"
    t.float "contract_price"
    t.datetime "down_payment_date"
    t.float "down_payment"
    t.datetime "rest_payment_date"
    t.float "rest_payment"
    t.string "contract_image"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "creator_exts", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "userid"
    t.string "tags_set"
    t.string "avatar"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "creator_metrics", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "creator_id"
    t.string "metric_id"
    t.string "metric_name"
    t.string "metric_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flows", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "flow_type"
    t.string "flow_name"
    t.integer "flow_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "met_admin_array", id: :integer, unsigned: true, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "array_name", null: false
    t.text "admin_type", null: false
    t.integer "admin_ok", default: 0, null: false
    t.string "admin_op", limit: 20, default: "metinfo"
    t.integer "admin_issueok", default: 0, null: false
    t.integer "admin_group", null: false
    t.integer "user_webpower", null: false
    t.integer "array_type"
    t.string "lang", limit: 50
    t.string "langok", default: "metinfo"
  end

  create_table "met_admin_column", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 100
    t.string "url"
    t.integer "bigclass", null: false
    t.integer "field", null: false
    t.integer "type", null: false
    t.integer "list_order", default: 0
    t.string "icon"
    t.text "info", null: false
  end

  create_table "met_admin_table", id: :integer, unsigned: true, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "admin_type", null: false
    t.string "admin_id", limit: 15, null: false
    t.string "admin_pass", limit: 64
    t.string "admin_name", limit: 30, null: false
    t.boolean "admin_sex", default: true, null: false
    t.string "admin_tel", limit: 20
    t.string "admin_mobile", limit: 20
    t.string "admin_email", limit: 150
    t.string "admin_qq", limit: 12, null: false
    t.string "admin_msn", limit: 40, null: false
    t.string "admin_taobao", limit: 40, null: false
    t.text "admin_introduction"
    t.integer "admin_login", default: 0, null: false, unsigned: true
    t.string "admin_modify_ip", limit: 20
    t.datetime "admin_modify_date"
    t.datetime "admin_register_date"
    t.datetime "admin_approval_date"
    t.integer "admin_ok", default: 0, null: false
    t.string "admin_op", limit: 20, default: "metinfo"
    t.integer "admin_issueok", default: 0, null: false
    t.integer "admin_group", null: false
    t.string "companyname"
    t.string "companyaddress"
    t.string "companyfax"
    t.integer "usertype", default: 0
    t.integer "checkid", default: 0
    t.string "companycode", limit: 50
    t.string "companywebsite", limit: 50
    t.text "cookie", null: false
    t.text "admin_shortcut", null: false
    t.string "lang", limit: 50
    t.integer "content_type", limit: 1
    t.string "langok", default: "metinfo"
    t.index ["admin_id"], name: "admin_id"
  end

  create_table "met_app", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "no", limit: 10, null: false
    t.string "ver", limit: 10, null: false
    t.string "name", limit: 50, null: false
    t.string "file", null: false
    t.boolean "download", null: false
    t.integer "power", null: false
    t.string "sys", null: false
    t.string "img", null: false
    t.string "site", null: false
    t.text "url", limit: 255, null: false
    t.text "info", null: false
    t.integer "addtime", null: false
    t.integer "updatetime", null: false
  end

  create_table "met_app_plugin", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "no_order", null: false
    t.integer "no", null: false
    t.string "m_name", null: false
    t.string "m_action", null: false
    t.boolean "effect", null: false
  end

  create_table "met_applist", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "no", null: false
    t.string "ver", limit: 50, null: false
    t.string "m_name", limit: 50, null: false
    t.string "m_class", limit: 50, null: false
    t.string "m_action", limit: 50, null: false
    t.string "appname", limit: 50, null: false
    t.text "info", null: false
    t.integer "addtime", null: false
    t.integer "updateime", null: false
  end

  create_table "met_column", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 100
    t.string "foldername", limit: 50
    t.string "filename", limit: 50
    t.integer "bigclass", default: 0
    t.integer "samefile", default: 0, null: false
    t.integer "module"
    t.integer "no_order"
    t.integer "wap_ok", default: 0
    t.integer "if_in", default: 0
    t.integer "nav", default: 0
    t.string "ctitle", limit: 200
    t.string "keywords", limit: 200
    t.text "content", limit: 4294967295
    t.text "description"
    t.integer "list_order", default: 0
    t.string "new_windows", limit: 50
    t.integer "classtype", default: 1
    t.string "out_url", limit: 200
    t.integer "index_num", default: 0
    t.integer "access", default: 0
    t.string "indeximg"
    t.string "columnimg"
    t.integer "isshow", default: 1
    t.string "lang", limit: 50
    t.string "namemark"
    t.integer "releclass", default: 0
    t.integer "display", default: 0
  end

  create_table "met_config", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.text "value", null: false
    t.text "mobile_value", null: false
    t.integer "columnid", null: false
    t.integer "flashid", null: false
    t.string "lang", limit: 50, null: false
  end

  create_table "met_cv", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "addtime"
    t.integer "readok", default: 0
    t.string "customerid", limit: 50, default: "0"
    t.integer "jobid", default: 0, null: false
    t.string "lang", limit: 50
    t.string "ip"
  end

  create_table "met_download", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", limit: 200
    t.string "ctitle", limit: 200
    t.string "keywords", limit: 200
    t.text "description"
    t.text "content", limit: 4294967295
    t.integer "class1", default: 0
    t.integer "class2", default: 0
    t.integer "class3", default: 0
    t.integer "no_order", default: 0
    t.integer "new_ok", default: 0
    t.integer "wap_ok", default: 0
    t.string "downloadurl"
    t.string "filesize", limit: 100
    t.integer "com_ok", default: 0
    t.integer "hits", default: 0
    t.datetime "updatetime"
    t.datetime "addtime"
    t.string "issue", limit: 100, default: ""
    t.integer "access", default: 0
    t.integer "top_ok", default: 0
    t.integer "downloadaccess", default: 0
    t.string "filename"
    t.string "lang", limit: 50
    t.integer "recycle", default: 0, null: false
    t.integer "displaytype", default: 1, null: false
    t.text "tag", null: false
  end

  create_table "met_feedback", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "class1", default: 0
    t.string "fdtitle"
    t.string "fromurl"
    t.string "ip"
    t.datetime "addtime"
    t.integer "readok", default: 0
    t.text "useinfo"
    t.string "customerid", limit: 30, default: "0"
    t.string "lang", limit: 50
  end

  create_table "met_flash", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "module"
    t.string "img_title"
    t.string "img_path"
    t.string "img_link"
    t.string "flash_path"
    t.string "flash_back"
    t.integer "no_order"
    t.integer "width"
    t.integer "height"
    t.integer "wap_ok", default: 0, null: false
    t.string "lang", limit: 50
  end

  create_table "met_flist", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "listid"
    t.integer "paraid"
    t.text "info"
    t.string "lang", limit: 50
    t.integer "module"
  end

  create_table "met_ifcolumn", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "no", null: false
    t.string "name", limit: 50, null: false
    t.string "appname", limit: 50, null: false, comment: "应用名称"
    t.boolean "addfile", default: true, null: false
    t.boolean "memberleft", default: false, null: false
    t.boolean "uniqueness", default: false, null: false
    t.string "fixed_name", limit: 50
  end

  create_table "met_ifcolumn_addfile", id: :integer, unsigned: true, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "no", null: false
    t.string "filename", null: false
    t.string "m_name", null: false
    t.string "m_module", null: false
    t.string "m_class", null: false
    t.string "m_action", null: false
  end

  create_table "met_ifmember_left", id: :integer, unsigned: true, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "no", null: false
    t.integer "columnid", null: false
    t.string "title", limit: 50, null: false
    t.string "foldername", null: false
    t.string "filename", null: false
  end

  create_table "met_img", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", limit: 200
    t.string "ctitle", limit: 200
    t.string "keywords", limit: 200
    t.text "description"
    t.text "content", limit: 4294967295
    t.integer "class1", default: 0
    t.integer "class2", default: 0
    t.integer "class3", default: 0
    t.integer "no_order", default: 0
    t.integer "wap_ok", default: 0
    t.integer "new_ok", default: 0
    t.string "imgurl"
    t.string "imgurls"
    t.text "displayimg"
    t.integer "com_ok", default: 0
    t.integer "hits", default: 0
    t.datetime "updatetime"
    t.datetime "addtime"
    t.string "issue", limit: 100, default: ""
    t.integer "access", default: 0
    t.integer "top_ok", default: 0
    t.string "filename"
    t.string "lang", limit: 50
    t.text "content1"
    t.text "content2"
    t.text "content3"
    t.text "content4"
    t.string "contentinfo"
    t.string "contentinfo1"
    t.string "contentinfo2"
    t.string "contentinfo3"
    t.string "contentinfo4"
    t.integer "recycle", default: 0, null: false
    t.integer "displaytype", default: 1, null: false
    t.text "tag", null: false
  end

  create_table "met_job", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "position", limit: 200
    t.integer "count", default: 0
    t.string "place", limit: 200
    t.string "deal", limit: 200
    t.date "addtime"
    t.integer "useful_life"
    t.text "content", limit: 4294967295
    t.integer "access", default: 0
    t.integer "no_order", default: 0
    t.integer "wap_ok", default: 0
    t.integer "top_ok", default: 0
    t.string "email"
    t.string "filename"
    t.string "lang", limit: 50
    t.integer "displaytype", default: 1, null: false
  end

  create_table "met_label", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "oldwords"
    t.string "newwords"
    t.string "newtitle"
    t.string "url"
    t.integer "num", default: 99, null: false
    t.string "lang", limit: 50
  end

  create_table "met_lang", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.integer "useok", null: false
    t.integer "no_order", null: false
    t.string "mark", limit: 50, null: false
    t.string "synchronous", limit: 50, null: false
    t.string "flag", limit: 100, null: false
    t.string "link", null: false
    t.integer "newwindows", null: false
    t.integer "met_webhtm", null: false
    t.string "met_htmtype", limit: 50, null: false
    t.string "met_weburl", null: false
    t.string "lang", limit: 50, null: false
  end

  create_table "met_language", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.text "value", null: false
    t.boolean "site", null: false
    t.integer "no_order", default: 0, null: false
    t.integer "array", null: false
    t.integer "app", null: false
    t.string "lang", limit: 50, null: false
  end

  create_table "met_link", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "webname"
    t.string "weburl"
    t.string "weblogo"
    t.integer "link_type", default: 0
    t.string "info"
    t.string "contact"
    t.integer "orderno", default: 0
    t.integer "com_ok", default: 0
    t.integer "show_ok", default: 0
    t.datetime "addtime"
    t.string "lang", limit: 50
    t.string "ip"
  end

  create_table "met_list", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "bigid"
    t.string "info"
    t.integer "no_order"
    t.string "lang", limit: 50
  end

  create_table "met_message", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "ip"
    t.datetime "addtime"
    t.integer "readok", default: 0
    t.text "useinfo"
    t.string "lang", limit: 50
    t.integer "access", default: 0
    t.string "customerid", limit: 30, default: "0"
  end

  create_table "met_mlist", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "listid"
    t.integer "paraid"
    t.text "info"
    t.string "lang", limit: 50
    t.string "imgname"
    t.integer "module"
  end

  create_table "met_news", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", limit: 200
    t.string "ctitle", limit: 200
    t.string "keywords", limit: 200
    t.text "description"
    t.text "content", limit: 4294967295
    t.integer "class1", default: 0
    t.integer "class2", default: 0
    t.integer "class3", default: 0
    t.integer "no_order", default: 0
    t.integer "wap_ok", default: 0
    t.integer "img_ok", default: 0
    t.string "imgurl"
    t.string "imgurls"
    t.integer "com_ok", default: 0
    t.string "issue", limit: 100
    t.integer "hits", default: 0
    t.datetime "updatetime"
    t.datetime "addtime"
    t.integer "access", default: 0
    t.integer "top_ok", default: 0
    t.string "filename"
    t.string "lang", limit: 50
    t.integer "recycle", default: 0, null: false
    t.integer "displaytype", default: 1, null: false
    t.text "tag", null: false
  end

  create_table "met_online", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 200
    t.integer "no_order"
    t.text "qq"
    t.string "msn", limit: 100
    t.string "taobao", limit: 100
    t.string "alibaba", limit: 100
    t.string "skype", limit: 100
    t.string "lang", limit: 50
  end

  create_table "met_otherinfo", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "info1"
    t.string "info2"
    t.string "info3"
    t.string "info4"
    t.string "info5"
    t.string "info6"
    t.string "info7"
    t.text "info8"
    t.text "info9"
    t.text "info10"
    t.string "imgurl1"
    t.string "imgurl2"
    t.string "rightmd5"
    t.string "righttext"
    t.text "authcode"
    t.string "authpass"
    t.string "authtext"
    t.text "data", limit: 4294967295
    t.string "lang", limit: 50
  end

  create_table "met_parameter", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 100
    t.text "description", null: false
    t.integer "no_order"
    t.integer "type"
    t.integer "access", default: 0
    t.integer "wr_ok", default: 0
    t.integer "class1", null: false
    t.integer "class2", null: false
    t.integer "class3", null: false
    t.integer "module"
    t.string "lang", limit: 50
    t.integer "wr_oks", default: 0
  end

  create_table "met_plist", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "listid"
    t.integer "paraid"
    t.text "info"
    t.string "lang", limit: 50
    t.string "imgname"
    t.integer "module"
  end

  create_table "met_product", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", limit: 200
    t.string "ctitle", limit: 200
    t.string "keywords", limit: 200
    t.text "description"
    t.text "content", limit: 4294967295
    t.integer "class1", default: 0
    t.integer "class2", default: 0
    t.integer "class3", default: 0
    t.text "classother", null: false
    t.integer "no_order", default: 0
    t.integer "wap_ok", default: 0
    t.integer "new_ok", default: 0
    t.string "imgurl"
    t.string "imgurls"
    t.text "displayimg"
    t.integer "com_ok", default: 0
    t.integer "hits", default: 0
    t.datetime "updatetime"
    t.datetime "addtime"
    t.string "issue", limit: 100, default: ""
    t.integer "access", default: 0
    t.integer "top_ok", default: 0
    t.string "filename"
    t.string "lang", limit: 50
    t.text "content1"
    t.text "content2"
    t.text "content3"
    t.text "content4"
    t.string "contentinfo"
    t.string "contentinfo1"
    t.string "contentinfo2"
    t.string "contentinfo3"
    t.string "contentinfo4"
    t.integer "recycle", default: 0, null: false
    t.integer "displaytype", default: 1, null: false
    t.text "tag", null: false
  end

  create_table "met_skin_table", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "skin_name", limit: 200
    t.string "skin_file", limit: 20
    t.text "skin_info"
    t.integer "devices", default: 0, null: false
  end

  create_table "met_sms", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "time", null: false
    t.integer "type", null: false
    t.text "content", null: false
    t.text "tel", null: false
    t.string "remark", null: false
  end

  create_table "met_visit_day", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "ip", limit: 30, null: false
    t.integer "acctime", null: false
    t.string "visitpage", null: false
    t.string "antepage", null: false
    t.integer "columnid", null: false
    t.integer "listid", null: false
    t.string "browser", null: false
    t.string "dizhi", null: false
    t.string "network", limit: 100, null: false
    t.string "lang", limit: 50, null: false
  end

  create_table "met_visit_detail", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false, collation: "utf8_bin"
    t.integer "pv", default: 0, null: false
    t.integer "ip", default: 0, null: false
    t.integer "alone", default: 0, null: false
    t.string "remark", null: false, collation: "utf8_bin"
    t.integer "type", default: 0, null: false
    t.integer "columnid", null: false
    t.integer "listid", null: false
    t.integer "stattime", null: false
    t.string "lang", limit: 50, null: false
  end

  create_table "met_visit_summary", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "pv", default: 0, null: false
    t.integer "ip", default: 0, null: false
    t.integer "alone", null: false
    t.text "parttime", null: false
    t.integer "stattime", null: false
  end

  create_table "metrics", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "post_author"
    t.string "post_date"
    t.string "post_title"
    t.string "post_content"
    t.string "post_status"
    t.datetime "post_modified"
    t.string "post_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "campaign_id"
    t.integer "flow_name"
    t.integer "flow_order"
    t.datetime "starts_on"
    t.datetime "ends_on"
    t.integer "workdays"
    t.integer "status"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "social_accounts", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "creator_id"
    t.string "phone"
    t.string "mobile"
    t.string "qq"
    t.string "wechat"
    t.string "email"
    t.string "skype"
    t.string "google"
    t.string "yahoo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "tag_type"
    t.string "tag_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "status"
    t.string "usertype"
    t.string "username"
    t.string "truename"
    t.string "password"
    t.integer "province_id"
    t.integer "city_id"
    t.integer "distirct_id"
    t.string "address"
    t.string "user_comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
