<?xml version='1.0' ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<testsuites>
			<xsl:for-each select="OWASPZAPReport/site/alerts/alertitem">
				<testsuite>
					<xsl:attribute name="id">
						<xsl:value-of select="riskcode"/>
					</xsl:attribute>
					<xsl:attribute name="name">
						<xsl:value-of select="riskdesc"/>
					</xsl:attribute>
					<testcase>
						<xsl:attribute name="classname"/>
						<xsl:attribute name="name">
							<xsl:value-of select="name"/>
						</xsl:attribute>
						<failure>
							<xsl:attribute name="message">
								<xsl:value-of select="replace(replace(concat('Description: ', desc, ' Solution: ', solution, ' Reference: ', reference), '&lt;p&gt;', ''), '&lt;/p&gt;', ' ')"/>
							</xsl:attribute>
						</failure>
					</testcase>
				</testsuite>
			</xsl:for-each>
		</testsuites>
	</xsl:template>
</xsl:stylesheet>