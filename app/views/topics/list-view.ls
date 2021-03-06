CollectionView = require 'views/base/collection-view'
itemView = require './item-view'

module.exports = class TopicListView extends CollectionView
  item-view: item-view
  listen:
    'topic:new mediator': 'push'

  push: !-> @collection.unshift it