<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0" exclude-result-prefixes="xsl tei xs">
    
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes" omit-xml-declaration="yes"/>
    
    
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="partials/html_footer.xsl"/>
    <xsl:template match="/">
        <xsl:variable name="doc_title" select="'Volltextsuche'"/>
        <html  class="h-100">
            <head>
                <xsl:call-template name="html_head">
                    <xsl:with-param name="html_title" select="$doc_title"></xsl:with-param>
                </xsl:call-template>
            </head>
            
            <body class="d-flex flex-column h-100">
                <xsl:call-template name="nav_bar"/>
                    <!-- <div class="container">
                        <h1>
                            <xsl:value-of select="$doc_title"/>
                        </h1>
                                            
                    </div> -->
<div class="container-fluid">
                        <div class="search-panel">
                            <div class="search-panel__results">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div id="stats-container"></div>
                                        <h4>Volltextsuche</h4>
                                        <div id="searchbox"></div>
                                        <div id="clear-refinements"></div>
                                        <h4>Beteiligte Personen</h4>
                                        <div id="refinement-list-persons"></div>
                                        <h4>Dokumente</h4>
                                        <div id="refinement-list-doc-title"/>
                                        <!-- <h4>Dokumententyp</h4>
                                        <div id="refinement-list-doc-type"></div>
                                        <h4>Materialart</h4>
                                        <div id="refinement-list-doc-material"></div> -->
                                        <h4>Datum</h4>
                                        <div id="refinement-range-year"></div>
                                    </div>
                                    <div class="col-md-8">
                                        <!--<div id="sort-by"></div>-->
                                        <div id="current-refinements"></div>
                                        <div id="hits"></div>
                                        <div id="pagination"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <xsl:call-template name="html_footer"/>
            </body>
         <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/instantsearch.css@8.1.0/themes/algolia-min.css" />
            <link rel="stylesheet" href="css/ts_search.css"/>
            <script src="https://cdn.jsdelivr.net/npm/instantsearch.js@4.66.0/dist/instantsearch.production.min.js" />
            <script src="https://cdn.jsdelivr.net/npm/typesense-instantsearch-adapter@2/dist/typesense-instantsearch-adapter.min.js"></script>
            <script src="js/ts_search.js"></script>
            <script src="js/ts_update_url.js"></script>
        </html>
    </xsl:template>
</xsl:stylesheet>
