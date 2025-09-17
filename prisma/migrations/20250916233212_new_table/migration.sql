-- CreateTable
CREATE TABLE "public"."user" (
    "userid" SERIAL NOT NULL,
    "email" VARCHAR(50) NOT NULL,
    "password" VARCHAR(50) NOT NULL,
    "account_type" VARCHAR(50) NOT NULL,
    "stoken" VARCHAR(10) NOT NULL,
    "wallet_address" VARCHAR(100) NOT NULL,
    "email_status" VARCHAR(6) NOT NULL DEFAULT 'false',
    "kyc_status" VARCHAR(6) NOT NULL DEFAULT 'false',
    "user_type" VARCHAR(6) NOT NULL DEFAULT 'USER',
    "photo" VARCHAR(50) NOT NULL DEFAULT 'default.png',
    "phone" VARCHAR(50),
    "country" VARCHAR(50),
    "city" VARCHAR(20),
    "address" VARCHAR(50),
    "zipcode" VARCHAR(10),
    "dob" VARCHAR(8),
    "fullname" VARCHAR(50),
    "currency" VARCHAR(6) NOT NULL DEFAULT '$',
    "frontimage" VARCHAR(100),
    "backimage" VARCHAR(100),
    "current_trader" VARCHAR(50),
    "win_rate" VARCHAR(50),
    "trade_status" VARCHAR(50),
    "trader_profit" VARCHAR(50),
    "copiers" VARCHAR(50),
    "profit" VARCHAR(100) NOT NULL DEFAULT '0.00',
    "deposit" VARCHAR(100) NOT NULL DEFAULT '0.00',
    "withdrawal" VARCHAR(100) NOT NULL DEFAULT '0.00',
    "bonus" VARCHAR(100) NOT NULL DEFAULT '0.00',
    "activeplan" VARCHAR(100) DEFAULT 'NONE',
    "planamount" VARCHAR(100) NOT NULL DEFAULT '0.00',
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "user_pkey" PRIMARY KEY ("userid")
);

-- CreateTable
CREATE TABLE "public"."user_balances" (
    "balance_id" SERIAL NOT NULL,
    "userid" INTEGER,
    "coin_id" INTEGER,
    "available_balance" DECIMAL(18,2) NOT NULL DEFAULT 0.00,
    "on_order_balance" DECIMAL(18,2) NOT NULL DEFAULT 0.00,
    "staked_balance" DECIMAL(18,2) NOT NULL DEFAULT 0.00,

    CONSTRAINT "user_balances_pkey" PRIMARY KEY ("balance_id")
);

-- CreateTable
CREATE TABLE "public"."coins" (
    "coin_id" SERIAL NOT NULL,
    "coin_name" VARCHAR(100) NOT NULL,
    "coin_title" VARCHAR(100) NOT NULL,
    "coin_rate" DECIMAL(10,3) NOT NULL,
    "photo" VARCHAR(200) NOT NULL,
    "with_min" VARCHAR(50) NOT NULL,
    "with_max" VARCHAR(50) NOT NULL,
    "with_instructions" TEXT NOT NULL,
    "deposit_instructions" TEXT NOT NULL,
    "deposit_address" VARCHAR(100) NOT NULL DEFAULT 'Please contact support for wallet address',
    "percent" VARCHAR(50) NOT NULL,
    "coin_visible" VARCHAR(11) NOT NULL DEFAULT 'true',
    "type" VARCHAR(50),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "coins_pkey" PRIMARY KEY ("coin_id")
);

-- CreateTable
CREATE TABLE "public"."copytrader" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "photo" VARCHAR(255) NOT NULL,
    "notrades" VARCHAR(100) NOT NULL,
    "nocopiers" VARCHAR(100) NOT NULL,
    "status" VARCHAR(50) NOT NULL,
    "nowins" VARCHAR(100) NOT NULL,
    "rank" VARCHAR(50) NOT NULL,
    "strategy_desc" TEXT NOT NULL,
    "noloss" VARCHAR(100) NOT NULL,
    "profit" VARCHAR(100) NOT NULL,
    "loss" VARCHAR(50) NOT NULL,
    "edate" VARCHAR(100) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "commision" VARCHAR(100) NOT NULL DEFAULT '100',

    CONSTRAINT "copytrader_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."news" (
    "id" SERIAL NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "content" TEXT NOT NULL,
    "author" VARCHAR(100) NOT NULL,
    "type" VARCHAR(100) NOT NULL,
    "mylink" VARCHAR(200),
    "photo" VARCHAR(255) NOT NULL,
    "date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "news_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."staked_records" (
    "id" SERIAL NOT NULL,
    "userid" INTEGER NOT NULL,
    "plan_id" INTEGER NOT NULL,
    "title" VARCHAR(100) NOT NULL,
    "apy" VARCHAR(15) NOT NULL,
    "amount" DECIMAL(18,8) NOT NULL,
    "start_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "lock_period" INTEGER NOT NULL,
    "status" VARCHAR(11) DEFAULT 'active',

    CONSTRAINT "staked_records_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."staking_plans" (
    "id" SERIAL NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "coin" VARCHAR(100) NOT NULL,
    "apy" VARCHAR(50) NOT NULL,
    "lock_period" INTEGER NOT NULL,
    "minimum_amount" DECIMAL(18,8) NOT NULL DEFAULT 0.00000000,
    "maximum_amount" VARCHAR(100) NOT NULL,
    "type" VARCHAR(15) NOT NULL DEFAULT 'Locked',
    "status" VARCHAR(10) NOT NULL DEFAULT 'true',
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "staking_plans_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."trade" (
    "id" SERIAL NOT NULL,
    "volume" VARCHAR(100) NOT NULL,
    "userid" VARCHAR(100) NOT NULL,
    "coin_id" INTEGER NOT NULL,
    "trade_result" VARCHAR(100) NOT NULL,
    "sl" VARCHAR(100) NOT NULL,
    "tp" VARCHAR(100) NOT NULL,
    "type" VARCHAR(100) NOT NULL,
    "symbol" VARCHAR(100) NOT NULL,
    "status" VARCHAR(100) NOT NULL,
    "expired_time" VARCHAR(100) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "bgat" VARCHAR(100) DEFAULT '0',
    "sdat" VARCHAR(100) DEFAULT '0',
    "mdat" VARCHAR(100) DEFAULT '0',
    "trade_signal" VARCHAR(50) DEFAULT 'Processing',
    "coin_name" VARCHAR(50),

    CONSTRAINT "trade_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."tradingplans" (
    "id" SERIAL NOT NULL,
    "plan_name" VARCHAR(50) NOT NULL,
    "plan_des" VARCHAR(100) NOT NULL,
    "min_ins" VARCHAR(100) NOT NULL,
    "max_ins" VARCHAR(100) NOT NULL,
    "days_duration" VARCHAR(100) NOT NULL,
    "daily_interest_rate" VARCHAR(100) NOT NULL,
    "status" VARCHAR(50) NOT NULL,

    CONSTRAINT "tradingplans_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."transactionhistory" (
    "id" SERIAL NOT NULL,
    "coin_id" INTEGER NOT NULL,
    "userid" VARCHAR(100) NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "status" VARCHAR(100) NOT NULL,
    "method" VARCHAR(100) NOT NULL,
    "trans_time" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "trans_id" VARCHAR(100) NOT NULL,
    "amount" VARCHAR(100) NOT NULL,
    "type" VARCHAR(100) NOT NULL,
    "deposit_info" TEXT,
    "withdraw_info" TEXT,
    "copytrade_info" TEXT,
    "mining_info" TEXT,
    "auto" VARCHAR(5),
    "photo" VARCHAR(100),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "transactionhistory_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "user_email_key" ON "public"."user"("email");
