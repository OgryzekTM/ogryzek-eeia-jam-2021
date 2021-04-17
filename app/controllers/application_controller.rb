# frozen_string_literal: true

class ApplicationController < ActionController::API
  private

  def serialize(collection, adapter = :json, serializer: nil)
    serializer ||= if collection.is_a?(Array)
                     "#{collection.first.class.name}Serializer".constantize
                   else
                     "#{collection.class.name}Serializer".constantize
                   end
    return [] if collection.is_a?(Array) && collection&.empty?

    ActiveModelSerializers::SerializableResource.new(
      collection,
      each_serializer: serializer,
      adapter: adapter
    ).as_json
  end
end
