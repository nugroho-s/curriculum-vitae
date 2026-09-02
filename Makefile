TEXLIVE_IMAGE ?= ghcr.io/xu-cheng/texlive-full

.PHONY: build clean watch

build:
	docker run --rm --user "$$(id -u):$$(id -g)" \
		-e HOME=/tmp \
		-v "$$PWD":/doc -w /doc \
		$(TEXLIVE_IMAGE) \
		sh -c 'tlmgr install titlesec enumitem xifthen >/dev/null 2>&1 || true; latexmk'

watch:
	docker run --rm --user "$$(id -u):$$(id -g)" \
		-e HOME=/tmp \
		-v "$$PWD":/doc -w /doc \
		$(TEXLIVE_IMAGE) \
		sh -c 'tlmgr install titlesec enumitem xifthen >/dev/null 2>&1 || true; latexmk -pvc'

clean:
	docker run --rm --user "$$(id -u):$$(id -g)" \
		-v "$$PWD":/doc -w /doc \
		$(TEXLIVE_IMAGE) latexmk -C
