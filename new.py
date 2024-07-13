import os
import random
from glob import glob
from pyspark.sql import SparkSession
from pyspark.sql.functions import input_file_name
from pyspark.sql.types import StringType, StructType, StructField

# Initialize Spark session
spark = SparkSession.builder \
    .appName("MNIST Delta Table") \
    .config("spark.sql.extensions", "io.delta.sql.DeltaSparkSessionExtension") \
    .config("spark.sql.catalog.spark_catalog", "org.apache.spark.sql.delta.catalog.DeltaCatalog") \
    .config("spark.shuffle.service.enabled", "true") \
    .config("spark.dynamicAllocation.enabled", "true") \
    .config("spark.shuffle.io.retryWait", "60s") \
    .config("spark.shuffle.io.maxRetries", "10") \
    .config("spark.network.timeout", "800s") \
    .config("spark.sql.shuffle.partitions", "200") \
    .config("spark.executor.memory", "4g") \
    .config("spark.executor.cores", "2") \
    .getOrCreate()

# Directory path for MNIST images
mnist_path = "flat files/mnist_png/"
folders = [str(i) for i in range(10)]

# Schema for the DataFrame
schema = StructType([
    StructField("image_path", StringType(), True)
])

# Collect image paths
image_paths = []
for folder in folders:
    folder_path = os.path.join(mnist_path, folder)
    images = glob(os.path.join(folder_path, "*.png"))
    selected_images = random.sample(images, 6)
    for image in selected_images:
        image_paths.append((image,))

# Create DataFrame from the image paths
df = spark.createDataFrame(image_paths, schema=schema)

# Save DataFrame to a managed Delta Table without compression
delta_table_path = "flat files/delta/mnist"
df.write.format("delta").mode("overwrite").save(delta_table_path)

# Create a managed Delta table
spark.sql(f"CREATE TABLE mnist_table USING DELTA LOCATION '{delta_table_path}'")

# Show the data in the Delta table
spark.sql("SELECT * FROM mnist_table").show()

# Stop the Spark session
spark.stop()
