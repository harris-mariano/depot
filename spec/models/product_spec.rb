require 'rails_helper'

RSpec.describe Product, type: :model do
  fixtures :products

  it "product attributes must not be empty" do
    product = Product.new

    expect(product).to be_invalid
    expect(product.errors[:title]).to be_any
    expect(product.errors[:description]).to be_any
    expect(product.errors[:price]).to be_any
    expect(product.errors[:image_url]).to be_any
  end

  it "product price must be positive" do
    product = Product.new(
      title: 'title',
      description: 'description',
      image_url: 'ruby.jpg'
    )

    product.price = -1
    expect(product).to be_invalid

    product.price = 0
    expect(product).to be_invalid

    product.price = 1
    expect(product).to be_valid
  end

  def new_product(image_url)
    Product.new(
      title: 'fdsfas',
      description: 'sdfsdf',
      price: 1,
      image_url: image_url
    )
  end

  it "test image_url" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
              http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }
    
    ok.each do |image_url|
      expect(new_product(image_url)).to be_valid
    end

    bad.each do |image_url|
      expect(new_product(image_url)).to be_invalid
    end
  end

  it "product is not valid without a unique title" do
    product = Product.new(
      title: products(:one).title,
      description: "yyy",
      price: 3,
      image_url: "fred.gif"
    )

    expect(product).to be_invalid
    expect(product.errors[:title]).to eq(["has already been taken"])
  end
end
