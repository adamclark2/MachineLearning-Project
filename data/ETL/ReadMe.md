# ETL (Extract, Transform, & Load)
An attempt to convert the .pdf files containing UMS salary data into a csv or similar

# Sample Run

        mvn package
        java -jar ./target/ETLScript-1.jar ../../PUBLICINFO-April-2016-1.pdf > ../../UMS_APR_2016.csv

# Mvn Script (A Note-To-Self)
`mvn archetype:generate -DgroupId=edu.usm.cos475.etl -DatrifactId=ETLScript -DarchetypeArtifactId=maven-archetype-quickstart`

Copy these over to

        <properties>
            <maven.compiler.source>1.8</maven.compiler.source>
            <maven.compiler.target>1.8</maven.compiler.target>
        </properties>

        <build>
            <plugins>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-shade-plugin</artifactId>
                <version>3.2.0</version>
                <executions>
                <execution>
                    <phase>package</phase>
                    <goals>
                    <goal>shade</goal>
                    </goals>
                    <configuration>
                    <transformers>
                        <transformer implementation="org.apache.maven.plugins.shade.resource.ManifestResourceTransformer">
                        <mainClass>edu.usm.cos475.etl.App</mainClass>
                        </transformer>
                    </transformers>
                    </configuration>
                </execution>
                </executions>
            </plugin>
            </plugins>
        </build>