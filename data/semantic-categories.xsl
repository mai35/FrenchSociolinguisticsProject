<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="xml" indent="yes" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head/>
            <body>
                <div>
                    <div>
                        <h1>Clothing</h1>
                        <ul>
                            <xsl:apply-templates select="//clothing/word"/>
                        </ul>
                    </div>
                </div>
                <div>
                    <div>
                        <h1>Personal Description</h1>
                        <xsl:apply-templates select="//personalDesc"/>
                    </div>
                </div>
                <div>
                    <div>
                        <h1>Person</h1>
                        <xsl:apply-templates select="//person"/>
                    </div>
                </div>
                <div>
                    <div>
                        <h1>Holiday</h1>
                        <xsl:apply-templates select="//holiday"/>
                    </div>
                </div>
                <div>
                    <div>
                        <h1>Tech-Related</h1>
                        <xsl:apply-templates select="//tech-related"/>
                    </div>
                </div>
                <div>
                    <div>
                        <h1>Tech</h1>
                        <xsl:apply-templates select="//tech"/>
                    </div>
                </div>
                <div>
                    <div>
                        <h1>Company</h1>
                        <xsl:apply-templates select="//company"/>
                    </div>
                </div>
                <div>
                    <div>
                        <h1>Exclamation/Abbreviation</h1>
                        <xsl:apply-templates select="//excl-abbrv"/>
                    </div>
                </div>
                <div>
                    <div>
                        <h1>TV/Movies/Media</h1>
                        <xsl:apply-templates select="//media"/>
                    </div>
                </div>
                <div>
                    <div>
                        <h1>Food</h1>
                        <xsl:apply-templates select="//food"/>
                    </div>
                </div>
                <div>
                    <div>
                        <h1>Event</h1>
                        <xsl:apply-templates select="//event"/>
                    </div>
                </div>
                <div>
                    <div>
                        <h1>Sport/Game</h1>
                        <xsl:apply-templates select="//sport-game"/>
                    </div>
                </div>
                <div>
                    <div>
                        <h1>Action</h1>
                        <xsl:apply-templates select="//action"/>
                    </div>
                </div>
                <div>
                    <div>
                        <h1>Place</h1>
                        <xsl:apply-templates select="//place"/>
                    </div>
                </div>
                <div>
                    <div>
                        <h1>Money</h1>
                        <xsl:apply-templates select="//money"/>
                    </div>
                </div>
                <div>
                    <div>
                        <h1>Description</h1>
                        <xsl:apply-templates select="//description"/>
                    </div>
                </div>
                <div>
                    <div>
                        <h1>Animal</h1>
                        <xsl:apply-templates select="//animal"/>
                    </div>
                </div>
                <div>
                    <div>
                        <h1>Medicine</h1>
                        <xsl:apply-templates select="//medicine"/>
                    </div>
                </div>
                <div>
                    <div>
                        <h1>Misc.</h1>
                        <xsl:apply-templates select="//misc"/>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="//clothing">
        <li>
            <xsl:apply-templates select="word"/>
        </li>
    </xsl:template>
</xsl:stylesheet>
