build:
	rm -rf public
	hugo
deploy: build
	aws s3 sync public/ s3://rayhog --acl public-read --delete
	aws configure set preview.cloudfront true
	aws cloudfront create-invalidation --distribution-id E36C8I0B79K7Z7 --paths '/*'
	