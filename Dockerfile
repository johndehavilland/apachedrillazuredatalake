FROM drill/apache-drill

RUN mkdir odbcdl
RUN  cd odbcdl/

RUN curl http://package.mapr.com/tools/MapR-ODBC/MapR_Drill/MapRDrill_odbc_v1.3.22.1055/maprdrill-1.3.22.1055-1.x86_64.rpm -o maprdrill-1.3.22.1055-1.x86_64.rpm

RUN yum localinstall -y --nogpgcheck maprdrill-1.3.22.1055-1.x86_64.rpm

RUN cp /opt/mapr/drill/Setup/* ~
RUN mv ~/mapr.drillodbc.ini ~/.mapr.drillodbc.ini
COPY .odbc.ini ~/.odbc.ini
RUN mv ~/odbcinst.ini .odbcinst.ini

RUN export ODBCINI=~/.odbc.ini

RUN export MAPRDRILLINI=~/.mapr.drillodbc.ini

RUN export LD_LIBRARY_PATH=/usr/local/lib

COPY core-site.xml opt/drill/conf/core-site.xml
COPY storage-plugins-override.conf opt/drill/conf/storage-plugins-override.conf

RUN curl http://central.maven.org/maven2/org/apache/hadoop/hadoop-azure/2.7.3/hadoop-azure-2.7.3.jar -o /opt/drill/jars/3rdparty/hadoop-azure-2.7.3.jar
RUN curl http://central.maven.org/maven2/com/microsoft/azure/azure-data-lake-store-sdk/2.1.5/azure-data-lake-store-sdk-2.1.5.jar -o /opt/drill/jars/3rdparty/azure-data-lake-store-sdk-2.1.5.jar
RUN curl http://central.maven.org/maven2/org/apache/hadoop/hadoop-azure-datalake/3.0.0-alpha3/hadoop-azure-datalake-3.0.0-alpha3.jar -o /opt/drill/jars/3rdparty/hadoop-azure-datalake-3.0.0-alpha3.jar

EXPOSE 8047
EXPOSE 31010

ENTRYPOINT /opt/drill/bin/drill-embedded