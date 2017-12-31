require 'aws-sdk'

AWS.config({
  :access_key_id => '',
  :secret_access_key => ''
})
s3 = AWS.buckets['']

bucket = s3.buckets[]
tree   = buket.as_tree

directories = tree.children.select().collect()
directories.each{||
  puts directory
}

files = tree.children.select().collect()
files.each{|file|
  puts file
}

puts = ""
keys = bucket.objects.colelct(&:key)
keys.each{|key|
  puts key
}

puts = "sub folder"
tree = bucket.as_tree()
files = tree.children.select(0.collect()
files.each{|file|
  puts file
}

obj = s3.buckets[''].objects['']

obj.write('')

obj.read

