function [ namespaces, schemas, utilities, defaults, ...
    processes, endpoints, algorithms] = getParamsGDP

algoDir     = 'gov.usgs.cida.gdp.wps.algorithm.';
utilDir     = 'gov.usgs.cida.gdp.wps.algorithm.';


% *defaults and variables

WPS_DEFAULT_VERSION = '1.0.0'; 
WFS_DEFAULT_VERSION = '1.1.0';
datasetURI  = 'dods://cida.usgs.gov/qa/thredds/dodsC/prism';
 
% *global urls for GDP and services
WFS_URL     = 'http://cida.usgs.gov/gdp/geoserver/wfs';
UPLOAD_URL  = 'http://cida.usgs.gov/gdp/geoserver/';
PROCESS_URL = 'http://cida.usgs.gov/gdp/process/WebProcessingService';
UTILITY_URL = 'http://cida.usgs.gov/gdp/utility/WebProcessingService'; 

% *namesspace definitions
WPS_DEFAULT_NAMESPACE='http://www.opengis.net/wps/1.0.0';
OWS_DEFAULT_NAMESPACE='http://www.opengis.net/ows/1.1';

WFS_NAMESPACE   = 'http://www.opengis.net/wfs';
OGC_NAMESPACE   = 'http://www.opengis.net/ogc';
GML_NAMESPACE   = 'http://www.opengis.net/gml';
DRAW_NAMESPACE  = 'gov.usgs.cida.gdp.draw';
SMPL_NAMESPACE  = 'gov.usgs.cida.gdp.sample';
UPLD_NAMESPACE  = 'gov.usgs.cida.gdp.upload';
CSW_NAMESPACE   = 'http://www.opengis.net/cat/csw/2.0.2';
XLINK_NAMESPACE = 'http://www.w3.org/1999/xlink';
XSI_NAMESPACE   = 'http://www.w3.org/2001/XMLSchema-instance';

% *schema definitions
WPS_SCHEMA_LOCATION = ['http://schemas.opengis.net/'...
    'wps/1.0.0/wpsExecute_request.xsd'];
XSI_SCHEMA_LOCATION = 'http://www.opengis.net/wfs ../wfs/1.1.0/WFS.xsd';
GML_SCHEMA_LOCATION = ['http://schemas.opengis.net/gml/3.1.1/'...
    'base/feature.xsd'];
DRAW_SCHEMA_LOCATION = ['http://cida.usgs.gov/qa/climate/'...
    'derivative/xsd/draw.xsd'];

%% *list of namespaces available to this module
namespaces = struct(...
    'default',  WPS_DEFAULT_NAMESPACE,...
    'wps',      WPS_DEFAULT_NAMESPACE,...
    'ows',      OWS_DEFAULT_NAMESPACE,...
    'xlink',    XLINK_NAMESPACE,...
    'xsi',      XSI_NAMESPACE,...
    'wfs',      WFS_NAMESPACE,...
    'ogc',      OGC_NAMESPACE,...
    'gml',      GML_NAMESPACE,...
    'sample',   SMPL_NAMESPACE,...
    'upload',   UPLD_NAMESPACE,...
    'csw',      CSW_NAMESPACE,...
    'draw',     DRAW_NAMESPACE);

%% *list of schemas available to this module
schemas = struct(...
     'wps',     WPS_SCHEMA_LOCATION,...
     'gml',     GML_SCHEMA_LOCATION,...
     'draw',    DRAW_SCHEMA_LOCATION,...
     'xsi',     XSI_SCHEMA_LOCATION);
 
%% * list of web processing services available to this module
processes = struct(...
    'process',  PROCESS_URL,...
    'upload',   UTILITY_URL,...
    'dataList', UTILITY_URL,...
    'timeList', UTILITY_URL,...
    'emailK',   UTILITY_URL);

%% * list of web processing endpoints for services available to this module
endpoints = struct(...
    'upload',   UPLOAD_URL,...
    'wfs',      WFS_URL);

%% *list of algorithms available to this module
algorithms = struct(...
    'FWGS',     [algoDir 'FeatureWeightedGridStatisticsAlgorithm'],...
    'FCOD',     [algoDir 'FeatureCoverageOPeNDAPIntersectionAlgorithm'],...
    'FCI',      [algoDir 'FeatureCoverageIntersectionAlgorithm'],...
    'FCGC',     [algoDir 'FeatureCategoricalGridCoverageAlgorithm']);

%% *list of utilities available to this module
utilities = struct(...
    'upload',   [utilDir 'filemanagement.ReceiveFiles'],...
    'dataList', [utilDir 'discovery.ListOpendapGrids'],...
    'timeList', [utilDir 'discovery.GetGridTimeRange'],...
    'emailK',   [utilDir 'communication.EmailWhenFinishedAlgorithm']);
    
%% *list of defaults for GDP
defaults = struct(...
    'wpsVersion',  WPS_DEFAULT_VERSION,...
    'wfsVersion',  WFS_DEFAULT_VERSION,...
    'datasetURI',   datasetURI);

    

end

