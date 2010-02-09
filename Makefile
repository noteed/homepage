upload: uploaded

index.html: index.first.html build-info-gen.body.html first-stab-th.body.html index.last.html
	cat $^ > $@

first-stab-th.html first-stab-th.body.html: first-stab-th.txt
	carbonsuit -x $<

build-info-gen.html build-info-gen.body.html: build-info-gen.txt
	carbonsuit -x $<

uploaded-root: index.html my.css my-ga.js favicon.ico
	scp $? websv:/www/
	touch uploaded-root

uploaded-entry: build-info-gen.html first-stab-th.html
	scp $? websv:/www/entry/
	touch uploaded-entry

uploaded: uploaded-root uploaded-entry
	touch uploaded

clean:
	rm -rf index.html first-stab-th.html first-stab-th.body.html build-info-gen.html build-info-gen.body.html

