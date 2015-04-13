<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="xml" indent="yes" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head/>
            <body>
                    <h1>Clothing</h1>
                    <ul>
                        <xsl:for-each select="//clothing/word">
                            <li>
                                <xsl:value-of select="."/>
                            </li>
                        </xsl:for-each>
                    </ul>
                <h1>Personal Description</h1>
                <ul>
                    <xsl:for-each select="//personalDesc/word">
                        <li>
                            <xsl:value-of select="."/>
                        </li>
                    </xsl:for-each>
                </ul>
                <h1>Person</h1>
                <ul>
                    <xsl:for-each select="//person/word">
                        <li>
                            <xsl:value-of select="."/>
                        </li>
                    </xsl:for-each>
                </ul>
                <h1>Holiday</h1>
                <ul>
                    <xsl:for-each select="//holiday/word">
                        <li>
                            <xsl:value-of select="."/>
                        </li>
                    </xsl:for-each>
                </ul>
                <h1>Tech-Related</h1>
                <ul>
                    <xsl:for-each select="//tech-related/word">
                        <li>
                            <xsl:value-of select="."/>
                        </li>
                    </xsl:for-each>
                </ul>
                <h1>Tech</h1>
                <ul>
                    <xsl:for-each select="//tech/word">
                        <li>
                            <xsl:value-of select="."/>
                        </li>
                    </xsl:for-each>
                </ul>
                <h1>Company</h1>
                <ul>
                    <xsl:for-each select="//company/word">
                        <li>
                            <xsl:value-of select="."/>
                        </li>
                    </xsl:for-each>
                </ul>
                <h1>Exclamation/Abbreviation</h1>
                <ul>
                    <xsl:for-each select="//excl-abbrv/word">
                        <li>
                            <xsl:value-of select="."/>
                        </li>
                    </xsl:for-each>
                </ul>
                <h1>TV/Movies/Media</h1>
                <ul>
                    <xsl:for-each select="//media/word">
                        <li>
                            <xsl:value-of select="."/>
                        </li>
                    </xsl:for-each>
                </ul>
                <h1>Food</h1>
                <ul>
                    <xsl:for-each select="//food/word">
                        <li>
                            <xsl:value-of select="."/>
                        </li>
                    </xsl:for-each>
                </ul>
                <h1>Event</h1>
                <ul>
                    <xsl:for-each select="//event/word">
                        <li>
                            <xsl:value-of select="."/>
                        </li>
                    </xsl:for-each>
                </ul>
                <h1>Sport/Game</h1>
                <ul>
                    <xsl:for-each select="//sport-game/word">
                        <li>
                            <xsl:value-of select="."/>
                        </li>
                    </xsl:for-each>
                </ul>
                <h1>Action</h1>
                <ul>
                    <xsl:for-each select="//action/word">
                        <li>
                            <xsl:value-of select="."/>
                        </li>
                    </xsl:for-each>
                </ul>
                <h1>Place</h1>
                <ul>
                    <xsl:for-each select="//place/word">
                        <li>
                            <xsl:value-of select="."/>
                        </li>
                    </xsl:for-each>
                </ul>
                <h1>Money</h1>
                <ul>
                    <xsl:for-each select="//money/word">
                        <li>
                            <xsl:value-of select="."/>
                        </li>
                    </xsl:for-each>
                </ul>
                <h1>General Description</h1>
                <ul>
                    <xsl:for-each select="//generalDesc/word">
                        <li>
                            <xsl:value-of select="."/>
                        </li>
                    </xsl:for-each>
                </ul>
                <h1>Animal</h1>
                <ul>
                    <xsl:for-each select="//animal/word">
                        <li>
                            <xsl:value-of select="."/>
                        </li>
                    </xsl:for-each>
                </ul>
                <h1>Medicine</h1>
                <ul>
                    <xsl:for-each select="//medicine/word">
                        <li>
                            <xsl:value-of select="."/>
                        </li>
                    </xsl:for-each>
                </ul>
                <h1>Misc.</h1>
                <ul>
                    <xsl:for-each select="//misc/word">
                        <li>
                            <xsl:value-of select="."/>
                        </li>
                    </xsl:for-each>
                </ul>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
