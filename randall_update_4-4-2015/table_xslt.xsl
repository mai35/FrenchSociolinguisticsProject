<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="xml" indent="yes" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head/>
            <body>
                <table>
                    <thead>
                        <tr>
                            <th>Word</th>
                            <th>Part of Speech</th>
                            <th>Character Count</th>
                            <th>Syllable Count</th>
                        </tr>
                    </thead>
                    <xsl:for-each-group select="//anglicisme" group-by="@bf">
                        <xsl:sort select="current-grouping-key()"/>
                        <tr>
                            <td>
                                <xsl:value-of select="current-grouping-key()"/>
                            </td>
                            <td>
                                <xsl:apply-templates select="@pos"/>
                            </td>
                            <td>
                                <xsl:apply-templates select="@cc"/>
                            </td>
                            <td>
                                <xsl:apply-templates select="@sc"/>
                            </td>
                        </tr>
                    </xsl:for-each-group>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
