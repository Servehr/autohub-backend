<?php

use App\Http\Controllers\Api\App\AdController;
use App\Http\Controllers\Api\App\AdminManagementController;
use App\Http\Controllers\Api\App\AuthenticationController;
use App\Http\Controllers\Api\App\MessageController;
use App\Http\Controllers\Api\App\NotificationController;
use App\Http\Controllers\Api\App\PaymentsnPlans;
use App\Http\Controllers\Api\App\SellController;
use App\Http\Controllers\Api\App\SliderController;
use App\Http\Controllers\Api\App\StoreController;
use App\Http\Controllers\Api\App\SwapController;
use App\Http\Controllers\Api\App\UserController;
use App\Http\Controllers\Api\App\VendorController;
use App\Http\Controllers\Api\App\WatchListController;
use App\Http\Controllers\Api\FrontendController;
use App\Http\Controllers\Api\DashboardController;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\FaqController;
use App\Http\Controllers\Api\ChatController;
use App\Http\Controllers\Api\PostController;
use App\Http\Controllers\Api\Dashboard\DashboardOverviewController;
use App\Http\Controllers\Api\Maceos\MACEOSController;
use App\Http\Controllers\Api\Maceos\TestQuestionaireController;
use App\Http\Controllers\Api\Maceos\ExamQuestionaireController;
use App\Http\Controllers\Api\Maceos\ExamQuestionController;
use App\Http\Controllers\Api\Maceos\TestQuestionController;
use App\Http\Controllers\Api\Maceos\Course\CourseController;
use App\Http\Controllers\Api\Maceos\Course\FrequentlyAskedController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Imagick as Imagick;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/



Route::prefix("app")->group(function () {
    Route::post('/test-image', [AdController::class, 'sendImageToServer']);
    Route::post('/login', [AuthenticationController::class, 'login']);
    Route::post('/buyer/register', [AuthenticationController::class, 'buyerRegister']);
    Route::post('/affiliate/register', [AuthenticationController::class, 'affiliateRegister']);
    Route::post('/vendor/register', [AuthenticationController::class, 'vendorRegister']);
    Route::post('/forget-password-sendcode', [AuthenticationController::class, 'forget_password_request']);
    Route::post('/forget-password-complete', [AuthenticationController::class, 'forget_password_complete']);
    Route::post('/new-password', [AuthenticationController::class, 'setUserNewPassword']);

    Route::get('/faq', [FaqController::class, 'allFaq']);
    Route::post('/faq', [FaqController::class, 'createFaq']);
    Route::post('/faq/{faq_id}', [FaqController::class, 'faqById']);
    Route::put('/faq', [FaqController::class, 'updateFaq']);
    Route::delete('/faq/{id}', [FaqController::class, 'deletFaq']);


    Route::middleware('auth:sanctum')->group(function() {
        Route::post('/follow', [AdController::class, 'userToFollow']);
        Route::get('/user-follower-count/{id}', [AdController::class, 'userFollowerCount']);
        Route::get('/chat-list', [ChatController::class, 'chatList']);
        Route::get('/conversations/{id}', [ChatController::class, 'conversations']);
        Route::post('send-message', [ChatController::class, 'sendMessage']);
        Route::get('initiate-conversation', [ChatController::class, 'initiateConversation']);
        Route::post('/login-out', [AuthenticationController::class, 'logOut']);
    });


    Route::get('/imagick', function(){
        $im = new Imagick(public_path('water/logo.png'));
        $im->thumbnailImage(200, null);
        return $im;
    });

    Route::middleware('auth:sanctum')->group(function() {
        Route::post('change-email', [AuthenticationController::class, 'changeEmail']);
        Route::post('change-phone-number', [AuthenticationController::class, 'changePhoneNumber']);
        Route::get('is-paid-and-summary', [AuthenticationController::class, 'isPaidAndSummary']);
        Route::post('upload-receipt', [AuthenticationController::class, 'uploadReceipt']);
    });

    // MACEOS
    Route::get('course-faq/{id}', [FrequentlyAskedController::class, 'frequently_asked']);
    Route::post('course-faq', [FrequentlyAskedController::class, 'create_asked_questions']);
    Route::put('course-faq-update', [FrequentlyAskedController::class, 'edit_asked_questions']);
    Route::delete('course-faq/{id}', [FrequentlyAskedController::class, 'delete_asked_questions']);

    Route::post('maceos-registration', [MACEOSController::class, 'ExistingUserRegistration']);
    Route::post('maceos-new-registration', [MACEOSController::class, 'NewRegistration']);
    Route::get('maceos-registration/{id}', [MACEOSController::class, 'UserInfo']);

    Route::post('create-course', [CourseController::class, 'create_course']);
    Route::get('all-course/{id}', [CourseController::class, 'all_courses']);  
    Route::get('get-course', [CourseController::class, 'all_courses']);  
    Route::put('update-course', [CourseController::class, 'edit_course']);  
    Route::delete('remove-course/{id}', [CourseController::class, 'delete_course']); 
    Route::post('upload-course-document', [CourseController::class, 'upload_course']);  
    Route::put('remove-course-material', [CourseController::class, 'remove_course']);   
    Route::get('test-questions', [TestQuestionController::class, 'test_questions']);  

    Route::post('create-test-questionaire', [TestQuestionaireController::class, 'create_test_questionaire']);
    Route::get('all-test-questionaires', [TestQuestionaireController::class, 'all_test_questionaire']);  
    Route::get('get-test-questionaires', [TestQuestionaireController::class, 'create_test_questionaire']);  
    Route::put('update-test-questionaires', [TestQuestionaireController::class, 'edit_test_questionaire']);  
    Route::delete('remove-test-questionaires/{id}', [TestQuestionaireController::class, 'delete_test_questionaire']);   
    Route::get('single-test-questionaires', [TestQuestionaireController::class, 'single_test_questionaire']);   

    Route::post('create-test-question', [TestQuestionController::class, 'create_test_question']);
    Route::get('all-test-question/{id}', [TestQuestionController::class, 'all_test_question']);  
    Route::get('get-test-questionaires', [TestQuestionController::class, 'create_test_question']);  
    Route::put('update-test-question', [TestQuestionController::class, 'edit_test_question']);  
    Route::delete('remove-test-question/{id}', [TestQuestionController::class, 'delete_test_question']); 
    
    //  test theory questionaire
    Route::post('create-test-theory-questionire', [TestQuestionaireController::class, 'create_test_questions_theory']);
    Route::get('all-test-theory-questionaire', [TestQuestionaireController::class, 'all_test_questions_theory']);  
    Route::get('all-test-theory-questionire/{id}', [TestQuestionaireController::class, 'all_test_theory_questions']);  
    Route::put('update-test-theory-questionaire', [TestQuestionaireController::class, 'edit_test_theory_question']);  
    Route::delete('remove-test-theory-questionaire/{id}', [TestQuestionaireController::class, 'delete_test_theory_question']);   
    Route::get('single-test-theory-questionire', [TestQuestionaireController::class, 'single_test_questions_theory']);   
    // end of test theory questionaire

    // theory questions 
    Route::post('create-test-theory-question', [TestQuestionController::class, 'create_test_questions_theory']);
    Route::get('all-test-theory-questions/{id}', [TestQuestionController::class, 'all_test_theory_question']);  
    Route::get('get-test-theory-questionaires', [TestQuestionController::class, 'create_test_questionaire_theory']);  
    Route::put('update-test-theory-question', [TestQuestionController::class, 'edit_test_theory_question']);  
    Route::delete('remove-test-theory-question/{id}', [TestQuestionController::class, 'delete_test_theory_question']);   
    Route::get('single-test-theory-questionaires', [TestQuestionController::class, 'test_theory_questions']); 
    // end of theory questions 

    // exam objective questionaire
    Route::post('create-exam-questionaire', [ExamQuestionaireController::class, 'create_exam_questionaire']);
    Route::get('all-exam-questionaires', [ExamQuestionaireController::class, 'all_exam_questionaire']);  
    Route::get('get-exam-questionaires', [ExamQuestionaireController::class, 'create_exam_questionaire']);  
    Route::put('update-exam-questionaires', [ExamQuestionaireController::class, 'edit_exam_questionaire']);  
    Route::delete('remove-exam-questionaires/{id}', [ExamQuestionaireController::class, 'delete_exam_questionaire']);   
    Route::get('single-exam-questionaires', [ExamQuestionaireController::class, 'single_exam_questionaire']);  

    // exam theory questionaire
    Route::post('create-exam-theory-questionaire', [ExamQuestionaireController::class, 'create_exam_questionaire_theory']);
    Route::get('all-exam-theory-questionaires', [ExamQuestionaireController::class, 'all_exam_questionaire_theory']);  
    // end of exam objective  questionaire

    // exam objective question
    Route::post('create-exam-question', [ExamQuestionController::class, 'create_exam_question']);
    Route::get('all-exam-question/{id}', [ExamQuestionController::class, 'all_exam_question']);   
    Route::put('update-exam-question', [ExamQuestionController::class, 'edit_exam_question']);  
    Route::delete('remove-exam-question/{id}', [ExamQuestionController::class, 'delete_exam_question']);  
    // end exam objective question

    // exam theory question
    Route::post('create-exam-theory-question', [ExamQuestionController::class, 'create_exam_questions_theory']);
    Route::get('all-exam-theory-question/{id}', [ExamQuestionController::class, 'all_exam_questionaire_theory']);  
    Route::put('update-exam-theory-question', [ExamQuestionController::class, 'edit_exam_theory_question']); 
    Route::delete('remove-exam-theory-question/{id}', [ExamQuestionController::class, 'delete_test_theory_question']);  
    // end of exam theory question

    // exam theory question
    // Route::post('create-exam-theory-question', [ExamQuestionController::class, 'create_exam_questions_theory']);
    // Route::get('all-exam-theory-question/{id}', [ExamQuestionController::class, 'all_exam_questionaire_theory']);  
    // Route::get('get-exam-questionaires', [ExamQuestionController::class, 'create_exam_question']);  
    // Route::put('update-exam-theory-question', [ExamQuestionController::class, 'edit_exam_theory_question']);  
    // Route::delete('remove-exam-theory-question/{id}', [ExamQuestionController::class, 'delete_test_theory_question']);     
    // exam theory question end

    // Dashbaord
    Route::get('dashboard-overview', [DashboardOverviewController::class, 'overview']);

    Route::get('sliders', [SliderController::class, 'index']);
    Route::get('qualifications', [AuthenticationController::class, 'qualifications']);
    Route::get('services', [AuthenticationController::class, 'services']);

        Route::prefix('ad')->group(function () {
            Route::get('list', [AdController::class, 'list']);
            Route::delete('delete/{id}', [AdController::class, 'deleteAdvert']);
            Route::get('list-by-category/{cat_id}', [AdController::class, 'listByCat']);
            Route::get('all-uploaded-product', [AdController::class, 'allProductsUploaded']);
            Route::get('sponsored', [AdController::class, 'sponsored']);
            Route::get('image-slider', [AdController::class, 'imageSlider']);
            Route::get('unpublish-ads', [AdController::class, 'unpublish']);
            Route::get('toppicks', [AdController::class, 'toppicks']);
            Route::post('product-sellable-price', [AdController::class, 'sellablePrice']);
            Route::get('view-details/{slug}', [AdController::class, 'viewDetails']);

            Route::middleware('auth:sanctum')->group(function() {
                Route::get('all-product', [AdController::class, 'allProduct']);
                Route::get('products/{current_page}/{per_page}', [AdController::class, 'products']);
                Route::get('product-search/{current_page}/{per_page}/{keyword}', [AdController::class, 'searchProduct']);
                Route::post('create-ad', [AdController::class, 'createAd']);
                Route::post('processing-create-ad', [AdController::class, 'ProcessingCreateAd']);
                Route::post('complete-create-ad', [AdController::class, 'CompleteCreateAd']);
                Route::put('update', [AdController::class, 'updateAds']);
                Route::post('add-product-ads', [AdController::class, 'addAnotherProduct']);
                Route::delete('remove-wish-list/{id}', [WatchListController::class, 'removeWishList']);
                Route::post('change-profile-picture', [AdController::class, 'ChangeProfilePicture']);
                Route::get('user-product-ads/{product_id}', [AdController::class, 'allUserPrductAds']);
                Route::delete('remove-user-product-ads/{image_id}/{product_id}', [AdController::class, 'removeUserProductImage']);
                // Route::get('search-product-advert/{keyword}', [AdController::class, 'searchProduct']);
                Route::post('face-advert', [AdController::class, 'faceAdvert']);
                Route::post('product-advert', [AdController::class, 'productAdvert']);
                Route::get('published-post/{currentPage}/{perPage}', [AdController::class, 'publishedPost']);
                Route::get('inactive-post/{currentPage}/{perPage}', [AdController::class, 'inActivePost']);
                Route::get('draft-post/{currentPage}/{perPage}', [AdController::class, 'draftPost']);
            });
            Route::get('advert-api/{product_id}', [AdController::class, 'allEnpointForAdvert']);
            Route::get('advert-api/{product_id}/{state_id}/{model_id}/{trim_id}', [AdController::class, 'allEnpointForAdvertEdit']);
            Route::get('single-product/{product_id}', [AdController::class, 'singleProduct']);
            Route::post('activate-product/{product_id}', [AdController::class, 'activateProduct']);
            Route::post('de-activate-product/{product_id}', [AdController::class, 'DeActivateProduct']);

            Route::get('list/state', [AdController::class, 'stateList']);
            Route::get('list-with-catogries-count', [AdController::class, 'categoryWithProductCount']);
            Route::get('list/state_lga', [AdController::class, 'stateLGAList']);
            Route::get('list/maker', [AdController::class, 'makerList']);
            Route::get('list/condition', [AdController::class, 'conditionList']);
            Route::get('list/transmission', [AdController::class, 'transmissionList']);
            Route::get('list/selected-model/{id}', [AdController::class, 'selectedModel']);
            Route::get('list/model', [AdController::class, 'modelList']);
            Route::get('list/trim', [AdController::class, 'trimList']);
            Route::get('list/category', [AdController::class, 'categoryList']);
            Route::get('list/colour', [AdController::class, 'colourList']);
            Route::get('list/search', [AdController::class, 'search']);
            Route::get('{id}/details', [AdController::class, 'details']);
            Route::get('{id}/more-from-vendor', [AdController::class, 'moreFromVendor']);
            Route::get('{id}/more-from-model', [AdController::class, 'moreFromModel']);
        });

        Route::prefix('swap')->group(function () {
            Route::post('create', [SwapController::class, 'create']);
            Route::get('list', [SwapController::class, 'list']);
            Route::get('list/sales_type', [SwapController::class, 'saleList']);
        });

        Route::get('product-message/{id}', [MessageController::class, 'showProduct']);

        Route::get('plans', [PaymentsnPlans::class, 'plans']);
        Route::get('boostplans', [PaymentsnPlans::class, 'boostPlans']);
        Route::get('view-blog/{current_page}/{per_page}', [PostController::class, 'viewBlog']);
        Route::get('blog-detail/{post_id}', [PostController::class, 'blogDetail']);

    Route::middleware('auth:sanctum')->group(function() {
        Route::post('post-blog', [PostController::class, 'postBlog']);
        Route::post('edit-blog', [PostController::class, 'editBlog']);
        Route::delete('delete-blog/{id}', [PostController::class, 'deleteBlog']);
        Route::get('view-blog/{post_id}', [PostController::class, 'viewSingleBlog']);
        Route::post('post-comment', [PostController::class, 'postComment']);
        Route::get('get-comments/{post_id}', [PostController::class, 'getPostComments']);
        Route::post('blog-detail-comment', [PostController::class, 'blogComment']);
        Route::get('search-posts/{current_page}/{per_page}/{keyword}', [PostController::class, 'searchPosts']);
    });

    Route::get('faq-product', [PostController::class, 'faqAndProduct']);
    // Route::get('fetch-data/{current_page}/{per_page}/{keyword}/{from}', [PostController::class, 'fetchDataFrom']);
    Route::get('fetch-data/{current_page}/{per_page}/{from}', [PostController::class, 'fetchDataFrom']);
    Route::post('update-avatar', [UserController::class, 'updateAvatar']);

    Route::middleware('auth:sanctum')->group(function() {
        Route::get('payments', [PaymentsnPlans::class, 'payments']);
        Route::get('payment/{id}', [PaymentsnPlans::class, 'paymentCheck']);
        Route::post('payment', [PaymentsnPlans::class, 'initiatePayment']);

        Route::get('notifications', [NotificationController::class, 'index']);

        Route::get('profile', [UserController::class, 'profile']);
        Route::post('profile', [UserController::class, 'updateProfile']);
        Route::post('update-user-info', [UserController::class, 'updateUserInfo']);
        Route::post('change-password', [UserController::class, 'changePassword']);

        Route::prefix('swap')->group(function () {
            Route::post('create', [SwapController::class, 'create']);
            Route::get('list', [SwapController::class, 'list']);
            Route::get('list/sales_type', [SwapController::class, 'saleList']);
        });

        Route::prefix('chat')->group(function () {
            Route::get('list', [ChatController::class, 'chatlist']);
            Route::post('conversation', [ChatController::class, 'conversation']);
            Route::get('conversations/{receiver}/{product_id}', [ChatController::class, 'conversations']);
        });


        Route::prefix('sell')->group(function () {
            Route::post('create', [SellController::class, 'create']);
            Route::get('list', [SellController::class, 'list']);
        });


        Route::prefix('store')->group(function () {
            Route::get('overview', [StoreController::class, 'overview']);
            Route::get('onsale', [StoreController::class, 'onSale']);
            Route::get('unposted', [StoreController::class, 'unposted']);
            Route::get('sold', [StoreController::class, 'sold']);
            Route::get('user-prouct/{id}', [StoreController::class, 'userProduct']);

        });

        Route::apiResource('watchlist', WatchListController::class);

        Route::get('watchlist/{product_id}/product', [WatchListController::class, 'product']);
        Route::get('user-watch-list/{currentPage}/{perPage}', [WatchListController::class, 'userWatchList']);

        Route::apiResource('message', MessageController::class);

        Route::prefix('vendor')->group(function () {
            Route::get('search', [VendorController::class, 'search']);
        });


    });


});

// admin user
Route::group(['prefix' => 'app/admin','middleware' => ['auth:sanctum', 'CheckAdminUser']], function () {
    Route::controller(AdminManagementController::class)->group(function () {
        Route::get('/state', 'stateList');
        Route::get('/sponsored', 'sponsored');
        Route::get('/state_lga', 'stateLGAList');
        Route::get('/maker', 'makerList');
        Route::get('/condition', 'conditionList');
        Route::get('/transmission', 'transmissionList');
        Route::get('/model', 'modelList');
        Route::get('/trim', 'trimList');
        Route::get('/category', 'categoryList');
        Route::get('/colour', 'colourList');
        Route::get('/products/{status}', 'list');
        Route::get('/{id}/product-details', 'details');
        Route::get('/view-product-details/{slug}', 'viewDetails');
    });
});
