<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml" version="2.0">
    <xsl:output indent="yes" method="xml" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <header>
                <xsl:apply-templates select="article/header/titre"/>
            </header>
            <body>
                <h1>
                    <xsl:apply-templates select="article/header/titre"/>
                </h1>
                <ol>
                    <xsl:apply-templates select="article/corps/ol/li/titre"/>
                </ol>
                <hr/>
                <h2>La Liste</h2>
                <xsl:apply-templates select="//ol"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="//li">
        <h3>
            <xsl:apply-templates select="titre"/>
        </h3>
        <li>
            <xsl:apply-templates select="commentaire"/>
        </li>
    </xsl:template>
    <xsl:template match="//anglicisme">
        <anglicisme>
            <xsl:choose>
                <xsl:when test="@pos='noun'">
                    <xsl:attribute name="style">font-style:italic;</xsl:attribute>
                </xsl:when>
                <xsl:when test="@pos='adjective'">
                    <xsl:attribute name="style">font-style:bold;</xsl:attribute>
                </xsl:when>
                <xsl:otherwise/>
            </xsl:choose>
            <xsl:apply-templates/>
        </anglicisme>
    </xsl:template>
    <xsl:template match="article/corps/ol/li/titre" mode="toc">
        <li>
            <a href="#{//li/titre}">
                <xsl:apply-templates/>
            </a>
        </li>
    </xsl:template>
</xsl:stylesheet>
<!--I ran into trouble trying to get the linking to work. I had a list at the beginning of the document, but I lost it when I was trying to create a linking toc like in xslt 5. I could not figure out what I was doing wrong that caused the titles of the list items to appear as one large group of text in what was supposed to be an ordered list at the beginning.-->
