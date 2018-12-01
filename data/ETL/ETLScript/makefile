
help:
	@echo "generate-records is the target you're looking for"

pkg: 
	mvn clean
	mvn package

generate-records: pkg
	java -jar ./target/ETLScript-1.jar ../../../data/PUBLICINFO-April-2017.pdf > ../../UMS_APR_2017.csv
		java -jar ./target/ETLScript-1.jar ../../../data/PUBLICINFO-November-2017.pdf > ../../UMS_NOV_2017.csv
	java -jar ./target/ETLScript-1.jar ../../../data/PUBLICINFO-April-2016-1.pdf > ../../UMS_APR_2016.csv
	java -jar ./target/ETLScript-1.jar ../../../data/PUBLICINFO-November-2016.pdf > ../../UMS_NOV_2016.csv
	java -jar ./target/ETLScript-1.jar ../../../data/UMS_PUBLICINFO_MAIN_04-03-2018-Revised.pdf > ../../UMS_APR_2018.csv
	java -jar ./target/ETLScript-1.jar ../../../data/UMS_PUBLICINFO_MAIN_11-05-2018.pdf > ../../UMS_NOV_2018.csv