require "rails_helper"

describe "Items API" do
  it "can return all items" do
    create_list(:item, 3)

    get '/api/v1/items'

    expect(response).to be_success
    expect(response.status).to eq(200)

    found_items = JSON.parse(response.body)

    expect(found_items).to be_an(Array)
    expect(found_items.count).to eq(3)

    found_item = found_items.first

    expect(found_item).to be_a(Hash)
    expect(found_item).to have_key("id")
    expect(found_item).to have_key("name")
    expect(found_item).to have_key("description")
    expect(found_item).to have_key("image_url")
    expect(found_item).to_not have_key("created_at")
    expect(found_item).to_not have_key("updated_at")
  end

  it "can return a single item" do
    item = Item.create(name: "some item", description: "some description", image_url: "some image")

    get "/api/v1/items/#{item.id}"

    expect(response).to be_success
    expect(response.status).to eq(200)

    found_item = JSON.parse(response.body)
    expect(found_item).to be_a(Hash)
    expect(found_item["id"]).to eq(item.id)
    expect(found_item["name"]).to eq(item.name)
    expect(found_item["description"]).to eq(item.description)
    expect(found_item["image_url"]).to eq(item.image_url)
    expect(found_item).to_not have_key("created_at")
    expect(found_item).to_not have_key("updated_at")
  end

  it "can delete an item" do
    item = create(:item)

    delete "/api/v1/items/#{item.id}"

    expect(response).to be_success
    expect(response.status).to eq(204)

    expect(Item.count).to eq(0)
  end

  it "can create an item" do
    post "/api/v1/items?name=some_name&description=some_description&image_url=some_image"

    expect(response).to be_success
    expect(response.status).to eq(201)

    returned_item = JSON.parse(response.body)

    expect(returned_item["id"]).to eq(1)
    expect(returned_item["name"]).to eq("some_name")
    expect(returned_item["description"]).to eq("some_description")
    expect(returned_item["image_url"]).to eq("some_image")
    expect(returned_item).to_not have_key("created_at")
    expect(returned_item).to_not have_key("updated_at")
  end
end
