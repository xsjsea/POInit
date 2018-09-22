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

ActiveRecord::Schema.define(version: 2018_09_22_215853) do

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

  create_table "metrics", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "campaign_id"
    t.integer "marketer_id"
    t.float "budget"
    t.datetime "start_date"
    t.string "description"
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