require "rails_helper"

describe "Items API" do
  it "can return all items" do
    get '/api/v1/items'

    expect(response).to be_success

    items = JSON.parse(response.body)
    expect(items).to be_an(Array)

    item = items.first

    expect(item).to be_a(Hash)
    expect(item).to have_key("id")
    expect(item).to have_key("name")
    expect(item).to have_key("description")
    expect(item).to have_key("image_url")
    expect(item).to_not have_key("created_at")
    expect(item).to_not have_key("updated_at")
  end

  it "can return a single item" do
    item = Item.create(name: "some item", description: "some description", image_url: "some image")

    get "/api/v1/items/#{item.id}"

    expect(response).to be_success

    found_item = JSON.parse(response.body)
    expect(found_item).to be_a(Hash)
    expect(found_item["id"]).to eq(item.id)
    expect(found_item["name"]).to eq(item.name)
    expect(found_item["description"]).to eq(item.description)
    expect(found_item["image_url"]).to eq(item.image_url)
    expect(item).to_not have_key("created_at")
    expect(item).to_not have_key("updated_at")
  end
end
