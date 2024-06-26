@component('mail::message')
    # Password Reset

    Your password reset code is {{$code}}.

    @slot('subcopy')
        You received this email because you attempt to reset your password on {{ config('app.name') }}.
        Note: Do not share this code with anyone.
    @endslot

    Thanks,
    {{ config('app.name') }}
@endcomponent
