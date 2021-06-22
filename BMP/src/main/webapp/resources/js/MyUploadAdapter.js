class MyUploadAdapter {
    constructor(loader) {
        this.loader = loader;
    }

    upload() {
        return this.loader.file.then( file => new Promise(((resolve, reject) => {
            this._initRequest();
            this._initListeners( resolve, reject, file );
            this._sendRequest( file );
        })))
    }

    _initRequest() {
	console.log('console 1 실행... ');
        const xhr = this.xhr = new XMLHttpRequest();
        xhr.open('POST', 'fileUpload.do', true);
        xhr.responseType = 'json';
    }

    _initListeners(resolve, reject, file) {
	console.log('console 2 실행... ');
        const xhr = this.xhr;
        const loader = this.loader;
        const genericErrorText = '파일을 업로드 할 수 없습니다.'

        xhr.addEventListener('error', () => {reject(genericErrorText)})
        xhr.addEventListener('abort', () => reject())
        xhr.addEventListener('load', () => {
            const response = xhr.response
            if(!response || response.error) {
                return reject( response && response.error ? response.error.message : genericErrorText );
            }

            resolve({
                default: response.url //업로드된 파일 주소
            })
        })
    }

    _sendRequest(file) {
	console.log('console 3 실행... ');
        const data = new FormData()
        data.append('upload',file)
        this.xhr.send(data)
    }
}