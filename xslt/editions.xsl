<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:local="http://dse-static.foo.bar"
    version="2.0" exclude-result-prefixes="xsl tei xs local">
    
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes" omit-xml-declaration="yes" />
    
    
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="./partials/html_footer.xsl"/>
    <xsl:import href="./partials/osd-container.xsl"/>
    <xsl:import href="partials/tei-facsimile.xsl"/>
    <xsl:variable name="prev">
        <xsl:value-of
            select="replace(tokenize(data(tei:TEI/@prev), '/')[last()], '.xml', '.html')"/>
    </xsl:variable>
    <xsl:variable name="next">
        <xsl:value-of select="replace(tokenize(data(tei:TEI/@next), '/')[last()], '.xml', '.html')"
        />
    </xsl:variable>
    <xsl:variable name="teiSource">
        <xsl:value-of select="data(tei:TEI/@xml:id)"/>
        <xsl:text>.xml</xsl:text>
    </xsl:variable>
    <xsl:variable name="doc_title">
        <xsl:value-of select=".//tei:titleStmt/tei:title[1]/text()"/>
    </xsl:variable>
    <xsl:variable name="link">
        <xsl:value-of select="replace($teiSource, '.xml', '.html')"/>
    </xsl:variable>
    <xsl:param name="mybreak"><![CDATA[<br/>]]></xsl:param>
    <xsl:param name="mytab"><![CDATA[&emsp;]]></xsl:param>
    <xsl:param name="myplaceholder"><![CDATA[&zwnj;]]></xsl:param>
    <xsl:param name="myline"><![CDATA[<hr />]]></xsl:param>
   
    <xsl:template match="/">    
        <html class="page" lang="de">
            <head>
                <xsl:call-template name="html_head">
                    <xsl:with-param name="html_title" select="$doc_title"/>
                </xsl:call-template>
            </head>
            <body class="d-flex flex-column">
                <div class="hfeed site flex-grow-1" id="page">
                    <xsl:call-template name="nav_bar"/>
                    <div class="edition_container ">
                        <div class="offcanvas offcanvas-start" tabindex="-1"
                            id="offcanvasNavigation" aria-labelledby="offcanvasNavigationLabel"
                            data-bs-scroll="true" data-bs-backdrop="false">
                            <div class="offcanvas-header" />
                            <div class="offcanvas-body" />
                        </div>
                        <div class="offcanvas offcanvas-end" tabindex="0" id="offcanvasOptions"
                            aria-labelledby="offcanvasOptionsLabel" data-bs-scroll="true"
                            data-bs-backdrop="false">
                        </div>
                        <div class="wp-transcript">
                            <div class="row" id="edition_metadata">
                                <div class="col-md-8 col-lg-8 col-sm-12 docinfo">
                                    <xsl:variable name="doc_type"
                                        select="//tei:sourceDesc/tei:msDesc/tei:physDesc/tei:objectDesc/@form[1]"/>
                                    <h1 align="center">
                                        <xsl:value-of select="$doc_title"/>
                                    </h1>
                                    <h3 align="center">
                                        <a href="{$teiSource}">
                                            <i class="bi bi-download" title="TEI/XML"/>
                                        </a>
                                    </h3>
                                </div>
                            </div>
                            <div id="container-resize" class="row transcript active">
                                <div id="img-resize" class="col-md-6 col-lg-6 col-sm-12 facsimiles">
                                    <div id="viewer">
                                        <div id="container_facs_1"/>
                                        <!-- container and facs handling in js -->
                                    </div>
                                </div>
                                <div id="text-resize" lang="de"
                                    class="col-md-6 col-lg-6 col-sm-12 text yes-index">
                                    <xsl:apply-templates/>
                                    <div id="section">
                                        <xsl:for-each select="//tei:body/tei:div" >
                                            <div class="card-body non_mimetic_lbs" />
                                             <!--    <xsl:apply-templates/>
                                            </div> -->
                                        </xsl:for-each>
                                    </div>
                                </div>
                            </div>
                            <!-- create list* elements for entities bs-modal -->
                        </div>
                    </div>
                </div>
                <xsl:call-template name="html_footer"/>
                <script src="https://unpkg.com/de-micro-editor@0.3.2/dist/de-editor.min.js"/>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/openseadragon/4.1.0/openseadragon.min.js"/>
                <script type="text/javascript" src="js/osd_scroll.js"/>
                <!-- <script type="text/javascript" src="js/run.js"/> -->
                <script type="text/javascript" src="js/offcanvastoggler.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="tei:p">
        <xsl:variable name="pid">
            <xsl:value-of select="./@xml:id"/>
        </xsl:variable>
        <p id="{$pid}" class="yes-index">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="tei:pb">
        <span class="anchor-pb" />
        <span class="pb" source="{@facs}"><xsl:value-of select="./@n" /></span>
    </xsl:template>
    <xsl:template match="tei:div">
        <xsl:variable name="pid">
            <xsl:value-of select="./@xml:id"/>
        </xsl:variable>
        <div id="{$pid}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>  
</xsl:stylesheet>