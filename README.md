# README

## Ubiquity Tech Test
https://ubiquitytt.herokuapp.com/

The brief for this test was to create an app that allowed for storage of CSV files on Amazon S3 andto view their contents

This solution uses TDD asa design and verification process. This was my first time working with AWS and S3 so a large amont of time was spent on configuration.

Things to improve:
- Mock the Amazon endpoint so that rspec didn't upload files to the bucket.
- Further styling especially of the upload#show page
- Refactor code out of Uploads controller into single responsibility classes.
- Use https://github.com/sorentwo/carrierwave-aws gem. I went for the aws-sdk as there was more documentation for me to understand its usage.

I would of course love to hear any feedback you have for me.
