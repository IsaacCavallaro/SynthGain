
# TOC

[Set up](#setup)

[Login Accounts](#login)

[Problem](#problem)  

[Purpose](#purpose)

[Target Audience](#targetaudience) 

[Tech Stack](#techstack) 

[App Screenshots](#screenshots)

[Wireframes](#wireframes)

[User Stories](#userstories)  

[ERD](#erd)  

[Third Party Services](#thirdparty)

[Active record associations](#activerecord)

[Database relations](#databaserelations)

[Project Management](#trello)


---
<a name="setup"/></a>
# Set up instructions for local server

1. Clone this repo.

        git clone https://github.com/IsaacCavallaro/SynthGain.git

2. Run Bundle install to install all gems.

        bundle install

3. Rake db:setup to create local database migrate and seed.

        rake db:setup 
        rake db:migrate 
        rake db:seed

4. Enter credentials for Stripe.

- Head to https://stripe.com/en-au

5. Run the rails server.

        rails s

6. Load [http://localhost:3000/](http://localhost:3000/) in the browser.

<a name="login"/></a>
# Login Accounts

Email  | Password |   
| ------------ | :-------|    
| test@test.com | `testing` 
| mrtest@test.com | `testing`  
| mrstest@test.com | `testing`

--- 
<a name="problem"/></a>
# Identification of the problem you are trying to solve by building this particular marketplace app.

- Currently, there are no online Marketplaces **dedicated** to **buying** and **selling vintage synthesizers.**

- The commonplace to buy and sell vintage synthesizers are *Ebay, Facebook Marketplace* and the online music marketplace *Reverb*. While each of these platforms are stable and allow users to buy and sell various music equipment, none of them specialise in buying and selling vintage synthesizers. In this manner, they each favour the **quantity of products** available over the **quality of products** they sell; compromising the standards of these transactions. This quantity over quality attitude demonstrated from the above-mentioned platforms misses the opportunity for a sincere community to develop. With a focus on the quantity of transactions and products, these platforms foster a transactional relationship between buyers and sellers to which *SythnGain* makes progress towards solving.

- As of 2021, Ebay has a total of 1.7 billion listings with 187 million eBay users worldwide. These numbers in conjunction with the quantity over quality attitude makes it difficult for Ebay to set up systems and protocols that successfully and reliably deliver musical instruments; specifically, musical instruments that are fragile and have many working parts. According to the GSP agreement on Ebay, if an item cannot be shipped due to size or regulations, Ebay can refund the buyer and resell the item. While this may seem an appropriate action to take, in many cases, buyers and sellers have been late to find out about such changes within the transaction and as a result, have been disappointed with the experience. Additionally, Ebay's terms may be amended at any time with a simple posting to the eBay site; to which such terms will take effect immediately. Clearly this is a necessary procedure for such a large enterprise though it further illustrates the implications of a quantity over quality model.

- Another example of the quantity over quality model is evident with the social media marketing platform Facebook hosting approximately 1.74 billion active users every month. Clearly this is an advantage if you are aiming to make quick sales and target are very large audience, but again, that does not foster a sincere community revolving around a central theme outside of transactions.

- Finally, the online marketplace *Reverb* is fundamentally a trusted and reliable source for users to buy and sell equipment. The site is led by musicians and includes protection policies for both the buyer and the seller. *Reverb* does provide an outlet to buy and sell vintage synthesizes however, this is one category among many instruments with each category of instruments having a wide range of factors that go into the selling and distribution.

- In summary, while each of the above mention platforms successfully allow users to buy and sell vintage synthesizers, each platform displays a prioritisation in the quantity of products available, or the quantity of transactions and as a result, misses the opportunity to create and maintain a community which revolves around a central theme. By aiming to solve the problem of buying and selling anything or all musical instruments, these platforms create other problems and make the error of thinking that limitations are somehow a negative quality.

# Why is it a problem that needs solving?

# Link to deployed app

https://synth-gain.herokuapp.com/

# Link to Github Repo

https://github.com/IsaacCavallaro/SynthGain

# Description of SynthGain

<a name="purpose"/></a>
## Purpose

- To connect lovers of vintage synthesizers within a digital community.
- Unlike other online marketplaces which sell various music equipment, *SynthGain* is dedicated to buying and selling synthesizers.
- Allows vintage analogue synthesizers to be safely purchased and sold by individuals who understand the properties and challenges of maintaining a vintage synthesizer in the modern world.
- There is an expectation at *SynthGain* that you have a background in music or understand the mechanics involved in maintaining a vintage synthesizer.
- *SynthGain* is a place for lovers of vintage synthesizers to buy and sell these beautiful instruments.

---
## Benefits of SynthGain

- Connecting lovers of vintage synths.
- Dedicated platform for selling and purchasing vintage synths.
- Secure third party payment system with low transaction fees (Stripe fees < 3%).
- Allowing vintage synths to remain "active" in the community and not end up collecting dust.
- By dedicating its demographic to the community of synth lovers, there is a reduction in propagating opportunists who wish to use the platform as a place to make money.

---

## Functionality/features

- *SynthGain* allows viewers of the site to become a member with a simple and secure signup procedure using the authentication provided by **Devise.**

- This authorisation restricts guests from purchasing a listing if they are not a member. However, *SynthGain* allows guests pursuing *SynthGain* the ability to view and search for a listing they may be interested in purchasing. Furthermore, guests can see the profile of the user who is selling each item they are considering purchasing.

- After becoming a member of *SynthGain*, users have the ability to easily **create** and **edit** their **user profile** which includes a profile image and their location details.

---

## Target Audience

- Musicians looking for an online environment that is limited to buying and selling vintage synthesizers.

- Musicians who are wanting an online platform to buy and sell vintage synthesizers without requiring a facebook account.
- Individuals who don't want to use a social media platform in order to sell or buy vintage synthesizers.
- Individuals who have had bad experiences buying or selling music equipment (specifically vintage synthesizers) on other platforms like ebay, facebook marketplace.

---

<a name="techstack"/></a>
## Tech Stack

- **Languages**
    - HTML5 - Website Markup

    - CSS3 - Website Styling
    - JavaScript - Website Styling
    - Ruby - Application Back-end

- **Ruby on Rails**

    - Server-side web application framework

- **PostgreSQL**

    - Relational Database Management System

- **Heroku**

    - Cloud Platform for hosting web applications

- **Amazon S3 (Simple Storage Service)**

    - Cloud Object Storage via a web service interface

---
## Sitemap v1

![Sitemap version one](app/assets/images/synth_gain_sitemap_1.png)


## Sitemap v2

---
<a name="screenshots"/></a>
## SynthGain Screenshots

---

## Landing Page 

![Landing Page](app/assets/images/landingpage.png)

---

## Buyer Page

![Buy listing page](app/assets/images/buylistings.png)

---
## Search by Title Keyword Page

![Search title](app/assets/images/searchtitle.png)

---

## User Profile

![User Profile](app/assets/images/userprofile.png)

---

## Listing Show Page

![Listing show](app/assets/images/listingshow.png)

---

## Seller Profile Page

![Seller Profile Page](app/assets/images/sellerprofilepage.png)

---

## Create New Listing Page

![Create Listing](app/assets/images/createlisting.png)

---

## Edit or Delete Listing 

![Sitemap version one](app/assets/images/edit_delete_listing.png)

---

## Edit User Profile

![Sitemap version one](app/assets/images/edit_user_profile.png)

---

## About page

![Sitemap version one](app/assets/images/aboutpage.png)


## Stripe Payment

![Sitemap version one](app/assets/images/stripepayment.png)

## Payment Receipt

![Sitemap version one](app/assets/images/stripereceipt.png)

---
<a name="wireframes"/></a>
# Wireframes


## Landing Page
![Wireframe home page](app/assets/images/wireframehome.png)

----

## Buyer Page
![Wireframe buyer page](app/assets/images/wireframebuyerpage.png)

----

## Search by title Page
![Wireframe search title page](app/assets/images/wireframesearchbytitle.png)

## Listing Show Page
![Wireframe listing show page](app/assets/images/wireframelistingshowpage.png)


## Seller Profile Page
![Wireframe seller profile page](app/assets/images/wireframesellerprofilepage.png)

## Create New Listing Page
![Create new listing page](app/assets/images/wireframecreatelisting.png)


<a name="userstories"/></a>
# User stories

### ***As a Guest of SynthGain***

- I want to be able to **view listings** and **search** for specific synthesizes by title so that I can quickly find the synth I am looking for to provide a simple user experience.

- I want to be able to **view** the **profile of the seller** so that I can see whether the seller is trustworthy.

- I want to have a **secure** way to sign up for *SynthGain* ****so that I can be assured my information is safe.

---

### ***As a Seller of SynthGain***

- I want to be able to **create** **listings** that include an **image**, descriptions and a category so that my listing details are clear.

- I want to be able to **edit** my listings (change price, image etc) so that I can update my listings if circumstances change.

- I want to be able to **delete** any of my listings so that I can **remove** any listings I no longer wish to **sell.**

- I want to be able to **receive payment** digitally and in a secure manner so that I don't have to carry change or cash to sell any listings.
- I want to be able to have access to the user's profile who is purchasing my listing so that I can track sales and the users interacting with my profile.

---

### ***As a Buyer of SynthGain***

- I want to be able to search for **specific synthesizers** by using **keywords** related to the items title, so that I can find the appropriate synth I wish to purchase.

- I want to be able to see the details of the synthesizer (image, category etc) so that I can understand the condition of the synth I wish to purchase.

- I want to be able to see the **profile of a seller** so that I can see where they live and can connect with them.

- I want to be able to make **payments securely** and see the **receipts of my purchases** so that I can have a record of my transactions.

---

### ***Authentication & Authorisation of SynthGain***

- I do not want other users to be able to access my account so I am ensured my items and details are protected.

- I do not want other users to be able to edit or delete my listings so that I am ensured that my listings are up to date.

---
<a name="erd"/></a>
# SynthGain ERD's

## ERD v1

- Prior to building the application, I designed the first version of an ERD for *SynthGain*:

![ERD version one](app/assets/images/ERD_one.png)

---

## ERD v2

- While this process of creating ERD v1 was useful in the initial planning and development stages, as the app began to grow, I considered implementing more features. Specifically, I wanted to include a cart feature. This can be seen in the image below:

![ERD version two](app/assets/images/ERD_two.png)

## ERD Final

- Unfortunately, this cart feature was not able to be implemented due to the deadline of producing an MVP fast approaching. In the end, the MVP was the priority and I decided to remove my cart and join tables and simplify the ERD and app.

![ERD version two](app/assets/images/ERD_final.png)

---
<a name="thirdparty"/></a>
# Third Party Services

## Devise:

- Devised is a ruby gem that creates sign-up and sign-in forms with user authentication.

---

## Bootstrap:

- Boostrap is a HTML, CSS and JavaScript library which I used to implement styling across the app. Specifically, bootstrap was used for the navbar, buttons and card layouts.

---

## Heroku

- Heroku allows developers to deploy, run and manage their applications written in a various languages; one such including the Ruby language. This is one of the reasons I selected Heroku as the service for deploying *SynthGain*. Specifically, I used the heroku-postgresql service with the free hobby-dev plan. Given the Heroku Postgres is integrated directly into the Heroku CLI, I was able to use my terminal to setup my database for production. In addition to these outlined reasons, Heroku has 60+ Billion Requests per Day and over 13 million created apps, claiming to "get[s] out of the way where it matters, letting devs get on with what they do best - developing apps".

---

## AWS

- Cloud storage of files and images used and uploaded to the app. This cloud platform supported by Amazon is scalable, reliable and a secure storage method. Specifically, *SynthGain* implements the S3 service provided by AWS. This was achieved through creating a bucket with Amazon S3; allowing me to store images on their service. While *SythGain* is relatively small, the app includes a number of images which may potentially exceed the room available on the free tier of Heroku deployment. Therefore, by creating a bucket with Amazon S3, I could strategically store a number of images on their service and avoid exceeding the limit with Heroku.For more information on AWS and specifically Amazon S3, click [here](https://docs.aws.amazon.com/AmazonS3/latest/userguide/Welcome.html).

---

## Ransack

- Ransack is a Ruby gem that creates simple search forms and filtering; allowing users of Synthgain the ability to search for listings by their title.

---

## Stripe

- Stripe is an online payments platform which I chose to implement SynthGain with in order to provide users a cashless and secure third party service in which they can make transactions. In addition to being a recognized payment platform, Stripe provids a well-documented API for integrating it with Ruby on Rails applications. Stripe claims that 89% of all credit cards have been processed on a Stripe network at some point in addition to the company powering the transactions of household brands including Pinterest, Blue Apron, Under Armour and Lyft. Given Stripes ability to handle 135 + currencies and frequent use between companies which do business internationally, it seems fitting to trust Stripe for this project.  One other reason I chose to implement Stripe was because of their low transaction fees.

---

## Ultrahook

- SynthGain uses ultrahook to provide a public webhook endpoint to receive realtime information from Stripe. Specifically, Ultrahook is a gem which provides an internet reachable URL from the computer. Ultrahook will then forward the request on to my localhost. After signing up, Ultrahook emailed me an API key which gave me an exclusive namespace, allowing me to create subdomains under my namespace; ensuring the same endpoints upon future reconnections.

---

<a name="activerecord"/></a>
# SynthGain's models and their active record associations

Below is a list of *SynthGain's* **central models** and what they represent.

---

### User

- The User model represents the users of the *SynthGain* app. This includes users who wish to sell or buy listings on the app.

---
### User_info

- The User_info model represents the user profile which includes the Users location details.

---

### Listing

- The Listing model represents the products (in this case synthesizers).

---

### Feature

- The Feature model represents the features of the Listing. Since a Listing can have many features which can be associated with many listings, a join table was created. This can be seen in the ERD and additionally by the next model included in this list, feature_listing.

---

### Feature_listing

- See above

---

### Category

- The Category model represents what category the Listing falls under. This app uses three categories:

    - Modular

    - Monophonic

    - Polyphonic

---

### Payment

- The Payment model represents the orders/purchases made which are associated with the User and the Listing purchased.

---

## Rails associations

- Rails supports six types of associations, namely:

    - belongs_to
    - has_one
    - has_many
    - has_many :through
    - has_one :through
    - has_and_belongs_to_many


This project uses the first five outlined above.
- The list below again illustrates the central models to this app but with the addition of their corresponding associations.

---

### User

- has_many :listings

    - This indicates a one-to-many connection with the Listing model.

    - In order to implement this relationship, the Listings table requires the User_id as a foreign key in addition to setting up this association between the models. This can be seen in the projects schema line 133: **add_foreign_key "listings", "users"**

    - In short, a user of SynthGain can sell or buy many synthesizers.

- has_one :user_info
    - This association indicates that the User model has reference to this model. In other words, the User model can fetch User_info data through this association.
    - In order to implement this relationship, the User_info table requires the User_id as a foreign key in addition to setting up this association between the models. This can be seen in the projects schema line 136: **add_foreign_key "user_infos", "users"**
    - In short, A user will only have one profile and cannot have many profiles associated with their user account.


---

### User_info

- belongs_to :user

    - This belongs to User association sets up a connection between User_info and the User model.

    - As mentioned above, user_infos is a foreign key for the users table. In this manner, the user_info "belongs to" the user.

- has_one_attached :picture

    - This sets up a one-to-one mapping between records and files in such that each record can have one file (picture) attached to it.

---

### Listing

- belongs_to :category

    - This belongs to Category association sets up a connection between the Listing and the Category model.

- belongs_to :user
    - This belongs to User association sets up a connection between Listing and the User model.

- has_many :feature_listings

    - This has many feature_listings indicates a one-to-many connection with the feature_listing model.

- has_many :features, through: :feature_listing

    - This has many through association sets up the many-to-many connection between Listing and Features.

---

### Feature

- has_many :feature_listings

    - This has many feature_listings indicates a one-to-many connection with the feature_listing model.

- has_many :listings, through: :feature_listings

    - This has many through association sets up the many-to-many connection between Feature and Listings.

---

### Feature_listing

- belongs_to :listing

    - This belongs to Listing association sets up a connection between Feature Listing and Listing model.


- belongs_to :feature

    - This belongs to Feature association sets up a connection between Feature Listing and the feature model.

---

### Category

- has_many :listings

    - This has many Listings association sets up a connection between Category and Listings.

    - In short, a category can be related to many Listings where as a Listing will only have one category.

---

### Payment

- has_many :listings

    - This has many Listings association sets up a connection between Payment and Listings.

    - In short, a Payment can be related to many Listings whereas a Listing will only be associated with one Payment.
- has_one :user
    - The has one user association illustrates that a Payment will only reference one user and not many.

---

<a name="databaserelations"/></a>
# Database relations implemented in SynthGain

### User & Listing

- When looking at the relationship between User and Listing, it can be seen that:

    - A User has many Listings.

    - A Listing belongs to a User.

- This active record association between a User and Listing represents **a one-to-many association.**

- This relationship is evident in the final Entity Relationship Diagram (ERD). Importantly, the * refers to many while the 1 does not. In other words, the 1 may refer to either a **belongs to** or **has one** while the * refers to **has many**.

- The image below illustrates this relationship clearly and demonstrates that a User **has many** Listings while a Listing **belongs to** one User.

![User and Listing relationship](app/assets/images/ERD_User_Listing.png)

### User & User_info

- When looking at the relationship between User and User_info, it can be seen that:

    - A User has one User_info.

    - User_info belongs to a User and has one attached picture.
- This active record association between a User and Listing represents a **one-to-one** association.

- The image below illustrates this relationship clearly and demonstrates that a User **has one** User info while the User Info **belongs to** one User.

![User and Listing relationship](app/assets/images/ERD_User_UserInfo.png)

### Listing & Category

- When looking at the relationship between Listing and Category, it can be seen that:

    - A Listing belongs to Category.

    - A Category has many Listings.

- This active record association between a Listing and Category represents a **one-to-many** association.
- The image below illustrates this relationship clearly and demonstrates that a Listing **belongs to** a Category while a Category **has many** Listings.

![User and Listing relationship](app/assets/images/ERD_Listing_Category.png)


### Listing,  Feature_listing & Feature

- Given that a Listing can have many Features which can be associated with many Listings, a join table was created to break up a many to many association between the Listing and Feature. This join table can be seen with the model Feature_listing. Without this join table, the relationship would be:

    - A Listing has many Features.

    - A Feature has many Listings.

- By implementing this join table Feature_listing, the relationships are:

    - A Listing has many Feature Listings.

    - A Listing has many Features through Feature Listings.

    - A Feature has many Feature Listings.

    - A Feature has many Listings through Feature Listings.

- The image below illustrates this breaking up of a many to many relationship between the Listing and Feature tables by including the FeatureListing table as a join table. In this manner, a Listing can have many Features through Feature Listings while a Feature may be associated with many Listings.

![User and Listing relationship](app/assets/images/ERD_Listing_FeatureListing.png)


# Schema file 

```ruby
ActiveRecord::Schema.define(version: 2021_08_05_022207) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "feature_listings", force: :cascade do |t|
    t.bigint "listing_id", null: false
    t.bigint "feature_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["feature_id"], name: "index_feature_listings_on_feature_id"
    t.index ["listing_id"], name: "index_feature_listings_on_listing_id"
  end

  create_table "features", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "installs", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_installs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_installs_on_reset_password_token", unique: true
  end

  create_table "listings", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.float "price"
    t.boolean "availability"
    t.integer "condition"
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["category_id"], name: "index_listings_on_category_id"
    t.index ["user_id"], name: "index_listings_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string "payment_intent_id"
    t.string "receipt_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "listing_id", null: false
    t.bigint "user_id", null: false
    t.index ["listing_id"], name: "index_payments_on_listing_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "user_infos", force: :cascade do |t|
    t.string "country"
    t.string "city"
    t.string "street"
    t.integer "postcode"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_user_infos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "feature_listings", "features"
  add_foreign_key "feature_listings", "listings"
  add_foreign_key "listings", "categories"
  add_foreign_key "listings", "users"
  add_foreign_key "payments", "listings"
  add_foreign_key "payments", "users"
  add_foreign_key "user_infos", "users"
end
```
<a name="trello"/></a>
# Task allocation for SynthGain

## Link to Trello Board

To see the Trello board click [here](https://trello.com/b/VAERKf1d/synthgain).

## Trello Board overview

In order to manage this project effectively, I applied Agile project management concepts which allowed me to approach tasks incrementally. This approach was implemented using a Trello Board, allowing me to visually see the various tasks, their deadline and corresponding priority within completing this project. Upon the release of this project, I prioritised setting up my Trello Board before taking action towards any other areas this project required (wireframes, ERDs, coding etc). By initially limiting myself to planning out how this project will be approached in conjunction with the features of Trello, I could use my time effectively and follow the tasks allocated within my Trello Board. 

Initially, the decision was made to create four lists within Trello:

- Tasks
- To do today
- In Progress
- Done

While I believe this system may have been enough to manage this project, I made the decision to include two more lists:

- Bugs
- Extra features (optional)

My aim here was to have a list that can easily track any bugs that are introduced over the course of developing the project; allowing me to continue working on the appropriate task with the confidence that such bugs have been noted and can be addressed at a later stage. Overall, my board consisted of six lists with each list carrying cards dedicated to tasks this project requires. These tasks include the documentation, presentation and code elements of this project. In this manner, Trello was used to manage and track all areas of this project.


## Trello Screenshots
![User and Listing relationship](app/assets/images/trellochecklist.png)

--- 

![User and Listing relationship](app/assets/images/trellopage.png)

--- 

![User and Listing relationship](app/assets/images/trellopagetwo.png)

## Version Control

In addition to the above outlined Agile project management system I applied to this project, I made regular use of version control allowing me to recall specific versions of the project during different stages of its build. This was done using GIT locally while taking advantage of GIT's ability to store data as a series of "snapshots". After I made commits to my local machine, I would push them to Github as my remote repository of choice for this project. While this approach of making regular commits and pushing those to my remote Github repository was effective in the initial stages of building SynthGain, the limitations of this method became evident as the project continued to grow. In this manner, costs of being creative within my local environment outweighed the benefits of implementing new features; if such costs meant breaking the code a little too much. To solve this, I took advantage of creating multiple branches with each branch solving their own purpose. By doing so, I could safely make changes and strategically test removing or adding new features to the application with the comfort of knowing that it will not affect the progress I had made prior to working on this new branch. Once I was happy with the work done within this branch, I would commit the changes, push them to Github, merge the changes on Github, switch to my master branch on my local machine make a pull request to my master branch. 