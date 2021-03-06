// Generated by CoffeeScript 1.9.1
(function() {
  var clusters;

  clusters = require('./api/clusters');

  module.exports = function(app) {
    app.get('/moirai/clusters', clusters.handleGetClusters);
    app.post('/moirai/clusters', clusters.handleCreateCluster);
    app.get('/moirai/clusters/:clusterId', clusters.handleGetCluster);
    app["delete"]('/moirai/clusters/:clusterId', clusters.handleDestroyCluster);
    app.put('/moirai/clusters/:clusterId/keys', clusters.handleSetKeys);
    app.put('/moirai/clusters/:clusterId/start', clusters.handleStartCluster);
    return app.put('/moirai/clusters/:clusterId/stop', clusters.handleStopCluster);
  };

}).call(this);
